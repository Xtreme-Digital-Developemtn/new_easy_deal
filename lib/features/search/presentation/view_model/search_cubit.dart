import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/features/search/data/models/cities_model.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';
import '../../../home/data/models/best_seller_units_model.dart';
import '../../data/repos/search_repo.dart';


class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchInitState());

  SearchRepo? searchRepo;

  static SearchCubit get(context) => BlocProvider.of(context);

  BestSellerUnitsModel? allUnitsModel;
  List<Data> allUnits = [];
  int currentPage = 1;
  int itemsPerPage = 10;
  bool hasMore = true;
  bool isLoadingMore = false;
  bool isLoading = false;
  // TC5: sequence token — rapid type/delete fires overlapping requests;
  // only the latest response may touch the UI, stale ones are discarded.
  // يشمل كمان طلبات التحميل الإضافي، عشان رد صفحة قديمة ما يتضافش
  // بعد refresh أو بحث جديد (تكرار وحدات).
  int _unitsRequestSeq = 0;

  /// رسالة خطأ آخر محاولة تحميل (أول صفحة أو صفحة إضافية)، حتى تعرضها الواجهة.
  String? unitsError;
  bool loadMoreFailed = false;

  Future<void> getAllUnits({
    bool? isFilter,
    bool loadMore = false,
    bool reset = false,
  })
  async {
    // منع التحميل المزدوج للصفحات الإضافية فقط.
    // البحث الفريش (reset/filter) مسموح يتجاوز طلب سابق — التوكن يهمل القديم (TC5).
    if (loadMore) {
      if (!hasMore || isLoadingMore || isLoading) return;
    }

    if (reset) {
      allUnits = [];
      currentPage = 1;
      hasMore = true;
      allUnitsModel = null;
      // أي تحميل إضافي كان شغّال بقى لاغي
      isLoadingMore = false;
    }

    if (loadMore) {
      loadMoreFailed = false;
    } else {
      unitsError = null;
      loadMoreFailed = false;
    }

    // إذا كان التحميل للصفحات التالية
    final int mySeq = ++_unitsRequestSeq;
    String requestKeyword = keyword;
    if (loadMore) {
      isLoadingMore = true;
      currentPage++;
      emit(GetAllUnitsLoadingMoreState()); // حالة تحميل إضافي
    } else {
      isLoading = true;
      emit(GetAllUnitsLoadingState()); // حالة تحميل أولي
      // capture query snapshot for this request
      requestKeyword = keyword;
    }

    int offset = (currentPage - 1) * itemsPerPage;
    var result = await searchRepo!.getAllUnits(
      limit: itemsPerPage,
      offset: offset,
      unitOperation: theProcess.toString(),
      area: areaId?.toString() ?? "",
      unitType: properType.toString(),
      priceFrom: priceFromCon.text,
      priceTo: priceToCon.text,
      unitAreaFrom: areaFromCon.text,
      unitAreaTo: areaToCon.text,
      deliveryStatus: deliveryStatus.toString(),
      compoundType: type.toString(),
      search: requestKeyword,
    );

    // TC5: تجاهل الاستجابات القديمة — الأحدث فقط هو اللي يحدّث الواجهة.
    if (mySeq != _unitsRequestSeq) return;

    return result.fold(
          (failure) {
        isLoading = false;
        isLoadingMore = false;
        unitsError = failure.errMessage;
        loadMoreFailed = loadMore;
        if (loadMore) {
          currentPage--; // تراجع عن زيادة الصفحة
        }
        emit(GetAllUnitsErrorState(failure.errMessage));
      },
          (data) async {
        isLoading = false;
        isLoadingMore = false;
        unitsError = null;
        loadMoreFailed = false;

        final List<Data> page = data.data ?? [];

        if (loadMore) {
          // إضافة الجديد فقط، مع استبعاد أي وحدة موجودة بالفعل
          final existingIds = allUnits.map((e) => e.id).toSet();
          allUnits.addAll(
            page.where((e) => e.id == null || !existingIds.contains(e.id)),
          );
          hasMore = _computeHasMore(page, data.count);
          // تحديث النموذج مع البيانات الكاملة
          allUnitsModel = BestSellerUnitsModel(
            data: allUnits,
            message: data.message,
            status: data.status,
            count: data.count,
          );

          emit(GetAllUnitsLoadMoreSuccessState(allUnitsModel!)); // نجاح تحميل إضافي
        } else {
          // حفظ البيانات الجديدة
          allUnits = page;
          allUnitsModel = data;
          hasMore = _computeHasMore(page, data.count);
          if (isFilter == true) {
            emit(GetAllUnitsFilterSuccessState(allUnitsModel!));
          } else {
            emit(GetAllUnitsSuccessState(allUnitsModel!));
          }
        }
      },
    );
  }

  /// فيه صفحات تانية؟ الصفحة الناقصة معناها النهاية، وكذلك لو وصلنا للعدد الكلي.
  bool _computeHasMore(List<Data> page, int? count) {
    if (page.length < itemsPerPage) return false;
    if (count != null && allUnits.length >= count) return false;
    return true;
  }

  // دالة لتحميل المزيد من البيانات
  Future<void> loadMoreUnits() async {
    await getAllUnits(loadMore: true);
  }

  /// إعادة محاولة التحميل بعد خطأ: تكمّل من نفس المكان لو كان الخطأ في صفحة إضافية.
  Future<void> retryUnits() async {
    if (loadMoreFailed && allUnits.isNotEmpty) {
      await getAllUnits(loadMore: true);
    } else {
      await getAllUnits(reset: true);
    }
  }

  // باقي الكود كما هو...
  String? properType;

  void selectProperType(type) {
    properType = type;
    emit(SelectProperTypeState());
  }

  final Map<String, String> properTypes = {
    LangKeys.apartments.tr(): 'apartments',
    LangKeys.duplexes.tr(): 'duplexes',
    LangKeys.studios.tr(): 'studios',
    LangKeys.penthouses.tr(): 'penthouses',
    LangKeys.roofs.tr(): 'roofs',
    LangKeys.villas.tr(): 'villas',
    LangKeys.iVilla.tr(): 'i_villa',
    LangKeys.twinHouses.tr(): 'twin_houses',
    LangKeys.townHouses.tr(): 'town_houses',
    LangKeys.administrativeUnits.tr(): 'administrative_units',
    LangKeys.medicalClinics.tr(): 'medical_clinics',
    LangKeys.pharmacies.tr(): 'pharmacies',
    LangKeys.commercialStores.tr(): 'commercial_stores',
    LangKeys.warehouseLands.tr(): 'warehouses',
    LangKeys.chalets.tr(): 'chalets',
    LangKeys.shops.tr(): 'shops',
  };

  String? theProcess;
  void selectTheProcess(process) {
    theProcess = process;
    emit(SelectTheProcessState());
  }

  final Map<String, String> process = {
    LangKeys.sell.tr(): 'sell',
    LangKeys.purchasing.tr(): 'purchasing',
  };

  String? deliveryStatus;
  void selectDeliveryStatus(newDeliveryStatus) {
    deliveryStatus = newDeliveryStatus;
    emit(SelectDeliveryStatusState());
  }

  final Map<String, String> status = {
    LangKeys.immediateDelivery.tr(): 'immediate_delivery',
    LangKeys.underConstruction.tr(): 'under_construction',
  };

  String? type;
  void selectType(newType) {
    type = newType;
    emit(SelectTypeState());
  }

  final Map<String, String> types = {
    LangKeys.insideCompound.tr(): 'inside_compound',
    LangKeys.outsideCompound.tr(): 'outside_compound',
  };

  var searchCon = TextEditingController();
  String keyword = '';
  var priceFromCon = TextEditingController();
  var priceToCon = TextEditingController();
  var areaToCon = TextEditingController();
  var areaFromCon = TextEditingController();

  void onSearchChanged(String value) {
    keyword = value;
    getAllUnits(reset: true);
  }

  void resetFilters() {
    properType = null;
    theProcess = null;
    deliveryStatus = null;
    type = null;
    city = null;
    area = null;

    searchCon.clear();
    keyword = '';
    priceFromCon.clear();
    priceToCon.clear();
    areaFromCon.clear();
    areaToCon.clear();

    getAllUnits(reset: true);
    emit(ResetFiltersState());
  }





  CitiesModel? citiesModel;
  AreasModel? areasModel;

  Future<void> getAllCities() async {
    emit(GetAllCitiesLoadingState());
    var result = await searchRepo!.getAllCities();
    result.fold(
          (failure) => emit(GetAllCitiesErrorState(failure.errMessage)),
          (data) {
        citiesModel = data;
        emit(GetAllCitiesSuccessState(data));
      },
    );
  }

  Future<void> getAllAreas({required int cityId}) async {
    emit(GetAllAreasLoadingState());
    var result = await searchRepo!.getAllAreas(cityId: cityId);
    result.fold(
          (failure) => emit(GetAllAreasErrorState(failure.errMessage)),
          (data) {
        areasModel = data;
        emit(GetAllAreasSuccessState(data));
      },
    );
  }

  String? city;
  int? cityId;
  void selectTheCity(Cities newCity) {
    city = newCity.nameAr;
    cityId = newCity.id;
    area = null;
    areaId = null;
    areasModel = null;
    getAllAreas(cityId: cityId!);
  }

  String? area;
  int? areaId;
  void selectTheArea(Areas newArea) {
    area = newArea.nameAr;
    areaId = newArea.id;
    emit(SelectTheAreaState());
  }







}

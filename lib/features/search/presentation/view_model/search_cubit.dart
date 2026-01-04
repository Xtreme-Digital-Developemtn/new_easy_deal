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
  int itemsPerPage = 3;
  bool hasMore = true;
  bool isLoadingMore = false;
  bool isLoading = false;

  Future<void> getAllUnits({
    bool? isFilter,
    bool loadMore = false,
    bool reset = false,
  }) async {
    // منع التحميل المزدوج
    if (loadMore) {
      if (!hasMore || isLoadingMore || isLoading) return;
    } else {
      if (isLoading) return;
    }

    if (reset) {
      allUnits = [];
      currentPage = 1;
      hasMore = true;
      allUnitsModel = null;
    }

    // إذا كان التحميل للصفحات التالية
    if (loadMore) {
      isLoadingMore = true;
      currentPage++;
      emit(GetAllUnitsLoadingMoreState()); // حالة تحميل إضافي
    } else {
      isLoading = true;
      emit(GetAllUnitsLoadingState()); // حالة تحميل أولي
    }

    int offset = (currentPage - 1) * itemsPerPage;
    var result = await searchRepo!.getAllUnits(
      limit: itemsPerPage,
      offset: offset,
      unitOperation: theProcess.toString(),
      area: "",
      unitType: properType.toString(),
      priceFrom: priceFromCon.text,
      priceTo: priceToCon.text,
      unitAreaFrom: areaFromCon.text,
      unitAreaTo: areaToCon.text,
      deliveryStatus: deliveryStatus.toString(),
      compoundType: type.toString(),
    );

    return result.fold(
          (failure) {
        isLoading = false;
        isLoadingMore = false;
        if (loadMore) {
          currentPage--; // تراجع عن زيادة الصفحة
        }
        emit(GetAllUnitsErrorState(failure.errMessage));
      },
          (data) async {
        isLoading = false;
        isLoadingMore = false;

        // التحقق إذا كانت هناك بيانات
        bool hasData = data.data != null && data.data!.isNotEmpty;
        hasMore = hasData && data.data!.length >= itemsPerPage;

        if (loadMore) {
          // إضافة البيانات الجديدة للقائمة الحالية
          allUnits.addAll(data.data ?? []);
          // تحديث النموذج مع البيانات الكاملة
          allUnitsModel = BestSellerUnitsModel(
            data: allUnits,
            message: data.message,
            status: data.status,
          );
          emit(GetAllUnitsLoadMoreSuccessState(allUnitsModel!)); // نجاح تحميل إضافي
        } else {
          // حفظ البيانات الجديدة
          allUnits = data.data ?? [];
          allUnitsModel = data;
          if (isFilter == true) {
            emit(GetAllUnitsFilterSuccessState(allUnitsModel!));
          } else {
            emit(GetAllUnitsSuccessState(allUnitsModel!));
          }
        }
      },
    );
  }

  // دالة لتحميل المزيد من البيانات
  Future<void> loadMoreUnits() async {
    await getAllUnits(loadMore: true);
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

  var priceFromCon = TextEditingController();
  var priceToCon = TextEditingController();
  var areaToCon = TextEditingController();
  var areaFromCon = TextEditingController();

  void resetFilters() {
    properType = null;
    theProcess = null;
    deliveryStatus = null;
    type = null;
    city = null;
    area = null;

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
    areasModel = null; // عمل Reset للمناطق
    getAllAreas(cityId: cityId!);
    // emit(SelectTheCityState());
  }

  String? area;
  int? areaId;
  void selectTheArea(Areas newArea) {
    area = newArea.nameAr;
    areaId = newArea.id;
    emit(SelectTheAreaState());
  }







}

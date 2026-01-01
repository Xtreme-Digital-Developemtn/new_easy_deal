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
  int itemsPerPage = 12;
  bool hasMore = true;
  bool isLoadingMore = false;
  Future<void> getAllUnits({
      bool? isFilter,
    bool loadMore = false,
    bool reset = false,
})
  async {
    if (reset) {
      allUnits = [];
      currentPage = 1;
      hasMore = true;
      allUnitsModel = null;
    }
    // إذا كان التحميل للصفحات التالية
    if (loadMore) {
      if (!hasMore || isLoadingMore) return;
      isLoadingMore = true;
      currentPage++;
      emit(GetAllUnitsLoadingMoreState());
    } else {
      emit(GetAllUnitsLoadingState());
    }

    int offset = (currentPage - 1) * itemsPerPage;
    var result = await searchRepo!.getAllUnits(
      limit: 12,
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
        if (loadMore) {
          currentPage--; // تراجع عن زيادة الصفحة
          isLoadingMore = false;
        }
        emit(GetAllUnitsErrorState(failure.errMessage));
      },
      (data) async {
        isLoadingMore = false;
        hasMore = data.data != null && data.data!.length >= itemsPerPage;
        if (loadMore) {
          // إضافة البيانات الجديدة للقائمة الحالية
          allUnits.addAll(data.data ?? []);
          // تحديث النموذج مع البيانات الكاملة
          allUnitsModel = data;
        } else {
          // حفظ البيانات الجديدة
          allUnits = data.data ?? [];
          allUnitsModel = data;
        }
        if (isFilter == true) {
          emit(GetAllUnitsFilterSuccessState(allUnitsModel!));
        } else {
          emit(GetAllUnitsSuccessState(allUnitsModel!));
        }
      },
    );
  }

  // دالة لتحميل المزيد من البيانات
  Future<void> loadMoreUnits() async {
    if (!hasMore || isLoadingMore) return;
    await getAllUnits(loadMore: true);
  }


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

    priceFromCon.clear();
    priceToCon.clear();
    areaFromCon.clear();
    areaToCon.clear();

    // إعادة تعيين البيانات وتحميل الصفحة الأولى
    getAllUnits(reset: true);
    emit(ResetFiltersState());
  }
}

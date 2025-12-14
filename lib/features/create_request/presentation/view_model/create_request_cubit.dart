import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main_imports.dart';
import '../../data/models/category_model.dart';
import '../../data/repos/create_request_repo.dart';
import 'create_request_states.dart';


class CreateRequestCubit extends Cubit<CreateRequestStates> {
  CreateRequestCubit(this.aboutUsRepo) : super(CreateRequestInitState());

  CreateRequestRepo? aboutUsRepo;

  static CreateRequestCubit get(context) => BlocProvider.of(context);


  var addressCon = TextEditingController();
  var locationLinkCon = TextEditingController();
  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: LangKeys.buyingProperty.tr(), image: SvgImages.house),
    CategoryModel(id: 2, name:LangKeys.propertyRental.tr(),  image: SvgImages.key),
    CategoryModel(id: 3, name:LangKeys.propertyForSale.tr(),  image: SvgImages.buy),
    CategoryModel(id: 4, name:LangKeys.rentingProperty.tr(),  image: SvgImages.transfer),
    CategoryModel(id: 5, name:LangKeys.rentHotelUnit.tr(),  image: SvgImages.hands),
    CategoryModel(id: 6, name:LangKeys.rentingHotelUnit.tr(),  image: SvgImages.welfare),
  ];

  int selectedIndex = -1;

  void selectCategory(int index) {
    selectedIndex = index;
    emit(CategorySelectedState(selectedIndex));
  }



  String? selectedSpecialization ;
  void selectSpecialization(String? specialization) {
    selectedSpecialization = specialization!;
    emit(SelectSpecializationState());
  }

  String? selectedDealType ;
  void selectDealType(String? dealType) {
    selectedDealType = dealType!;
    emit(SelectDealTypeState());
  }

  String? selectedUnitType ;
  void selectUnitType(String? unitType) {
    selectedUnitType = unitType!;
    emit(SelectUnitTypeState());
  }


  int currentStepNumber = 1;
  void moveNextStep(step)
  {
    currentStepNumber = step;
    emit(MoveNextStepState());
  }


  String? selectedCity ;
  void selectCity(String? city) {
    selectedCity = city!;
    emit(SelectCityState());
  }
  String? selectedArea ;
  void selectArea(String? area) {
    selectedArea = area!;
    emit(SelectAreaState());
  }
  String? selectedSubArea ;
  void selectSubArea(String? subArea) {
    selectedSubArea = subArea!;
    emit(SelectSubAreaState());
  }

  String? selectedUnitLocationFromTheFront ;
  void selectUnitLocationFromTheFront(String? unitLocationFromTheFrontState) {
    selectedUnitLocationFromTheFront = unitLocationFromTheFrontState!;
    emit(SelectUnitLocationFromTheFrontState());
  }

  String? selectedPaymentSystem ;
  void selectPaymentSystem(String? paymentSystem) {
    selectedPaymentSystem = paymentSystem!;
    emit(SelectPaymentSystemState());
  }


  String? selectedTheUnitView ;
  void selectTheUnitView(String? theUnitView) {
    selectedTheUnitView = theUnitView!;
    emit(SelectTheUnitViewState());
  }

  String? selectedFinishingCondition ;
  void selectFinishingCondition(String? finishingCondition) {
    selectedFinishingCondition = finishingCondition!;
    emit(SelectFinishingConditionState());
  }

  String? selectedDeliveryStatus ;
  void selectDeliveryStatus(String? deliveryStatus) {
    selectedDeliveryStatus = deliveryStatus!;
    emit(SelectDeliveryStatusState());
  }

  String? selectedOtherLuxuries ;
  void selectOtherLuxuries(String? otherLuxuries) {
    selectedOtherLuxuries = otherLuxuries!;
    emit(SelectOtherLuxuriesState());
  }


  String? selectedFloor ;
  void selectFloor(String? floor) {
    selectedFloor = floor!;
    emit(SelectFloorState());
  }

  final ImagePicker picker = ImagePicker();
  File? mainImage;

  Future<void> pickMainImage({
    required CreateRequestStates newEmit,
  })
  async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        mainImage = File(pickedFile.path);
        validateUnitDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking commercial file: $e");
      emit(UploadImageErrorState());
    }
  }
  final ValueNotifier<bool> isUnitDocumentsValid = ValueNotifier(false);
  void validateUnitDocuments() {
    bool isValid = mainImage != null &&
        video != null &&
        financialStatementImage != null &&
        masterPlanImage != null;

    isUnitDocumentsValid.value = isValid;
  }


  void clearMainImage({
    required CreateRequestStates newEmit,
  }) {
    mainImage = null;
    validateUnitDocuments();
    emit(newEmit);
  }


  File? video;
  File? financialStatementImage;
  File? masterPlanImage;
  Future<void> pickVideo({
    required CreateRequestStates newEmit,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(minutes: 2),
      );

      if (pickedFile != null) {
        video = File(pickedFile.path);
        validateUnitDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking video: $e");
      emit(UploadImageErrorState());
    }
  }

  Future<void> pickFinancialStatementImage({
    required CreateRequestStates newEmit,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        financialStatementImage = File(pickedFile.path);
        validateUnitDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking financial statement image: $e");
      emit(UploadImageErrorState());
    }
  }

  Future<void> pickMasterPlanImage({
    required CreateRequestStates newEmit,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        masterPlanImage = File(pickedFile.path);
        validateUnitDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking master plan image: $e");
      emit(UploadImageErrorState());
    }
  }
  void clearVideo({
    required CreateRequestStates newEmit,
  }) {
    video = null;
    validateUnitDocuments();
    emit(newEmit);
  }

  void clearFinancialStatementImage({
    required CreateRequestStates newEmit,
  }) {
    financialStatementImage = null;
    validateUnitDocuments();
    emit(newEmit);
  }

  void clearMasterPlanImage({
    required CreateRequestStates newEmit,
  }) {
    masterPlanImage = null;
    validateUnitDocuments();
    emit(newEmit);
  }


  List<String> titleNames = [
    LangKeys.orderSettings.tr(),
    LangKeys.siteInformation.tr(),
    LangKeys.unitData.tr(),
    LangKeys.projectDocuments.tr(),
    LangKeys.financialInformation.tr(),
  ];











}
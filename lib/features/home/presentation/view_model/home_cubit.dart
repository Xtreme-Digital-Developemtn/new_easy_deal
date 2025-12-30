import 'package:easy_deal/features/home/data/models/unit_types_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main_imports.dart';
import '../../data/models/best_seller_units_model.dart';
import '../../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitState());

  HomeRepo? homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentSliderIndex = 0;

  changeHomeSliderImages(index) {
    currentSliderIndex = index;
    emit(ChangeHomeSliderImageState());
  }

  //  List<String> sliderImagesList = ["assets/images/pngs/banner.png" , "assets/images/pngs/banner.png2.png"];
  List<String> sliderImagesList = [
    "https://images.unsplash.com/photo-1469022563428-aa04fef9f5a2?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1626036144963-33ded4a8ab8d?q=80&w=1174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  List<String> categories = [
    LangKeys.requestToPurchaseProperty.tr(),
    LangKeys.requestToRentalProperty.tr(),
    LangKeys.requestToSaleProperty.tr(),
    LangKeys.requestToRentProperty.tr(),
    LangKeys.requestToRentingHotelUnit.tr(),
    LangKeys.requestToRentHotelUnit.tr(),
  ];

  int selectCategory = 0;

  chooseCategory(index) {
    selectCategory = index;
    emit(ChooseCategoryState());
  }

  BestSellerUnitsModel? bestSellerUnitsModel;

  Future<void> getBestSellerUnitsInHome() async {
    emit(GetBestSellerUnitsInHomeLoadingState());
    var result = await homeRepo!.getBestSellerUnitsInHome();
    return result.fold(
      (failure) {
        emit(GetBestSellerUnitsInHomeErrorState(failure.errMessage));
      },
      (data) async {
        bestSellerUnitsModel = data;
        emit(GetBestSellerUnitsInHomeSuccessState(data));
      },
    );
  }

  UnitTypesModel? unitTypesModel;

  Future<void> getUnitTypes() async {
    emit(GetUnitTypesLoadingState());
    var result = await homeRepo!.getUnitTypes();
    return result.fold(
      (failure) {
        emit(GetUnitTypesErrorState(failure.errMessage));
      },
      (data) async {
        unitTypesModel = data;
        emit(GetUnitTypesSuccessState(data));
      },
    );
  }

  List<String> lastArticlesImages = [
    "assets/images/jpgs/1.jpg",
    "assets/images/jpgs/2.jpg",
    "assets/images/jpgs/3.jpg",
    "assets/images/jpgs/4.jpg",
    "assets/images/jpgs/5.jpg",
    "assets/images/jpgs/6.jpg",
    "assets/images/jpgs/7.jpg",
  ];

  List<String> lastArticlesTitles = [
    LangKeys.article1Title.tr(),
    LangKeys.article2Title.tr(),
    LangKeys.article3Title.tr(),
    LangKeys.article4Title.tr(),
    LangKeys.article5Title.tr(),
    LangKeys.article6Title.tr(),
    LangKeys.article7Title.tr(),
  ];

  List<String> lastArticlesDescription = [
    LangKeys.article1Description.tr(),
    LangKeys.article2Description.tr(),
    LangKeys.article3Description.tr(),
    LangKeys.article4Description.tr(),
    LangKeys.article5Description.tr(),
    LangKeys.article6Description.tr(),
    LangKeys.article7Description.tr(),
  ];

  List<String> locationsTitles = [
    LangKeys.location1Title.tr(),
    LangKeys.location2Title.tr(),
    LangKeys.location3Title.tr(),
    LangKeys.location4Title.tr(),
  ];

  List<String> locationsImages = [
    "assets/images/jpgs/locations/1.jpg",
    "assets/images/jpgs/locations/2.jpg",
    "assets/images/jpgs/locations/3.jpg",
    "assets/images/jpgs/locations/4.jpg",
  ];
}

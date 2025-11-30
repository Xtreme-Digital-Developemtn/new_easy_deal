

import '../../../../main_imports.dart';
import '../../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitState());

  HomeRepo? homeRepo;
  static HomeCubit get(context) => BlocProvider.of(context);


  int currentSliderIndex = 0;
  changeHomeSliderImages(index)
  {
    currentSliderIndex = index;
    emit(ChangeHomeSliderImageState());
  }

  List<String> sliderImagesList = ["assets/images/pngs/banner.png" , "assets/images/pngs/banner.png2.png"];


  List<String> categories = ["Residential" , "Medical" , "Commercial" , "Admission" , "Admission" , "Commercial"];

  int selectCategory = 0;
  chooseCategory(index)
  {
    selectCategory = index;
    emit(ChooseCategoryState());
  }


}
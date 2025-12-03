

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

//  List<String> sliderImagesList = ["assets/images/pngs/banner.png" , "assets/images/pngs/banner.png2.png"];
  List<String> sliderImagesList = ["https://images.unsplash.com/photo-1469022563428-aa04fef9f5a2?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" ,
    "https://images.unsplash.com/photo-1626036144963-33ded4a8ab8d?q=80&w=1174&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"];


  List<String> categories = ["Residential" , "Medical" , "Commercial" , "Admission" , "Admission" , "Commercial"];

  int selectCategory = 0;
  chooseCategory(index)
  {
    selectCategory = index;
    emit(ChooseCategoryState());
  }


}
import 'package:easy_deal/features/about_us/data/models/about_us_model.dart';
import '../../../../main_imports.dart';
import '../../data/repos/about_us_repo.dart';
import 'about_us_states.dart';


class AboutUsCubit extends Cubit<AboutUsStates> {
  AboutUsCubit(this.aboutUsRepo) : super(AboutUsInitState());

  AboutUsRepo? aboutUsRepo;

  static AboutUsCubit get(context) => BlocProvider.of(context);



  AboutUsModel? aboutUsModel;

  Future<void> getAboutUs() async {
    emit(GetAboutUsLoadingState());
    var result = await aboutUsRepo!.getAboutUs();
    return result.fold(
          (failure) {
        emit(GetAboutUsErrorState(failure.errMessage));
      },
          (data) async {
            aboutUsModel = data;
        emit(GetAboutUsSuccessState(data));
      },
    );
  }

}
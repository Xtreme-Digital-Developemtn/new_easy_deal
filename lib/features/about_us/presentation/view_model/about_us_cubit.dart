import '../../../../main_imports.dart';
import '../../data/repos/about_us_repo.dart';
import 'about_us_states.dart';


class AboutUsCubit extends Cubit<AboutUsStates> {
  AboutUsCubit(this.aboutUsRepo) : super(AboutUsInitState());

  AboutUsRepo? aboutUsRepo;

  static AboutUsCubit get(context) => BlocProvider.of(context);




}

import '../../../../main_imports.dart';
 import '../../data/repos/otp_repo.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit(this.otpRepo) : super(OtpInitState());

  OtpRepo? otpRepo;

  static OtpCubit get(context) => BlocProvider.of(context);



}
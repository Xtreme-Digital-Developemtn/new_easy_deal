
import 'package:easy_deal/features/otp/data/models/send_otp_model.dart';

import '../../../../main_imports.dart';
 import '../../data/repos/otp_repo.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit(this.otpRepo) : super(OtpInitState());

  OtpRepo? otpRepo;

  static OtpCubit get(context) => BlocProvider.of(context);


  // ==================== Send Otp ====================
  SendOtpModel? sendOtpModel;
  Future<void> sendOtp({
    required String phone,
  })
  async {
    emit(SendOtpLoadingState());
    final result = await otpRepo!.sendOtp(phone:phone);
    return result.fold(
          (failure) {
        emit(SendOtpErrorState(failure.errMessage));
      },
          (data) async {
            sendOtpModel = data;
        emit(SendOtpSuccessState(data));
        CacheHelper.saveData(key: "phone", value: phone);
      },
    );
  }
}
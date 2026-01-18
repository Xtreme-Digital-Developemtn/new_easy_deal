import 'package:easy_deal/features/contact_us/data/models/contact_us_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main_imports.dart';
import '../../data/repos/contact_us_repo.dart';
import 'contact_us_states.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitState());

  ContactUsRepo? contactUsRepo;

  static ContactUsCubit get(context) => BlocProvider.of(context);

  Future<void> openMap(String query) async {
    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$query",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> makeCall(String phone) async {
    final Uri url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri url = Uri.parse("mailto:$email");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> openWebsite(String site) async {
    final Uri url = Uri.parse(site);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  var emailCon = TextEditingController();
  var addressCon = TextEditingController();
  ContactUsModel? contactUsModel;

  Future<void> contactUs() async {
    emit(ContactUsLoadingState());
    var result = await contactUsRepo!.contactUs();
    return result.fold(
      (failure) {
        emit(ContactUsErrorState(failure.errMessage));
      },
      (data) async {
        contactUsModel = data;
        emit(ContactUsSuccessState(data));
      },
    );
  }
}

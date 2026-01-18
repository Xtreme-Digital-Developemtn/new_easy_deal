import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/contact_us_model.dart';
import 'contact_us_repo.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final ApiService? apiService;

  ContactUsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ContactUsModel>> contactUs() async {
    try {
      var response = await apiService!.getData(
          endPoint: EndPoints.contactUs,
      );
      ContactUsModel result = ContactUsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}

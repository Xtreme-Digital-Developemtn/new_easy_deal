import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/privacy_terms/data/repos/privacy_terms_repo.dart';
import '../../../../main_imports.dart';
import '../models/terms_model.dart';


class PrivacyTermsRepoImpl implements PrivacyTermsRepo {
  final ApiService? apiService;
  PrivacyTermsRepoImpl(this.apiService);




@override
Future<Either<Failure, TermsModel>> getTerms() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.contentTerms,
    );
    TermsModel result = TermsModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}
import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/faqs_model.dart';
import 'faqs_repo.dart';


class FAQsRepoImpl implements FAQsRepo {
  final ApiService? apiService;
  FAQsRepoImpl(this.apiService);




@override
Future<Either<Failure, FaqsModel>> getAllFaqs() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.faqs,
    );
    FaqsModel result = FaqsModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}
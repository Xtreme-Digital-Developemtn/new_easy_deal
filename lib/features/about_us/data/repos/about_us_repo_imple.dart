import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/about_us_model.dart';
import 'about_us_repo.dart';


class AboutUsRepoImpl implements AboutUsRepo {
  final ApiService? apiService;
  AboutUsRepoImpl(this.apiService);




@override
Future<Either<Failure, AboutUsModel>> getAboutUs() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.aboutUs,
    );
    AboutUsModel result = AboutUsModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}
import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/contact_us_model.dart';
import 'contact_us_repo.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final ApiService? apiService;

  ContactUsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ContactUsModel>> contactUs({
    required String email,
    required String phone,
    required String address,
  }) async {
    try {
      var data = json.encode({
        "email": email,
        "phone": phone,
        "address": address,
        // "whatsapp": "+966 50 123 4567"
      });
      var response = await apiService!.putData(
          endPoint: EndPoints.contactUs,
        data: data,
      );
      ContactUsModel result = ContactUsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}

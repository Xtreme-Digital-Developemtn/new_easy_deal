import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../main_imports.dart';
import '../models/developer_projects_model.dart';
import '../models/developers_model.dart';
import 'broker_developers_repo.dart';

class BrokerDevelopersRepoImpl implements BrokerDevelopersRepo {
  final ApiService? apiService;
  BrokerDevelopersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DevelopersModel>> getDevelopers() async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.developers,
      );
      DevelopersModel result = DevelopersModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(int developerId) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.developerProjects,
        query: {
          "limit": 10,
          "offset": 0,
          "sort": "desc",
          "sortBy": "id",
          "developerId": developerId,
        },
      );
      DeveloperProjectsModel result = DeveloperProjectsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendContractRequest({
    required int brokerId,
    required int developerId,
    File? image,
    File? idFront,
    File? idBack,
    File? commercialRegistryImage,
    File? taxCardImage,
  }) async {
    try {
      final formData = FormData();
      formData.fields.add(MapEntry('brokerId', brokerId.toString()));
      formData.fields.add(MapEntry('developerId', developerId.toString()));

      if (image != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
        ));
      }
      if (idFront != null) {
        formData.files.add(MapEntry(
          'idFront',
          await MultipartFile.fromFile(idFront.path, filename: idFront.path.split('/').last),
        ));
      }
      if (idBack != null) {
        formData.files.add(MapEntry(
          'idBack',
          await MultipartFile.fromFile(idBack.path, filename: idBack.path.split('/').last),
        ));
      }
      if (commercialRegistryImage != null) {
        formData.files.add(MapEntry(
          'commercialRegistryImage',
          await MultipartFile.fromFile(commercialRegistryImage.path, filename: commercialRegistryImage.path.split('/').last),
        ));
      }
      if (taxCardImage != null) {
        formData.files.add(MapEntry(
          'taxCardImage',
          await MultipartFile.fromFile(taxCardImage.path, filename: taxCardImage.path.split('/').last),
        ));
      }

      var response = await apiService!.postData(
        endPoint: EndPoints.brokerRequest,
        data: formData,
      );
      return right(Map<String, dynamic>.from(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }
}
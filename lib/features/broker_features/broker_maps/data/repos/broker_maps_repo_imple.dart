import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../main_imports.dart';
import '../models/add_map_model.dart';
import '../models/map_location_model.dart';
import 'broker_maps_repo.dart';

class BrokerMapsRepoImpl implements BrokerMapsRepo {
  final ApiService? apiService;
  BrokerMapsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BrokerMapsModel>> getMaps({required int brokerId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: '${EndPoints.brokerMaps}?limit=50&offset=0&sort=DESC&sortBy=id&brokerId=$brokerId',
      );
      BrokerMapsModel result = BrokerMapsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, AddMapModel>> addMap({required File image,
    required int brokerId,
    required String description}) async {
    try {
      final formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path, filename: "map.png"),
        "description": description,
      });
      var response = await apiService!.postData(
        endPoint: "broker/$brokerId/create-map",
        data: formData,
        isMultipart: true,
      );
      AddMapModel result = AddMapModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

}
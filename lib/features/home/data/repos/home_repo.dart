import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/best_seller_units_model.dart';

abstract class HomeRepo{

   Future<Either<Failure,BestSellerUnitsModel>> getBestSellerUnitsInHome();




}
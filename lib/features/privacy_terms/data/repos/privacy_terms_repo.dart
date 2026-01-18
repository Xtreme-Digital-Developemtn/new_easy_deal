import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/terms_model.dart';

abstract class PrivacyTermsRepo{

   Future<Either<Failure,TermsModel>> getTerms();




}
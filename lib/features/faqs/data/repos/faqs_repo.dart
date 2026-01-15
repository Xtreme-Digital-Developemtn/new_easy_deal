import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/faqs_model.dart';

abstract class FAQsRepo{

   Future<Either<Failure,FaqsModel>> getAllFaqs();




}
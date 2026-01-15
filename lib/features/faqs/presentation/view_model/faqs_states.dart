import 'package:easy_deal/features/faqs/data/models/faqs_model.dart';

abstract class FAQsStates{}

class FAQsInitState extends FAQsStates{}

class GetAllFAQsLoadingState extends FAQsStates{}
class GetAllFAQsErrorState extends FAQsStates{
  final String error;
  GetAllFAQsErrorState(this.error);

}
class GetAllFAQsSuccessState extends FAQsStates{
  final FaqsModel faqsModel;
  GetAllFAQsSuccessState(this.faqsModel);

}


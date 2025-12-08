import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_city_area_sub_area_address_location_link.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_specialization_and_deal_type_unit_type.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_info_details.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_upload_unit_documents.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/next_button.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/past_button.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/payment_system_price.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/step_number.dart';
import 'package:easy_deal/main_imports.dart';
import '../../data/models/category_model.dart';

class CreateRequestByCategoryView extends StatelessWidget {
  const CreateRequestByCategoryView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: category.name),
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.0.r),
          child: BlocBuilder<CreateRequestCubit , CreateRequestStates>(
            builder: (context,state){
              var createRequestCubit = context.read<CreateRequestCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepNumber(),
                  Gap(32.h),
                  if(createRequestCubit.currentStepNumber==1)
                  FormOfSpecializationAndDealTypeAndUnitType(),
                  if(createRequestCubit.currentStepNumber==2)
                  FormOfCityAreaSubAreaAddressLocationLink(),
                  if(createRequestCubit.currentStepNumber==3)
                    FormOfUnitInfoDetails(),
                  if(createRequestCubit.currentStepNumber==4)
                    FormOfUnitUploadUnitDocuments(),
                  if(createRequestCubit.currentStepNumber==5)
                    PaymentSystemAndPrice(),
                  Gap(32.h),
                  if(createRequestCubit.currentStepNumber==1&&createRequestCubit.selectedUnitType!=null && createRequestCubit.selectedDealType!=null&&createRequestCubit.selectedSpecialization!=null)
                  NextButton(),
                  if(createRequestCubit.currentStepNumber==2)
                    PastButton(),
                  if(createRequestCubit.currentStepNumber==2&&createRequestCubit.selectedCity!=null&&
                      createRequestCubit.selectedArea!=null&&createRequestCubit.selectedSubArea!=null&&
                  createRequestCubit.locationLinkCon.text.isNotEmpty&&createRequestCubit.addressCon.text.isNotEmpty
                  )
                    Row(
                      children: [
                        Expanded(child: PastButton()),
                        Gap(12.w),
                        Expanded(child: NextButton()),
                      ],
                    ),
                ],
              );
            },

          ),
        ),
      ),
    );
  }
}

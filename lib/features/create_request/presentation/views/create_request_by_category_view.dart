import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_city_area_sub_area_address_location_link.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_specialization_and_deal_type_unit_type.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_info_details.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_upload_unit_documents.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/next_and_prevoius_buttons.dart';
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
      appBar: AppBar(
        title: Text(category.name.toString()),
        leading: IconButton(
          onPressed: () { context.pop(); },
          icon: SvgPicture.asset(
            context.isArabic ? SvgImages.arrowLeft : SvgImages.arrow,
            colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: BlocBuilder<CreateRequestCubit, CreateRequestStates>(
            builder: (context, state) {
              var cubit = context.read<CreateRequestCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepNumber(),
                  Gap(32.h),

                  if (cubit.currentStepNumber == 1)
                    FormOfSpecializationAndDealTypeAndUnitType(),

                  if (cubit.currentStepNumber == 2)
                    FormOfCityAreaSubAreaAddressLocationLink(),

                  if (cubit.currentStepNumber == 3)
                    FormOfUnitInfoDetails(),

                  if (cubit.currentStepNumber == 4 && cubit.shouldShowStep4)
                    FormOfUnitUploadUnitDocuments(),

                  if (cubit.currentStepNumber == 4 && !cubit.shouldShowStep4)
                    PaymentSystemAndPrice(),

                  if (cubit.currentStepNumber == 5)
                    PaymentSystemAndPrice(),

                  Gap(150.h),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: NextAndPreviousButtons(),
    );
  }
}

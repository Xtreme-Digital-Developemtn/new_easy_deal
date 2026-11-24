import 'package:easy_deal/core/shared_widgets/empty_widget.dart';
import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_cubit.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_states.dart';
import 'package:easy_deal/features/contact_us/presentation/views/widgets/contact_us_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  void initState() {
    context.read<ContactUsCubit>().contactUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.contactUs),
      body: BlocBuilder<ContactUsCubit, ContactUsStates>(
        builder: (context, state) {
          final contactUsCubit = context.read<ContactUsCubit>();

          if (state is ContactUsLoadingState) {
            return CustomLoading();
          }
          if (state is ContactUsErrorState) {
            return Padding(
              padding: EdgeInsets.all(20.0.r),
              child: ErrorWidgetUi(
                message: state.error,
                onRetry: () => contactUsCubit.contactUs(),
              ),
            );
          }

          final data = contactUsCubit.contactUsModel?.data;
          final address = data?.address?.trim() ?? '';
          final email = data?.email?.trim() ?? '';
          final phone = data?.phone?.trim() ?? '';

          if (address.isEmpty && email.isEmpty && phone.isEmpty) {
            return Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Center(
                child: EmptyWidget(msg: LangKeys.noDataFound),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LangKeys.contactInformation.tr(),
                  style: AppStyles.primary16SemiBold,
                ),
                Gap(24.h),
                if (address.isNotEmpty)
                  ContactUsItem(
                    svgImage: SvgImages.location2,
                    title: address,
                    onTap: () => contactUsCubit.openMap(address),
                  ),
                if (email.isNotEmpty)
                  ContactUsItem(
                    svgImage: SvgImages.email,
                    title: email,
                    onTap: () => contactUsCubit.sendEmail(email),
                  ),
                if (phone.isNotEmpty)
                  ContactUsItem(
                    svgImage: SvgImages.phone,
                    title: phone,
                    onTap: () => contactUsCubit.makeCall(phone),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

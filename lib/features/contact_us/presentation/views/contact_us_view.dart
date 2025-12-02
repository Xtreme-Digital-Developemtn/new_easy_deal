import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_cubit.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_states.dart';
import 'package:easy_deal/features/contact_us/presentation/views/widgets/contact_us_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.contactUs.tr()),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(SvgImages.arrow),
        ),
      ),
      body: BlocBuilder<ContactUsCubit , ContactUsStates>(
        builder: (context,state){
          var contactUsCubit = context.read<ContactUsCubit>();
          return Padding(
            padding:   EdgeInsets.all(20.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangKeys.contactInformation.tr(),style: AppStyles.primary16SemiBold,),
                Gap(24.h),
                ContactUsItem(svgImage: SvgImages.location2, title: "Cairo", onTap: (){
                  contactUsCubit.openMap("Cairo");
                }),
                ContactUsItem(svgImage: SvgImages.email, title: "mostafa@gmail.com", onTap: (){
                  contactUsCubit.sendEmail("mostafa@gmail.com");
                }),
                ContactUsItem(svgImage: SvgImages.phone, title: "01110690299", onTap: (){
                  contactUsCubit.makeCall("01110690299");
                }),
                ContactUsItem(svgImage: SvgImages.global, title: "https://easydeal.com", onTap: (){
                  contactUsCubit.openWebsite("https://new.easydealmasr.com");
                }),
              ],
            ),
          );
        },

      ),
    );
  }
}


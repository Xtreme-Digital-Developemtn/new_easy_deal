import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_profile_list_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.editProfile.tr()),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(SvgImages.arrow)),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.r),
        child: Column(
          children: [
            EditProfileListItem(title: LangKeys.mobileNumber, subTitle: "01110690299", onTap: (){}),
            EditProfileListItem(title: LangKeys.fullName, subTitle: "Mostafa", onTap: (){}),
            EditProfileListItem(title: LangKeys.emailAddress, subTitle: "mostafa@gmail.com", onTap: (){}),
            EditProfileListItem(title: LangKeys.driverCode, subTitle: "123456", onTap: (){}),
            EditProfileListItem(title: LangKeys.changePassword, subTitle: "", onTap: (){},isLast: true,),

          ],
        ),
      ),
    );
  }
}

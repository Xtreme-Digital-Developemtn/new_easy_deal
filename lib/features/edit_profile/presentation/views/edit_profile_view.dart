import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_name.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_profile_list_item.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import '../../../../core/shared_widgets/general_bottom_sheet.dart';
import '../view_model/edit_profile_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    var editProfileCubit = context.read<EditProfileCubit>();
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.editProfile),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            EditProfileListItem(
              title: LangKeys.mobileNumber,
              subTitle:  profileCubit
                  .clientProfileModel
                  ?.data
                  ?.phone ??
                  "",
              onTap: () {
                context.pushNamed(Routes.editMobileNumberView);
              },
            ),
            EditProfileListItem(
              title: LangKeys.fullName,
              subTitle:  profileCubit
                  .clientProfileModel
                  ?.data
                  ?.fullName ??
                  "",
              onTap: () {
                StandardBottomSheet.show(
                  context: context,
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    child: EditName(editProfileCubit: context.read<EditProfileCubit>(),),
                  ),
                );
              },
            ),
            EditProfileListItem(
              title: LangKeys.emailAddress,
              subTitle:
              profileCubit
                      .clientProfileModel
                      ?.data
                      ?.email ??
                  "",
              onTap: () {
                context.pushNamed(Routes.editEmailView);
              },
            ),
            EditProfileListItem(
              title: LangKeys.driverCode,
              subTitle: "123456",
              onTap: () {},
            ),
            EditProfileListItem(
              title: LangKeys.changePassword,
              subTitle: "",
              onTap: () {
                context.pushNamed(Routes.editPasswordView);
              },
              isLast: CacheHelper.getData(key: "role") == "broker"
                  ? false
                  : true,
            ),
            if (CacheHelper.getData(key: "role") == "broker")
              EditProfileListItem(
                title: LangKeys.advertisementAndPropertyDetails,
                subTitle: "",
                onTap: () {
                  context.pushNamed(
                    Routes.editAdvertisementAndPropertyDetailsView,
                    arguments: {"profileCubit": profileCubit},
                  );
                },
              ),
            if (CacheHelper.getData(key: "role") == "broker")
              EditProfileListItem(
                title: LangKeys.registrationPapers,
                subTitle: "",
                onTap: () {
                  context.pushNamed(
                    Routes.editRegistrationPapersView,
                    arguments: {"editProfileCubit": editProfileCubit},
                  );
                },
                isLast: true,
              ),
          ],
        ),
      ),
    );
  }
}

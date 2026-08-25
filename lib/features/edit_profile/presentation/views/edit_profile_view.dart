import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_profile_list_item.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/profile_header.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/profile_statistics.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/section_card.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../view_model/edit_profile_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    var editProfileCubit = context.read<EditProfileCubit>();
    return Scaffold(
      // appBar: GlobalAppBar(title: LangKeys.editProfile),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          var profile = profileCubit.clientProfileModel?.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  name: profile?.fullName ?? "",
                  phone: profile?.phone ?? "",
                  email: profile?.email ?? "",
                  role: profile?.role ?? "",
                  accountType: profile?.type ?? "",
                  imageUrl: profile?.image ?? "",
                ),
            ProfileStatistics(
                adsCount: profile?.advertisementCount  ,
                opsCount:  profile?.operationCount  ,
                locationsCount: profile?.specializationScopesCount ,
                specialtyCount: profile?.specializationsCount  ,
            ),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Section 1 (profile details)
                    Text(
                    "تفاصيل الحساب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B1B4B),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                      context.pushNamed(Routes.editNameView);
                    },
                  ),
                  SizedBox(height: 16.h),
                  /// Section 2 (login methods)
                  Text(
                    "طرق تسجيل الدخول",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B1B4B),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  EditProfileListItem(
                    showButton: true,
                    buttonText: "تغيير",
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
                    showButton: true,
                    buttonText: "ضبط",
                    title: "كلمة المرور",
                    subTitle: "",
                    onTap: () {
                      context.pushNamed(Routes.editPasswordView);
                    },
                    isLast: CacheHelper.getData(key: "userRole") == "broker"
                        ? false
                        : true,
                  ),
                  SizedBox(height: 16.h),

                  /// Section 3 (ACCOUNT DETAILS)
                  Text(
                    "تفاصيل الحساب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B1B4B),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (CacheHelper.getData(key: "userRole") == "broker")
                    EditProfileListItem(
                      title: LangKeys.registrationPapers,
                      subTitle: "",
                      onTap: () {
                        context.pushNamed(
                          Routes.editRegistrationPapersView,
                          arguments: {"editProfileCubit": editProfileCubit},
                        );
                      },
                    ),

                  if (CacheHelper.getData(key: "userRole") == "broker")
                    EditProfileListItem(
                      title: "كود الخصم",
                      subTitle: "",
                      onTap: () {
                        // context.pushNamed(
                        //   Routes.editRegistrationPapersView,
                        //   arguments: {"editProfileCubit": editProfileCubit},
                        // );
                      },
                    ),
                  if (CacheHelper.getData(key: "userRole") == "broker")
                  SizedBox(height: 16.h),

                  /// Section 4 (ACCOUNT DETAILS)
                  if (CacheHelper.getData(key: "userRole") == "broker")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تفاصيل الإعلانات والعقارات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1B4B),
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      EditProfileListItem(
                        title: "التخصصات",
                        subTitle: "",
                        onTap: () {
                          context.pushNamed(
                            Routes.editAdvertisementAndPropertyDetailsView,
                            arguments: {"profileCubit": profileCubit},
                          );
                        },
                      ),
                    ],
                  )



                ],
              ),
            ),
          ],
        ),
      );
        },
      ),
    );
  }
}

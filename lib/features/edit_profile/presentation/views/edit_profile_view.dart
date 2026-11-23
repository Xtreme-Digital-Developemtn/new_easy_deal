import 'package:easy_deal/core/utils/app_consts/session_cache.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_profile_list_item.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/profile_header.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/profile_statistics.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
// import '../../../profile/presentation/views/widgets/show_promo_code_widget.dart';
import '../view_model/edit_profile_cubit.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void initState() {
    super.initState();
    // الكيوبت عام وبيحمّل البروفايل مرة واحدة عند تشغيل التطبيق، فلو النداء
    // ده فشل (أوفلاين مثلاً) الشاشة كانت بتفضل بقيم فاضية وعدّادات أصفار من
    // غير أي مؤشّر. بنعيد التحميل عند الدخول لو مفيش بيانات محمّلة.
    final profileCubit = context.read<ProfileCubit>();
    if (profileCubit.clientProfileModel?.data == null) {
      _reload();
    }
  }

  void _reload() {
    final id = SessionCache.userId;
    if (id != null) {
      context.read<ProfileCubit>().getClientProfile(clientId: id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    var editProfileCubit = context.read<EditProfileCubit>();
    return Scaffold(
      // appBar: GlobalAppBar(title: LangKeys.editProfile),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          var profile = profileCubit.clientProfileModel?.data;

          // لسه مفيش بيانات: نعرض لودينج أو خطأ بدل هيدر فاضي وعدّادات أصفار.
          if (profile == null) {
            if (state is GetClientProfileErrorState) {
              return _ErrorBody(message: state.error, onRetry: _reload);
            }
            return const Center(child: CustomLoading());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  name: profile.fullName ?? "",
                  phone: profile.phone ?? "",
                  email: profile.email ?? "",
                  role: profile.role ?? "",
                  accountType: profile.type ?? "",
                  imageUrl: profile.image ?? "",
                ),
                ProfileStatistics(
                  adsCount: _toCount(profile.advertisementCount),
                  opsCount: _toCount(profile.operationCount),
                  locationsCount: _toCount(profile.specializationScopesCount),
                  specialtyCount: _toCount(profile.specializationsCount),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Section 1 (profile details)
                      const _SectionTitle(LangKeys.accountDetails),
                      SizedBox(height: 16.h),
                      EditProfileListItem(
                        title: LangKeys.mobileNumber,
                        subTitle: profile.phone ?? "",
                        onTap: () {
                          context.pushNamed(Routes.editMobileNumberView);
                        },
                      ),
                      EditProfileListItem(
                        title: LangKeys.fullName,
                        subTitle: profile.fullName ?? "",
                        onTap: () {
                          context.pushNamed(Routes.editNameView);
                        },
                      ),
                      SizedBox(height: 16.h),

                      /// Section 2 (login methods)
                      const _SectionTitle(LangKeys.loginMethods),
                      SizedBox(height: 16.h),
                      EditProfileListItem(
                        showButton: true,
                        buttonText: LangKeys.change,
                        title: LangKeys.emailAddress,
                        subTitle: profile.email ?? "",
                        onTap: () {
                          context.pushNamed(Routes.editEmailView);
                        },
                      ),
                      EditProfileListItem(
                        showButton: true,
                        buttonText: LangKeys.setUp,
                        title: LangKeys.password,
                        subTitle: "",
                        onTap: () {
                          context.pushNamed(Routes.editPasswordView);
                        },
                        isLast: SessionCache.isBroker ? false : true,
                      ),

                      /// Section 3 (registration papers) — للوسيط فقط.
                      /// العنوان نفسه لازم يكون جوه الشرط، وإلا العميل كان
                      /// بيشوف عنوان قسم مفيش تحته أي بنود.
                      if (SessionCache.isBroker) ...[
                        SizedBox(height: 16.h),
                        const _SectionTitle(LangKeys.registrationPapers),
                        SizedBox(height: 16.h),
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

                        // EditProfileListItem(
                        //   title: "كود الخصم",
                        //   subTitle: "",
                        //   onTap: () {
                        //     showModalBottomSheet(
                        //       context: context,
                        //       isScrollControlled: true,
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(20),
                        //         ),
                        //       ),
                        //       builder: (_) => PromoCodeBottomSheet(
                        //         onSubmit: (code) {
                        //           context
                        //               .read<ProfileCubit>()
                        //               .applyPromoCode(promoCode: code, brokerId: CacheHelper.getData(key: "userId"));
                        //         },
                        //       ),
                        //     );
                        //   },
                        // ),

                        /// Section 4 (advertisements and properties)
                        SizedBox(height: 16.h),
                        const _SectionTitle(
                          LangKeys.advertisementsAndPropertiesDetails,
                        ),
                        SizedBox(height: 16.h),
                        EditProfileListItem(
                          title: LangKeys.specializations,
                          subTitle: "",
                          onTap: () {
                            context.pushNamed(
                              Routes.editAdvertisementAndPropertyDetailsView,
                              arguments: {"profileCubit": profileCubit},
                            );
                          },
                        ),
                      ],
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

  int _toCount(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v.toString()) ?? 0;
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.langKey);

  final String langKey;

  @override
  Widget build(BuildContext context) {
    return Text(
      langKey.tr(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1B1B4B),
        letterSpacing: 0.5,
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  context.isArabic ? SvgImages.arrowLeft : SvgImages.arrow,
                ),
              ),
            ),
            const Spacer(),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.black16Medium,
            ),
            Gap(20.h),
            CustomButton(
              text: LangKeys.retry.tr(),
              width: 180.w,
              onPressed: onRetry,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

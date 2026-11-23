import '../../../../../main_imports.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_states.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        // صورة الحساب الحقيقية من بيانات البروفايل. الحقل في الموديل
        // dynamic، فبنحوّله لنص وبنتعامل مع null/الفاضي على إنه مفيش صورة.
        final rawImage = context.read<ProfileCubit>().clientProfileModel?.data?.image;
        final imageUrl = rawImage?.toString().trim() ?? "";
        final hasImage = imageUrl.isNotEmpty;

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.all(2.r),
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
                child: ClipOval(
                  child: hasImage
                      ? CustomNetWorkImage(
                          imageUrl: imageUrl,
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                          raduis: 0,
                        )
                      // مفيش صورة للحساب: أيقونة شخص محايدة زي شاشة
                      // تعديل الملف الشخصي، مش صورة شخص تاني.
                      : Icon(
                          Icons.person,
                          size: 48.r,
                          color: AppColors.gray,
                        ),
                ),
              ),
            ),
            Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: Center(
                child: SvgPicture.asset(SvgImages.edit2),
              ),
            ),
          ],
        );
      },
    );
  }
}

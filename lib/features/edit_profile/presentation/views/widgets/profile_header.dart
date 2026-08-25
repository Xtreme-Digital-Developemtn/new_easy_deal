import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.accountType,
    this.imageUrl,
    this.onBack,
    this.onMore,
  });

  final String name;
  final String phone;
  final String email;
  final String role;
  final String accountType;
  final String? imageUrl;
  final VoidCallback? onBack;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 32.h,
        bottom: 40.h,
        left: 12.w,
        right: 12.w,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF263E8E),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          /// Header
          Row(
            children: [
              InkWell(
                onTap: onBack ?? () => Navigator.pop(context),
                child: SvgPicture.asset(
                  context.isArabic ? SvgImages.arrowLeft:
                  SvgImages.arrow ,
                  colorFilter: ColorFilter.mode(AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    LangKeys.profile.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onMore,
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 35.h),
          /// Profile Image
          Container(
            width: 120.w,
            height: 120.w,
            padding: EdgeInsets.all(4.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipOval(
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? CustomNetWorkImage(imageUrl: imageUrl!, raduis: 50.r)
                  : const Icon(
                Icons.person,
                size: 60,
                color: Colors.grey,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          /// Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),

          /// Phone + Email
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                phone,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          /// Role + Account Type
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBadge(
                text: role,
                backgroundColor: const Color(0xFFE8EFFC),
                textColor: const Color(0xFF3C5C9D),
              ),

              SizedBox(width: 8.w),

              _buildBadge(
                text: accountType,
                backgroundColor: const Color(0xFFD9F3E8),
                textColor: const Color(0xFF287A5A),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 7.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
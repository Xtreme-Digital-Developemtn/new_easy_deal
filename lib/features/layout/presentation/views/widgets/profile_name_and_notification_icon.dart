


import '../../../../../main_imports.dart';

class ProfileNameAndNotificationIcon extends StatelessWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(CacheTokenManger.userToken);
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomNetWorkImage(
              raduis: 50,
              imageUrl: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
           Gap(6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    context.isArabic ? "اهلا مصطفي بحر":   "Hi, Mostafa Bahr",
                    style: AppStyles.black16SemiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
            onTap: (){
              context.pushNamed(Routes.notificationsView);
            },
            child: SvgPicture.asset(SvgImages.notify2,colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),)),
      ],
    );
  }
}
import '../../../../../main_imports.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({super.key, required this.svgImage, required this.title, required this.onTap});
  final String svgImage;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Padding(
        padding:   EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
        child: Row(
          children: [
            SvgPicture.asset(svgImage),
            Gap(12.w),
            Text(title,style: AppStyles.black16SemiBold,),
          ],
        ),
      ),
    );
  }
}

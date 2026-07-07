import 'package:url_launcher/url_launcher.dart';

import '../../../../../main_imports.dart';

class UnitBottomNavigationBarWidget extends StatelessWidget {
  const UnitBottomNavigationBarWidget({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.gray1,
        width: double.infinity,
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildUnitBottomNavBarItem(color: AppColors.green, svg: "assets/images/svgs/Frame 1984077843.svg" , onTap: (){

            }),
            buildUnitBottomNavBarItem(color: AppColors.primaryDark, svg: "assets/images/svgs/Frame 1984077844.svg" , onTap: (){

            }),
            buildUnitBottomNavBarItem(color: AppColors.errorLight, svg: "assets/images/svgs/Frame 1984077845.svg" , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.primaryDark, svg: "assets/images/svgs/Frame 1984077846.svg", onTap: (){
              openWhatsApp( phone );
            }),
            buildUnitBottomNavBarItem(color: AppColors.green, svg: "assets/images/svgs/Frame 1984077847.svg" , onTap: (){
              debugPrint("Phone before call = '$phone'");
              makePhoneCall( phone );
            }),
          ],
        ),
      ),
    );
  }
}
Widget buildUnitBottomNavBarItem({required Color color , required String svg , required void Function() onTap}){
  return  InkWell(
    onTap:  onTap,
    child: Container(
      height:40.h,
      width: 40.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
      child: SvgPicture.asset(svg)
    ),
  );
}


Future<void> makePhoneCall(String phoneNumber) async {
  final uri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  debugPrint("URI = $uri");

  try {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    debugPrint("Call Error: $e");
  }
}


Future<void> openWhatsApp(String phoneNumber) async {
  // Remove spaces or special characters
  phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  // Add Egypt country code if needed
  if (phoneNumber.startsWith('01')) {
    phoneNumber = '20$phoneNumber';
  }

  final Uri whatsappUri = Uri.parse(
    "https://wa.me/$phoneNumber",
  );

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(
      whatsappUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    debugPrint("Cannot open WhatsApp");
  }
}
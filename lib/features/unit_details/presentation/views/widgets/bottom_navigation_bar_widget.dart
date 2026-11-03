
import '../../../../../core/utils/contact_launcher.dart';
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
            // buildUnitBottomNavBarItem(color: AppColors.green, svg: "assets/images/svgs/Frame 1984077843.svg" , onTap: (){
            //
            // }),
            // buildUnitBottomNavBarItem(color: AppColors.primaryDark, svg: "assets/images/svgs/Frame 1984077844.svg" , onTap: (){
            //
            // }),
            // buildUnitBottomNavBarItem(color: AppColors.errorLight, svg: "assets/images/svgs/Frame 1984077845.svg" , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.primaryDark, svg: "assets/images/svgs/Frame 1984077846.svg", onTap: (){
              ContactLauncher.whatsApp(context, phone);
            }),
            buildUnitBottomNavBarItem(color: AppColors.green, svg: "assets/images/svgs/Frame 1984077847.svg" , onTap: (){
              ContactLauncher.call(context, phone);
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


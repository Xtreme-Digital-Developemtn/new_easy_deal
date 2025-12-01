import '../../../../../main_imports.dart';

class UnitBottomNavigationBarWidget extends StatelessWidget {
  const UnitBottomNavigationBarWidget({super.key});

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
            buildUnitBottomNavBarItem(color: AppColors.green, icon: Icons.message , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.primaryDark, icon: Icons.save , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.errorLight, icon: Icons.favorite , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.primaryDark, icon: Icons.share , onTap: (){}),
            buildUnitBottomNavBarItem(color: AppColors.green, icon: Icons.phone , onTap: (){}),
          ],
        ),
      ),
    );
  }
}
Widget buildUnitBottomNavBarItem({required Color color , required IconData icon , required void Function() onTap}){
  return  InkWell(
    onTap:  onTap,
    child: Container(
      height:40.h,
      width: 40.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
      child: Icon(icon,color: AppColors.white,),
    ),
  );
}

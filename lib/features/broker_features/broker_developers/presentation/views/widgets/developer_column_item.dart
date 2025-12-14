import '../../../../../../main_imports.dart';

class DeveloperColumnItem extends StatelessWidget {
  const DeveloperColumnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
           shape: BoxShape.circle,
            color: AppColors.primaryDark
          ),
        ),
      ],
    );
  }
}

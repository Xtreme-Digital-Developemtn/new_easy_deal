import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/main_imports.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ContainerSearchWidget()),
        Gap(16.w),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(SvgImages.sort,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(AppColors.primaryDark,
                    BlendMode.srcIn,),),

              ],
            ),
            Gap(16.w),
            Row(
              children: [
                SvgPicture.asset(SvgImages.filter,
                  height: 20.h,colorFilter: ColorFilter.mode(AppColors.primaryDark,
                    BlendMode.srcIn),),

              ],
            ),
          ],
        ),
      ],
    );
  }
}

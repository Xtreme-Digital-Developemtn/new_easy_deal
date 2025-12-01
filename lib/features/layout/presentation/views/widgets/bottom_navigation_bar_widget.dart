 import 'package:easy_localization/easy_localization.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import '../../../../../main_imports.dart';
import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_states.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return FlashyTabBar(
          selectedIndex: LayoutCubit.pageIndex,
          showElevation: true,
          onItemSelected: (index) {
            context.read<LayoutCubit>().changeBottomNav(index, context);
          },
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          iconSize: 24,
          backgroundColor: AppColors.white,
          items: [
            _buildTabItem(
              icon: SvgImages.home,
              title: LangKeys.home ,
              index: 0,
            ),
            _buildTabItem(
              icon: SvgImages.search,
              title: LangKeys.search ,
              index: 1,
            ),
            _buildTabItem(
              icon: SvgImages.add,
              title: LangKeys.request ,
              index: 2,
            ),
            _buildTabItem(
              icon: SvgImages.chat,
              title: LangKeys.messages ,
              index: 3,
            ),
            _buildTabItem(
              icon: SvgImages.profile,
              title: LangKeys.profile ,
              index: 4,
            ),
          ],
        );
      },
    );
  }

  FlashyTabBarItem _buildTabItem({
    required String icon,
    required String title,
    required int index,
  }) {
    return FlashyTabBarItem(
      activeColor: AppColors.primaryDark,
      icon: SvgPicture.asset(
        icon,
        width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
          LayoutCubit.pageIndex == index
              ? AppColors.primaryDark
              : AppColors.gray,
          BlendMode.srcIn,
        ),
      ),
      title: Text(title.tr()),
    );
  }
}
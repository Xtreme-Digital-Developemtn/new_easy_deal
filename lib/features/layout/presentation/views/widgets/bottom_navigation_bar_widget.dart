import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_states.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: LayoutCubit.pageIndex,
          onTap: (index) {
            context.read<LayoutCubit>().changeBottomNav(index, context);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 8,
          selectedItemColor: AppColors.primaryDark,
          unselectedItemColor: AppColors.gray,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            _buildItem(
              icon: SvgImages.home,
              title: LangKeys.home,
              context: context,
            ),
            _buildItem(
              icon: SvgImages.search,
              title: LangKeys.search,
              context: context,
            ),
            _buildItem(
              icon: SvgImages.add2,
              title: LangKeys.request,
              context: context,
            ),
            _buildItem(
              icon: SvgImages.chat2,
              title: LangKeys.messages,
              context: context,
            ),
            _buildItem(
              icon: SvgImages.profile,
              title: LangKeys.profile,
              context: context,
            ),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem({
    required String icon,
    required String title,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.gray,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.primaryDark,
          BlendMode.srcIn,
        ),
      ),
      label: context.tr(title),
    );
  }
}
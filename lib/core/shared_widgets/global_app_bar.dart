import 'package:easy_localization/easy_localization.dart';

import '../../main_imports.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.title, this.actions,   this.showBackButton = true});
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return    AppBar(
    title: Text(title.tr()),
    actions:actions,
    leading:showBackButton==true ?  IconButton(
    onPressed: () {
    context.pop();
    },
    icon: SvgPicture.asset(context.isArabic ? SvgImages.arrowLeft: SvgImages.arrow , colorFilter: ColorFilter.mode(AppColors.black,
        BlendMode.srcIn,
    ),
    ),
    ) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

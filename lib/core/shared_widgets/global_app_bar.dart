import 'package:easy_localization/easy_localization.dart';

import '../../main_imports.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.title, this.actions,this.backgroundColor
    ,
    this.iconColor,
    this.textColor,   this.showBackButton = true});
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return    AppBar(
      backgroundColor:backgroundColor ,
    title: Text(title.tr(),style: TextStyle(
      color: textColor,
    ),),
    actions:actions,
    leading:showBackButton==true ?  IconButton(
    onPressed: () {
    context.pop();
    },
    icon: SvgPicture.asset(
      context.isArabic ? SvgImages.arrowLeft:
      SvgImages.arrow ,
      colorFilter: ColorFilter.mode(iconColor??AppColors.black,
        BlendMode.srcIn,
    ),
    ),
    ) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

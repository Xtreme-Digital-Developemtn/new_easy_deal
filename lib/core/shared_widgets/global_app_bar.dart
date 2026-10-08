import 'package:easy_localization/easy_localization.dart';

import '../../main_imports.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.title, this.actions,this.backgroundColor
    ,
    this.iconColor,
    this.textColor,   this.showBackButton = true, this.bottom,
    this.translateTitle = true});
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool translateTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return    AppBar(
      backgroundColor:backgroundColor ,
    title: Text(translateTitle ? title.tr() : title,style: TextStyle(
      color: textColor,
    ),),
    actions:actions,
    bottom: bottom,
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
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

}

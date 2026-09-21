
import '../../../../../main_imports.dart';

class FinishingBadge extends StatelessWidget {
  final String finishing;

  const FinishingBadge({
    super.key,
    required this.finishing,
  });

  @override
  Widget build(BuildContext context) {
    final badgeStyle = _getStyle();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: badgeStyle.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        finishing,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: badgeStyle.textColor,
        ),
      ),
    );
  }

  _FinishingStyle _getStyle() {
    switch (finishing.toLowerCase()) {
      case 'full':
        return const _FinishingStyle(
          backgroundColor: Color(0xffD5F8E9),
          textColor: Color(0xff15966B),
        );

      case 'semi':
        return const _FinishingStyle(
          backgroundColor: Color(0xffFFF0CC),
          textColor: Color(0xffC77B00),
        );

      case 'core':
        return const _FinishingStyle(
          backgroundColor: Color(0xffFFE0E0),
          textColor: Color(0xffD83232),
        );

      default:
        return const _FinishingStyle(
          backgroundColor: Color(0xffEEEEEE),
          textColor: Color(0xff666666),
        );
    }
  }
}

class _FinishingStyle {
  final Color backgroundColor;
  final Color textColor;

  const _FinishingStyle({
    required this.backgroundColor,
    required this.textColor,
  });
}
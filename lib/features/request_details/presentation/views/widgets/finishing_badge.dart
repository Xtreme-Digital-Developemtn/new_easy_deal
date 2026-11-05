
import '../../../../../main_imports.dart';

class FinishingBadge extends StatelessWidget {
  final String finishing;

  /// القيمة الخام من الـAPI (full_finished / semi_finished / core_and_shell).
  /// النص المعروض بقى بالعربي فاللون بيتحدد من دي، ولو مش موجودة بنرجع
  /// للنص نفسه زي الأول.
  final String? rawFinishing;

  const FinishingBadge({
    super.key,
    required this.finishing,
    this.rawFinishing,
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
    final source = (rawFinishing ?? finishing).toLowerCase();

    if (source.contains('full') || source.contains('lux')) {
      return const _FinishingStyle(
        backgroundColor: Color(0xffD5F8E9),
        textColor: Color(0xff15966B),
      );
    }
    if (source.contains('semi')) {
      return const _FinishingStyle(
        backgroundColor: Color(0xffFFF0CC),
        textColor: Color(0xffC77B00),
      );
    }
    if (source.contains('core') || source.contains('shell')) {
      return const _FinishingStyle(
        backgroundColor: Color(0xffFFE0E0),
        textColor: Color(0xffD83232),
      );
    }

    return const _FinishingStyle(
      backgroundColor: Color(0xffEEEEEE),
      textColor: Color(0xff666666),
    );
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
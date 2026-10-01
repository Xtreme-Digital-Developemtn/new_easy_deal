
import '../../../../../main_imports.dart';

/// Single source of truth for the replies-table column widths.
/// Header and rows both read from here so they can never drift apart,
/// and [tableWidth] is derived from them instead of being hard-coded.
class ReplyTableColumns {
  const ReplyTableColumns._();

  static const double index = 44;
  static const double unitCode = 112;
  static const double area = 72;
  static const double city = 88;
  static const double broker = 122;
  static const double finishing = 96;
  static const double action = 76;

  static const double horizontalPadding = 12;

  static const double contentWidth =
      index + unitCode + area + city + broker + finishing + action;

  static const double tableWidth = contentWidth + horizontalPadding * 2;
}

class ReplyTableHeader extends StatelessWidget {
  const ReplyTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        color: Color(0xffF4F7FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: ReplyTableColumns.horizontalPadding,
      ),
      // Columns are fixed width, so the row sizes to its content and the
      // outer table container provides the canvas.
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerCell(
            '#',
            width: ReplyTableColumns.index,
          ),

          _headerCell(
            'Unit Code',
            width: ReplyTableColumns.unitCode,
          ),

          _headerCell(
            'Area m²',
            width: ReplyTableColumns.area,
          ),

          _headerCell(
            'City',
            width: ReplyTableColumns.city,
          ),

          _headerCell(
            'Broker',
            width: ReplyTableColumns.broker,
          ),

          _headerCell(
            'Finishing',
            width: ReplyTableColumns.finishing,
          ),

          _headerCell(
            'Action',
            width: ReplyTableColumns.action,
          ),
        ],
      ),
    );
  }

  Widget _headerCell(
      String title, {
        required double width,
      }) {
    return SizedBox(
      width: width,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xff202477),
        ),
      ),
    );
  }
}

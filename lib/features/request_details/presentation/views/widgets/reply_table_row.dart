

import '../../../../../main_imports.dart';
import 'finishing_badge.dart';
import 'reply_table_header.dart';

class ReplyTableRow extends StatelessWidget {
  final int index;
  final String unitCode;
  final String area;
  final String city;
  final String broker;
  final String finishing;

  const ReplyTableRow({
    super.key,
    required this.index,
    required this.unitCode,
    required this.area,
    required this.city,
    required this.broker,
    required this.finishing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(
        horizontal: ReplyTableColumns.horizontalPadding,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffE4E8F2),
          ),
        ),
      ),
      child: Row(
        // Broker بياخد المساحة الباقية فالصف يملأ عرض الجدول بدون overflow
        children: [
          _cell(
            '$index',
            width: ReplyTableColumns.index,
            color: const Color(0xff777777),
          ),

          _cell(
            unitCode,
            width: ReplyTableColumns.unitCode,
            color: const Color(0xff202477),
            fontWeight: FontWeight.w600,
          ),

          _cell(
            area,
            width: ReplyTableColumns.area,
          ),

          _cell(
            city,
            width: ReplyTableColumns.city,
          ),

          Expanded(
            child: Text(
              broker,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(
            width: ReplyTableColumns.finishing,
            child: FinishingBadge(
              finishing: finishing,
            ),
          ),

          SizedBox(
            width: ReplyTableColumns.action,
            child: _ViewButton(
              onTap: () {
                // TODO: Open reply details
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cell(
      String value, {
        required double width,
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.w400,
      }) {
    return SizedBox(
      width: width,
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 13,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class _ViewButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ViewButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff092FA3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
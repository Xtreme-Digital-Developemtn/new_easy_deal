

import '../../../../../main_imports.dart';
import 'finishing_badge.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffE4E8F2),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _cell(
            '$index',
            width: 45,
            color: const Color(0xff777777),
          ),

          _cell(
            unitCode,
            width: 110,
            color: const Color(0xff202477),
            fontWeight: FontWeight.w600,
          ),

          _cell(
            area,
            width: 85,
          ),

          _cell(
            city,
            width: 75,
          ),

          SizedBox(
            width: 115,
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
            width: 90,
            child: FinishingBadge(
              finishing: finishing,
            ),
          ),

          SizedBox(
            width: 75,
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
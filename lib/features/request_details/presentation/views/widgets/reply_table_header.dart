
import '../../../../../main_imports.dart';

class ReplyTableHeader extends StatelessWidget {
  const ReplyTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      color: const Color(0xffF4F7FF),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      // Header row must not try to expand to screen width; it has fixed 595px content
      // so we use mainAxisSize.min and let the outer 720px Container provide the canvas.
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerCell(
            '#',
            width: 45,
          ),

          _headerCell(
            'Unit Code',
            width: 110,
          ),

          _headerCell(
            'Area m²',
            width: 85,
          ),

          _headerCell(
            'City',
            width: 75,
          ),

          _headerCell(
            'Broker',
            width: 115,
          ),

          _headerCell(
            'Finishing',
            width: 90,
          ),

          _headerCell(
            'Action',
            width: 75,
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
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xff202477),
        ),
      ),
    );
  }
}
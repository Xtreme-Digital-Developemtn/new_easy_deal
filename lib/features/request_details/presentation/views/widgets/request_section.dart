import '../../../../../main_imports.dart';

class RequestSection extends StatelessWidget {
  final String title;
  final Widget child;

  const RequestSection({super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Color(0xff202477),
                letterSpacing: 0.3,
              ),
            ),

            const SizedBox(width: 8),

            const Expanded(
              child: Divider(
                color: Color(0xffEEEEEE),
                thickness: 1,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        child,
      ],
    );
  }
}

/// بيبني صف واحد لو القيمة صالحة للعرض، وبيرجّع `null` لو الحقل لازم يختفي
/// بالكامل. الـ`InfoCard` بيفلتر الـnulls فمفيش مسافة ولا Divider فاضي.
Widget? optionalInfoRow({required String title, required String? value}) =>
    value == null ? null : InfoRow(title: title, value: value);

/// `true` لو فيه صف واحد على الأقل لسه ظاهر في القسم.
bool hasVisibleRows(List<Widget?> rows) => rows.any((row) => row != null);

class InfoCard extends StatelessWidget {
  /// ممكن تحتوي على `null` للصفوف المخفية، والـwidget بيستبعدها.
  final List<Widget?> children;

  const InfoCard({super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final visible = children.whereType<Widget>().toList();
    if (visible.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffD8E1FF),
        ),
      ),
      child: Column(
        children: visible,
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffD8E1FF),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff888888),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xff202477),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
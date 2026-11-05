
import '../../../../../main_imports.dart';
import '../../../data/config/display_value.dart';
import '../../view_model/request_details_cubit.dart';

class RequestInfoGrid extends StatelessWidget {
  const RequestInfoGrid({
    super.key,

  });



  /// بيرجّع الكارت لو القيمة صالحة، أو ليستة فاضية فالكارت ما يتضافش أصلاً
  List<Widget> _card({
    required IconData icon,
    required String? value,
    required String label,
  }) =>
      value == null
          ? const []
          : [_RequestInfoCard(icon: icon, value: value, label: label)];

  @override
  Widget build(BuildContext context) {
    var requestDetailsCubit = context.read<RequestDetailsCubit>();
    var details = requestDetailsCubit.requestDetailsModel?.data;
    final textScale =
        MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 1.4);

    /// الكارت اللي قيمته فاضية أو صفر (ما عدا الردود) بيختفي بالكامل
    final cards = <Widget>[
      ..._card(
        icon: Icons.person_outline,
        value: DisplayValue.text(details?.user?.name),
        label: 'اسم الوسيط',
      ),
      ..._card(
        icon: Icons.calendar_month_outlined,
        value: DisplayValue.text(details?.createdAt),
        label: 'تاريخ الطلب',
      ),
      ..._card(
        icon: Icons.phone_outlined,
        value: DisplayValue.text(details?.user?.phone),
        label: 'رقم الهاتف',
      ),
      ..._card(
        icon: Icons.thumb_up_alt_outlined,
        // صفر ردود قيمة حقيقية بتفيد المستخدم
        value: DisplayValue.text(details?.numberOfReplies, zeroIsValid: true),
        label: 'الردود',
      ),
    ];

    if (cards.isEmpty) return const SizedBox.shrink();

    // يقيس العرض المتاح فعلياً عشان الكروت تتظبط مع أي مسافات جانبية
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final crossAxisCount = maxWidth >= 560 ? 4 : 2;
        final spacing = 12.w;
        final cardWidth =
            (maxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: cardWidth / (132.h * textScale),
          children: cards,
        );
      },
    );
  }
}

class _RequestInfoCard extends StatelessWidget {
  const _RequestInfoCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: const Color(0xFFE1E4E8),
          width: 1.5,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final circleSize =
              (constraints.maxHeight * 0.38).clamp(32.0, 58.0);

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F4FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: circleSize * 0.52,
                    color: const Color(0xFF28247F),
                  ),
                ),

                SizedBox(height: 8.h),

                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 4.h),

                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

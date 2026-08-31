import 'dart:math' as math;

import 'package:easy_deal/main_imports.dart';

import '../../../../broker_features/broker_home/data/models/broker_statistics_model.dart';

class OrderStatisticsWidget extends StatelessWidget {
  const OrderStatisticsWidget({
    super.key,
    required this.data,
  });

  final Data data;

  @override
  Widget build(BuildContext context) {
    final total = data.allRequestsCount ?? 0;
    final newOrders = data.newRequestsCount ?? 0;
    final processing = data.inProcessingRequestsCount ?? 0;
    final completed = data.finishedRequestsCount ?? 0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Text(
            'إحصائيات الطلبات والمبيعات',
            style: AppStyles.black18SemiBold.copyWith(
              fontSize: 16.sp,
            ),
          ),

          SizedBox(height: 12.h),

          /// Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatisticsLegendItem(
                color: const Color(0xffFFBC32),
                title: 'جديد',
              ),
              _StatisticsLegendItem(
                color: const Color(0xff536DFE),
                title: 'قيد المعالجة',
              ),
              _StatisticsLegendItem(
                color: const Color(0xff2CB855),
                title: 'مكتمل',
              ),
            ],
          ),

          SizedBox(height: 2.h),

          /// Chart
          SizedBox(
            height: 220.h,
            width: double.infinity,
            child: CustomPaint(
              painter: _OrderStatisticsPainter(
                newOrders: newOrders,
                processing: processing,
                completed: completed,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatNumber(total),
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff10194A),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'اجمالي الطلبات',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA1A1AA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
    );
  }
}

class _StatisticsLegendItem extends StatelessWidget {
  const _StatisticsLegendItem({
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9.w,
          height: 9.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xffA1A1AA),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _OrderStatisticsPainter extends CustomPainter {
  _OrderStatisticsPainter({
    required this.newOrders,
    required this.processing,
    required this.completed,
  });

  final int newOrders;
  final int processing;
  final int completed;

  @override
  void paint(Canvas canvas, Size size) {
    final total = newOrders + processing + completed;

    if (total == 0) {
      return;
    }

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    // حجم الدائرة أصغر
    final radius = math.min(
      size.width,
      size.height,
    ) /
        2.9;

    // سمك الـ Donut
    final strokeWidth = radius * 0.38;

    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    const startAngle = -math.pi / 2;

    double currentAngle = startAngle;

    final sections = [
      _ChartSection(
        value: newOrders,
        color: const Color(0xffFFBC32),
      ),
      _ChartSection(
        value: processing,
        color: const Color(0xff536DFE),
      ),
      _ChartSection(
        value: completed,
        color: const Color(0xff2CB855),
      ),
    ];

    // مساحة صغيرة للألوان اللي قيمتها 0
    const double minimumSweep = 0.10;

    final zeroSectionsCount = sections
        .where((section) => section.value == 0)
        .length;

    final minimumTotal =
        zeroSectionsCount * minimumSweep;

    final availableAngle =
        (math.pi * 2) - minimumTotal;

    for (final section in sections) {
      double sweepAngle;

      if (section.value == 0) {
        // نخلي اللون يظهر حتى لو القيمة صفر
        sweepAngle = minimumSweep;
      } else {
        sweepAngle =
            (section.value / total) * availableAngle;
      }

      paint.color = section.color;

      canvas.drawArc(
        rect,
        currentAngle,
        sweepAngle,
        false,
        paint,
      );

      currentAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(
      covariant _OrderStatisticsPainter oldDelegate,
      ) {
    return oldDelegate.newOrders != newOrders ||
        oldDelegate.processing != processing ||
        oldDelegate.completed != completed;
  }
}

class _ChartSection {
  final int value;
  final Color color;

  const _ChartSection({
    required this.value,
    required this.color,
  });
}
import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_cubit.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/view_model/broker_home_states.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/broker_main_sections.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/last_requests.dart';
import 'package:easy_deal/features/broker_features/broker_home/presentation/views/widgets/statistics.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/order_statistics_widget.dart';
import 'package:easy_deal/features/broker_features/broker_home/data/models/broker_statistics_model.dart';
import 'package:easy_deal/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:easy_deal/features/layout/presentation/view_model/layout_states.dart';
import 'package:easy_deal/main_imports.dart';

class BrokerHomeView extends StatefulWidget {
  const BrokerHomeView({super.key});

  /// ترتيب تاب لوحة التحكم في getScreens: الرئيسية = 0 ثم اللوحة = 1
  /// (الشاشة دي بتتبني للوسيط بس، فالـ index ثابت).
  static const int tabIndex = 1;

  @override
  State<BrokerHomeView> createState() => _BrokerHomeViewState();
}

class _BrokerHomeViewState extends State<BrokerHomeView> {
  /// IndexedStack بيبقّي الشاشة حيّة، فـ initState ما بيتكررش عند تبديل
  /// التابات — بنتابع ظهور التاب بنفسنا عشان نعرف إمتى نعمل refresh.
  bool _wasVisible = LayoutCubit.pageIndex == BrokerHomeView.tabIndex;

  int? get _brokerId {
    final id = CacheHelper.getData(key: "userId");
    return id is int ? id : null;
  }

  Future<void> _refresh({Duration minInterval = Duration.zero}) async {
    final brokerId = _brokerId;
    if (brokerId == null) return;
    await context.read<BrokerHomeCubit>().refreshDashboard(
          brokerId: brokerId,
          minInterval: minInterval,
        );
  }

  void _onLayoutState(BuildContext context, LayoutStates state) {
    final isVisible = LayoutCubit.pageIndex == BrokerHomeView.tabIndex;
    if (isVisible && !_wasVisible) {
      // رجعنا للوحة التحكم: نحدّث الأرقام (ممكن تكون حالة طلب اتغيرت).
      // minInterval يمنع نداء مكرر لو التاب ظهر بعد تحميل الإقلاع فورًا.
      _refresh(minInterval: const Duration(seconds: 2));
    }
    _wasVisible = isVisible;
  }

  @override
  Widget build(BuildContext context) {
    // لا نستخدم Scaffold داخلي لأن LayoutView يوفر Scaffold خارجي - التداخل يسبب hitTest على _ScaffoldSlot.floatingActionButton قبل اكتمال layout
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: _onLayoutState,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              children: [
                BrokerMainSections(),
                Gap(12.h),
                Statistics(brokerId: _brokerId ?? 0),
                Gap(12.h),
                BlocBuilder<BrokerHomeCubit, BrokerHomeStates>(
                  builder: (context, state) {
                    final data =
                        context.read<BrokerHomeCubit>().brokerStatisticsModel?.data ??
                            Data();
                    return OrderStatisticsWidget(data: data);
                  },
                ),
                Gap(12.h),
                LastRequests(brokerId: _brokerId ?? 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

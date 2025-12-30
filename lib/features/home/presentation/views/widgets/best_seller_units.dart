import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import 'package:easy_deal/features/home/presentation/view_model/home_states.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/unit_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'best_seller_empty_list.dart';
import 'best_seller_shimmer_loading_list.dart';

class BestSellerUnits extends StatelessWidget {
  const BestSellerUnits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) {
        return current is GetBestSellerUnitsInHomeSuccessState ||
            current is GetBestSellerUnitsInHomeErrorState ||
            current is GetBestSellerUnitsInHomeLoadingState;
      },
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();
        final units = homeCubit.bestSellerUnitsModel?.data ?? [];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LangKeys.bestSellerUnits.tr(),
                style: AppStyles.black16SemiBold,
              ),
              Gap(8.h),
              SizedBox(
                height: 240.h,
                child:
                state is GetBestSellerUnitsInHomeLoadingState || homeCubit.bestSellerUnitsModel==null? BestSellerShimmerLoadingList():
                    state is GetBestSellerUnitsInHomeErrorState ? ErrorWidgetUi(
                      onRetry: () => context.read<HomeCubit>().getBestSellerUnitsInHome(),
                    ) :
                        state is GetBestSellerUnitsInHomeSuccessState && units.isEmpty ?
                        BestSellerEmptyList():
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount:  units.length,
                  itemBuilder: (context, index) {
                    final unit = units[index];
                    return UnitItem(unit: unit);
                  },
                  separatorBuilder: (context, index) => Gap(12.w),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
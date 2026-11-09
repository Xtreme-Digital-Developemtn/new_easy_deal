import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../../../core/shared_widgets/error_ui.dart';
import '../../../../../main_imports.dart';
import '../../../../assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import 'load_more_indicator.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      buildWhen: (previous, current) =>
          current is SearchInitState ||
          current is GetAllUnitsLoadingState ||
          current is GetAllUnitsSuccessState ||
          current is GetAllUnitsFilterSuccessState ||
          current is GetAllUnitsErrorState ||
          current is GetAllUnitsLoadingMoreState ||
          current is GetAllUnitsLoadMoreSuccessState,
      builder: (context, state) {
        final searchCubit = context.read<SearchCubit>();
        final bool isInitialLoading =
            searchCubit.isLoading && searchCubit.allUnitsModel == null;
        final List<Data>? data = searchCubit.allUnitsModel?.data;
        final bool isEmpty =
            data != null && data.isEmpty && !searchCubit.isLoadingMore;
        // فشل تحميل أول صفحة: مفيش بيانات على الشاشة خالص
        final bool isInitialError = data == null &&
            !searchCubit.isLoading &&
            searchCubit.unitsError != null;
        final bool showFooter =
            searchCubit.hasMore || searchCubit.loadMoreFailed;

        if (isInitialError) {
          return ListView(
            controller: scrollController,
            children: [
              Gap(40.h),
              ErrorWidgetUi(
                message: searchCubit.unitsError,
                onRetry: () => searchCubit.getAllUnits(reset: true),
              ),
            ],
          );
        }

        // مفيش نتائج: الواجهة الفاضية بتتوسّط الشاشة (مش فوق في أول القائمة)
        // مع الحفاظ على السحب للتحديث.
        if (isEmpty) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: EmptyWidget(msg: LangKeys.noUnitsFound),
                  ),
                ),
              );
            },
          );
        }

        int itemCount;
        if (isInitialLoading) {
          itemCount = 5;
        } else if (data != null) {
          itemCount = data.length + (showFooter ? 1 : 0);
        } else {
          itemCount = 0;
        }

        if (itemCount == 0) {
          return const SizedBox.shrink();
        }

        return Skeletonizer(
          enabled: isInitialLoading,
          child: ListView.separated(
            key: const PageStorageKey<String>('search_list'),
            controller: scrollController,
            padding: EdgeInsets.only(bottom: 20.h),
            itemBuilder: (context, index) {
                  if (isInitialLoading) {
                return _buildSkeletonItem();
              }
              if (data == null) {
                return const SizedBox.shrink();
              }
              if (index >= data.length) {
                return LoadMoreIndicator(
                  hasMore: searchCubit.hasMore,
                  isLoadingMore: searchCubit.isLoadingMore,
                  errorMessage:
                      searchCubit.loadMoreFailed ? searchCubit.unitsError : null,
                  onTap: () => searchCubit.loadMoreUnits(),
                );
              }
              final unit = data[index];
              // نفس تصميم كارت «إعلاناتي» بالظبط
              final locationParts = <String>[
                if (unit.city?.nameAr != null) unit.city!.nameAr.toString(),
                if (unit.area?.nameAr != null) unit.area!.nameAr.toString(),
                if (unit.subArea?.nameAr != null)
                  unit.subArea!.nameAr.toString(),
              ];
              return UnitAdCard(
                unitId: unit.id,
                gallery: unit.gallery,
                diagram: unit.diagram?.toString(),
                typeLabel: BrokerTextHelper.unitTypeText(
                  unit.type?.toString() ?? '',
                ),
                title: unit.projectName?.toString() ??
                    unit.developerName?.toString(),
                location: locationParts.join(' - '),
                totalPriceInCash: unit.totalPriceInCash,
                totalPriceInInstallment: unit.totalPriceInInstallment,
                monthlyRent: unit.monthlyRent,
                dailyRent: unit.dailyRent,
                status: unit.status?.toString(),
                rooms: unit.numberOfRooms,
                bathrooms: unit.numberOfBathrooms,
                unitArea: unit.unitArea,
                operationLabel: BrokerTextHelper.unitOperationText(
                  unit.unitOperation?.toString() ?? '',
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (isInitialLoading || data == null || index >= data.length - 1) {
                return const SizedBox.shrink();
              }
              return Gap(12.h);
            },
            itemCount: itemCount,
          ),
        );
      },
    );
  }

  Widget _buildSkeletonItem() {
    // نفس أبعاد كارت الإعلان: صورة 16/9 فوق وسطور بيانات تحت
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150.w,
                  height: 18.h,
                  color: Colors.grey[200],
                ),
                Gap(8.h),
                Container(
                  width: 200.w,
                  height: 14.h,
                  color: Colors.grey[200],
                ),
                Gap(12.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 32.h,
                        color: Colors.grey[200],
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Container(
                        height: 32.h,
                        color: Colors.grey[200],
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Container(
                        height: 32.h,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
                Gap(12.h),
                Container(
                  height: 36.h,
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

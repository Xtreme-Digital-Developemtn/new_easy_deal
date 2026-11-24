import 'package:easy_deal/core/shared_widgets/empty_widget.dart';
import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/faqs/presentation/view_model/faqs_cubit.dart';
import 'package:easy_deal/features/faqs/presentation/view_model/faqs_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class FAQsList extends StatelessWidget {
  const FAQsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FAQsCubit, FAQsStates>(
        builder: (context, state) {
          final fAQsCubit = context.read<FAQsCubit>();

          if (state is GetAllFAQsLoadingState) {
            return CustomLoading();
          }
          if (state is GetAllFAQsErrorState) {
            return ErrorWidgetUi(
              message: state.error,
              onRetry: () => fAQsCubit.getAllFaqs(),
            );
          }

          final faqs = fAQsCubit.faqs;
          if (faqs.isEmpty) {
            return Center(child: EmptyWidget(msg: LangKeys.noQuestionsFound));
          }

          return ListView.separated(
            itemCount: faqs.length,
            separatorBuilder: (context, i) => Gap(12.h),
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return ExpansionTileCard(
                baseColor: AppColors.white,
                expandedColor: AppColors.gray1,
                animateTrailing: false,
                leading: CircleAvatar(
                  backgroundColor: AppColors.blueLight,
                  child: Text("${index + 1}"),
                ),
                title: Text(_localized(context, faq.question?.ar, faq.question?.en)),
                onExpansionChanged: (value) {},
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      child: Text(_localized(context, faq.answer?.ar, faq.answer?.en)),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  /// Falls back to the other language when the current one is missing,
  /// and to an empty string instead of printing "null" on screen.
  String _localized(BuildContext context, String? ar, String? en) {
    final preferred = context.isArabic ? ar : en;
    final fallback = context.isArabic ? en : ar;
    final value = (preferred?.trim().isNotEmpty ?? false) ? preferred : fallback;
    return value?.trim() ?? '';
  }
}

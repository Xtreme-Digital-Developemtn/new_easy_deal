import 'package:easy_deal/core/shared_widgets/error_ui.dart';
import 'package:easy_deal/features/faqs/presentation/view_model/faqs_cubit.dart';
import 'package:easy_deal/features/faqs/presentation/view_model/faqs_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class FAQsList extends StatefulWidget {
  const FAQsList({super.key});

  @override
  State<FAQsList> createState() => _FAQsListState();
}

class _FAQsListState extends State<FAQsList> {

  // final int itemCount = 3;
  // late List<bool> isExpandedList;
  // late List<GlobalKey<ExpansionTileCardState>> keys;
  @override
  void initState() {
    super.initState();
    // isExpandedList = List.generate(itemCount, (_) => false);
    // keys = List.generate(itemCount, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FAQsCubit , FAQsStates>(
        builder: (context,state){
          var fAQsCubit = context.read<FAQsCubit>();
          return
            state is GetAllFAQsLoadingState ? CustomLoading():
                state is GetAllFAQsErrorState ? ErrorWidgetUi(onRetry: (){
                  fAQsCubit.getAllFaqs();
                }):
            ListView.separated(
            itemCount: fAQsCubit.faqsModel!.data!.length,
            separatorBuilder: (context, i) => Gap(12.h),
            itemBuilder: (context, index) {
              return ExpansionTileCard(
                baseColor: AppColors.white,
                expandedColor:AppColors.gray1,
                // key: keys[index],
                animateTrailing: false,
                // trailing: GestureDetector(
                //   onTap: () {
                //     if (isExpandedList[index]) {
                //       keys[index].currentState!.collapse();
                //     }
                //     else {
                //       keys[index].currentState!.expand();
                //     }
                //     setState(() {
                //       isExpandedList[index] = !isExpandedList[index];
                //     });
                //   },
                //
                //   child: SvgPicture.asset(
                //     isExpandedList[index] ? SvgImages.minus : SvgImages.add2,
                //     height: 24.h,
                //   ),
                // ),
                leading: CircleAvatar(
                  backgroundColor: AppColors.blueLight,
                  child: Text("${index + 1}"),
                ),
                title:context.isArabic ? Text("${fAQsCubit.faqsModel!.data![index].question!.ar}"): Text("${fAQsCubit.faqsModel!.data![index].question!.en}"),
                onExpansionChanged: (value) {},
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      child: context.isArabic ? Text("${fAQsCubit.faqsModel!.data![index].answer!.ar}"): Text("${fAQsCubit.faqsModel!.data![index].answer!.en}"),
                    ),
                  )
                ],
              );
            },
          );
        },

      ),
    );
  }
}

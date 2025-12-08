import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/category_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateRequestView extends StatelessWidget {
  const CreateRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.createNewRequest.tr()),
      body: BlocBuilder<CreateRequestCubit , CreateRequestStates>(
        builder: (context,state){
          var createRequestCubit = context.read<CreateRequestCubit>();
          return Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.r,
                      mainAxisSpacing: 16.r,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: createRequestCubit.categories.length,
                    itemBuilder: (context, index) {
                      final category = createRequestCubit.categories[index];

                      return CategoryItem(index: index, image: category.image, name: category.name);
                    },
                  ),
                ),
                if (createRequestCubit.selectedIndex != -1)
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: CustomButton(
                      onPressed: () {
                        context.pushNamed(
                          Routes.createRequestByCategoryView,
                          arguments: {
                            'cubit': createRequestCubit,
                            'category': createRequestCubit.categories[createRequestCubit.selectedIndex],
                          },
                        );


                      },
                      text: LangKeys.next.tr(),
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

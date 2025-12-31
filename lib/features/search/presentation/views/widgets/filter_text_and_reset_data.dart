import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class FilterTextAndResetData extends StatelessWidget {
  const FilterTextAndResetData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LangKeys.filter.tr(),
          style: AppStyles.black16SemiBold,),
        IconButton(onPressed: (){
          context.read<SearchCubit>().resetFilters();

        },
            icon: Icon(Icons.refresh))
      ],
    );
  }
}



import '../../../../../main_imports.dart';
import '../../view_model/request_details_cubit.dart';
import '../../view_model/request_details_states.dart';

class RequestDetailsTabs extends StatelessWidget {
  const RequestDetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      buildWhen: (previous, current) =>
      current is RequestDetailsChangeTabState,
      builder: (context, state) {
        final cubit = RequestDetailsCubit.get(context);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildTab(
                context: context,
                title: 'نظرة عامة',
                index: 0,
                isSelected: cubit.selectedIndex == 0,
              ),

              const SizedBox(width: 12),

              _buildTab(
                context: context,
                title: 'الردود المرسلة',
                index: 1,
                isSelected: cubit.selectedIndex == 1,
              ),

              const SizedBox(width: 12),

              _buildTab(
                context: context,
                title: 'الردود',
                index: 2,
                isSelected: cubit.selectedIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab({
    required BuildContext context,
    required String title,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        RequestDetailsCubit.get(context).changeTab(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff202477)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xff202477)
                : const Color(0xffD5DEFF),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? Colors.white
                : const Color(0xff202477),
          ),
        ),
      ),
    );
  }
}

import '../../../../../main_imports.dart';
import '../../view_model/request_details_cubit.dart';

class RequestInfoGrid extends StatelessWidget {
  const RequestInfoGrid({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    var requestDetailsCubit = context.read<RequestDetailsCubit>();
    var details =  requestDetailsCubit
        .requestDetailsModel!
        .data!;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.2,
        children: [
          _RequestInfoCard(
            icon: Icons.person_outline,
            value: details.user!.name.toString(),
            label: 'اسم الوسيط',
          ),

          _RequestInfoCard(
            icon: Icons.calendar_month_outlined,
            value:  details.createdAt.toString(),
            label: 'تاريخ الطلب',
          ),

          _RequestInfoCard(
            icon: Icons.phone_outlined,
            value: details.user!.phone.toString(),
            label: 'رقم الهاتف',
          ),

          _RequestInfoCard(
            icon: Icons.thumb_up_alt_outlined,
            value: details.numberOfReplies.toString(),
            label: 'الردود',
          ),
        ],
      ),
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
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE1E4E8),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                color: Color(0xFFF0F4FF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: Color(0xFF28247F),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              label,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
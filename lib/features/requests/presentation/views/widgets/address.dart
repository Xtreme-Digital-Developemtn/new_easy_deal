import '../../../../../main_imports.dart';

class Address extends StatelessWidget {
  const Address({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(SvgImages.location2),
        Gap(8.w),
        Expanded(
          child: Text(
            address,
            style: AppStyles.black14Medium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

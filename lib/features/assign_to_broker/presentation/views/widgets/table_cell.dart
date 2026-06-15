import '../../../../../main_imports.dart';

class TableCellWidget extends StatelessWidget {
  const TableCellWidget(this.text, {super.key, this.isHeader = false});
  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Text(
        text,
        style: isHeader ? AppStyles.black14SemiBold : AppStyles.black12Medium.copyWith(fontSize: 10.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}

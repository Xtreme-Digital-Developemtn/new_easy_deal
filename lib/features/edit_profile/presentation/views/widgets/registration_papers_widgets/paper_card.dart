import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/get_file_icon.dart';
import '../../../../../../main_imports.dart';

class PaperCard extends StatelessWidget {
  const PaperCard(this.file, this.index, {super.key});
  final Map<String, dynamic> file;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileStates>(
      builder: (context, state) {
        var cubit = context.read<EditProfileCubit>();
        return Container(
          padding: EdgeInsets.all(18.r),
          margin: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                   getFileIcon(file['name']),
                  color: Colors.blue,
                  size: 32.sp,
                ),
              ),

              Gap(14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.black16SemiBold,
                    ),
                    Gap(4.h),
                    Text(
                      LangKeys.tapToEditOrDelete.tr(),
                      style: AppStyles.gray14Medium,
                    ),
                  ],
                ),
              ),

              Gap(8.w),
              
              Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(SvgImages.edit),
                    onPressed: () => cubit.editFile(index),
                    splashRadius: 22,
                  ),
                  IconButton(
                    icon: SvgPicture.asset(SvgImages.trash,
                    colorFilter: ColorFilter.mode(AppColors.errorLight, BlendMode.srcIn),),
                    onPressed: () => cubit.deleteFile(index),
                    splashRadius: 22,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

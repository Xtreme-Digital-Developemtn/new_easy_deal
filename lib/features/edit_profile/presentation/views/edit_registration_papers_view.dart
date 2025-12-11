import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/registration_papers_widgets/paper_card.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../view_model/edit_profile_cubit.dart';

class EditRegistrationPapersView extends StatelessWidget {
  const EditRegistrationPapersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.registrationPapers.tr()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: context.read<EditProfileCubit>().pickNewFile,
        icon: const Icon(Icons.upload_file,color: AppColors.white,),
        label:   Text(LangKeys.add.tr(),style: AppStyles.white14SemiBold,),
        backgroundColor: AppColors.primaryDark,
      ),
      body: BlocBuilder<EditProfileCubit, EditProfileStates>(
        builder: (context, state) {
          var editProfileCubit = context.read<EditProfileCubit>();
          return Padding(
            padding: EdgeInsets.all(20.0.r),
            child: editProfileCubit.uploadedFiles.isEmpty
                ? Center(
                    child: Text(
                      LangKeys.noFilesCurrentlyAvailable.tr(),
                      style: AppStyles.black16SemiBold,
                    ),
                  )
                : ListView.separated(
                    itemCount: editProfileCubit.uploadedFiles.length,
                    separatorBuilder: (_, __) => Gap(  12.h),
                    itemBuilder: (context, index) {
                      return PaperCard(
                        editProfileCubit.uploadedFiles[index],
                        index,
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}

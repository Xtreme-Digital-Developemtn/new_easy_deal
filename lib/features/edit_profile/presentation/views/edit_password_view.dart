import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_password_widgets/edit_password_button.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_password_widgets/edit_password_form.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';

import '../view_model/edit_profile_cubit.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({super.key});

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileCubit>().clientProfileModel?.data;
    final cubit = context.read<EditProfileCubit>();
    cubit.nameCon = TextEditingController(text: profile?.fullName ?? "");
    cubit.emailCon = TextEditingController(text: profile?.email ?? "");
    cubit.mobileNumberCon = TextEditingController(text: profile?.phone ?? "");
    cubit.role = profile?.role;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.changePassword),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r) ,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const EditPasswordForm(),
              Gap(20.h),
              EditPasswordButton(formKey: formKey,),
            ],
          ),
        ),
      ),
    );
  }
}

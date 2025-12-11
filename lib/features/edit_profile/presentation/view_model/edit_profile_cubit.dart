 import 'package:file_picker/file_picker.dart';

import '../../../../main_imports.dart';
import '../../data/repos/edit_profile_repo.dart';
import 'edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitState());

  EditProfileRepo? editProfileRepo;

  static EditProfileCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> uploadedFiles = [];
  Future<void> editFile(int index) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {
        uploadedFiles[index] = {
          "name": result.files.single.name,
          "path": result.files.single.path,
        };

      emit(EditPaperState());
    }
  }

  void deleteFile(int index) {
      uploadedFiles.removeAt(index);
      emit(DeletePaperState());
  }

  Future<void> pickNewFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {

        uploadedFiles.add({
          "name": result.files.single.name,
          "path": result.files.single.path,
        });
    emit(UploadPaperState());
    }
  }

}
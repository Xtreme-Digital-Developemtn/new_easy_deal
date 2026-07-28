import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../../main_imports.dart';
import '../../../../broker_features/boker_data/data/models/broker_units_model.dart';
import '../../../../unit_details/data/models/unit_details_response.dart';
import '../../data/models/models_response.dart';
import '../../data/models/developer_projects_model.dart';
import '../../data/models/developers_model.dart';
import '../../data/repos/broker_developers_repo.dart';
import 'broker_developers_states.dart';

class BrokerDevelopersCubit extends Cubit<BrokerDevelopersStates> {
  BrokerDevelopersCubit(this.brokerDevelopersRepo) : super(BrokerDevelopersInitState());

  BrokerDevelopersRepo? brokerDevelopersRepo;

  static BrokerDevelopersCubit get(context) => BlocProvider.of(context);

  DevelopersModel? developersModel;
  DeveloperProjectsModel? developerProjectsModel;

  final ImagePicker picker = ImagePicker();

  File? contractImage;
  File? contractIdFront;
  File? contractIdBack;
  File? contractCommercialRegistry;
  File? contractTaxCard;

  Future<void> pickContractImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      contractImage = File(pickedFile.path);
      emit(BrokerDevelopersInitState());
    }
  }

  Future<void> pickContractIdFront() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      contractIdFront = File(pickedFile.path);
      emit(BrokerDevelopersInitState());
    }
  }

  Future<void> pickContractIdBack() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      contractIdBack = File(pickedFile.path);
      emit(BrokerDevelopersInitState());
    }
  }

  Future<void> pickContractCommercialRegistry() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      contractCommercialRegistry = File(pickedFile.path);
      emit(BrokerDevelopersInitState());
    }
  }

  Future<void> pickContractTaxCard() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      contractTaxCard = File(pickedFile.path);
      emit(BrokerDevelopersInitState());
    }
  }

  void clearContractFiles() {
    contractImage = null;
    contractIdFront = null;
    contractIdBack = null;
    contractCommercialRegistry = null;
    contractTaxCard = null;
  }

  Future<void> sendContractRequest({
    required int brokerId,
    required int developerId,
  }) async {
    emit(ContractRequestLoadingState());
    var result = await brokerDevelopersRepo!.sendContractRequest(
      brokerId: brokerId,
      developerId: developerId,
      image: contractImage,
      idFront: contractIdFront,
      idBack: contractIdBack,
      commercialRegistryImage: contractCommercialRegistry,
      taxCardImage: contractTaxCard,
    );
    return result.fold(
      (failure) {
        emit(ContractRequestErrorState(failure.errMessage));
      },
      (data) async {
        clearContractFiles();
        emit(ContractRequestSuccessState(data['message']?.toString() ?? 'تم إرسال الطلب بنجاح'));
      },
    );
  }

  Future<void> getDevelopers() async {
    emit(GetDevelopersLoadingState());
    var result = await brokerDevelopersRepo!.getDevelopers();
    return result.fold(
      (failure) {
        emit(GetDevelopersErrorState(failure.errMessage));
      },
      (data) async {
        developersModel = data;
        emit(GetDevelopersSuccessState(data));
      },
    );
  }

  Future<void> getDeveloperProjects(int developerId) async {
    emit(GetDeveloperProjectsLoadingState());
    var result = await brokerDevelopersRepo!.getDeveloperProjects(developerId);
    return result.fold(
      (failure) {
        emit(GetDeveloperProjectsErrorState(failure.errMessage));
      },
      (data) async {
        developerProjectsModel = data;
        emit(GetDeveloperProjectsSuccessState(data));
      },
    );
  }

  ModelsResponse? projectModelsResponse;

  Future<void> getProjectModels(int projectId) async {
    emit(GetProjectModelsLoadingState());
    var result = await brokerDevelopersRepo!.getProjectModels(projectId);
    return result.fold(
      (failure) {
        emit(GetProjectModelsErrorState(failure.errMessage));
      },
      (data) async {
        projectModelsResponse = data;
        emit(GetProjectModelsSuccessState(data));
      },
    );
  }

  BrokerUnitsModel? modelUnitsResponse;

  Future<void> getModelUnits(int modelId) async {
    emit(GetModelUnitsLoadingState());
    var result = await brokerDevelopersRepo!.getModelUnits(modelId);
    return result.fold(
      (failure) {
        emit(GetModelUnitsErrorState(failure.errMessage));
      },
      (data) async {
        modelUnitsResponse = data;
        emit(GetModelUnitsSuccessState(data));
      },
    );
  }

  UnitDetailsResponse? unitDetailsResponse;

  Future<void> getUnitDetails(int unitId) async {
    emit(GetUnitDetailsLoadingState());
    var result = await brokerDevelopersRepo!.getUnitDetails(unitId);
    return result.fold(
      (failure) {
        emit(GetUnitDetailsErrorState(failure.errMessage));
      },
      (data) async {
        unitDetailsResponse = data;
        emit(GetUnitDetailsSuccessState(data));
      },
    );
  }
}
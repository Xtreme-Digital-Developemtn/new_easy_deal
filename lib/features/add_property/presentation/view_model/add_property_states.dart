abstract class AddPropertyStates {}

class AddPropertyInitState extends AddPropertyStates {}

// Step 0 selections
class Step0ChangedState extends AddPropertyStates {}

// Generic form value change
class FormValueChangedState extends AddPropertyStates {}

// Step navigation
class MoveStepState extends AddPropertyStates {}

class ValidationState extends AddPropertyStates {}

// Location
class GetCitiesLoadingState extends AddPropertyStates {}
class GetCitiesSuccessState extends AddPropertyStates {}
class GetCitiesErrorState extends AddPropertyStates {
  final String message;
  GetCitiesErrorState(this.message);
}

class GetAreasLoadingState extends AddPropertyStates {}
class GetAreasSuccessState extends AddPropertyStates {}
class GetAreasErrorState extends AddPropertyStates {
  final String message;
  GetAreasErrorState(this.message);
}

class GetSubAreasLoadingState extends AddPropertyStates {}
class GetSubAreasSuccessState extends AddPropertyStates {}
class GetSubAreasErrorState extends AddPropertyStates {
  final String message;
  GetSubAreasErrorState(this.message);
}

class SelectLocationState extends AddPropertyStates {}

// Files
class FilesChangedState extends AddPropertyStates {}
class PickFileErrorState extends AddPropertyStates {}

// Submit
class CreateUnitLoadingState extends AddPropertyStates {}
class CreateUnitSuccessState extends AddPropertyStates {
  final bool published;
  CreateUnitSuccessState({this.published = false});
}
class CreateUnitErrorState extends AddPropertyStates {
  final String message;
  CreateUnitErrorState(this.message);
}

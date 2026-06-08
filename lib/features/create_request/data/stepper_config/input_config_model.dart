import 'stepper_constants.dart';

enum InputFieldType { text, number, select, multiSelect, checkbox, file, textarea, url, date }

class InputConfig {
  final int step;
  final String name;
  final InputFieldType type;
  final String label;
  final List<OptionItem>? options;
  final bool Function()? visibility;
  final bool isDynamic;

  const InputConfig({
    required this.step,
    required this.name,
    required this.type,
    required this.label,
    this.options,
    this.visibility,
    this.isDynamic = false,
  });

  bool isVisible() => visibility?.call() ?? true;
  bool get required => _requiredFields.contains(name);
}

const _requiredFields = <String>{
  'compoundName',
  'detailedAddress',
  'addressLink',
  'projectManagement',
  'projectConstructor',
  'mallName',
  'cityId',
  'areaId',
  'floor',
  'unitArea',
  'unitAreaMin',
  'unitAreaMax',
  'rooms',
  'bathRooms',
  'finishingStatus',
  'deliveryStatus',
  'averageUnitPriceMin',
  'averageUnitPriceMax',
  'averageUnitPriceMonthlyMin',
  'averageUnitPriceMonthlyMax',
  'averageUnitPriceDailyMin',
  'averageUnitPriceDailyMax',
  'cashPrice',
  'installmentPrice',
  'requestedOver',
  'unitPrice',
  'unitPriceMonthly',
  'unitPriceDaily',
};

class StepperConfiguration {
  final String key;
  final List<InputConfig> inputs;

  const StepperConfiguration({required this.key, required this.inputs});
}

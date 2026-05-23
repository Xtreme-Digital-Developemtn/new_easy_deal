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
}

class StepperConfiguration {
  final String key;
  final List<InputConfig> inputs;

  const StepperConfiguration({required this.key, required this.inputs});
}

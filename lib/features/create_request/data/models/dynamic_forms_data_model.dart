
class DynamicFormsDataModel {
  bool? success;
  List<Data>? data;

  DynamicFormsDataModel({this.success, this.data});

  DynamicFormsDataModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? label;
  String? type;
  String? placeholder;
  List<Options>? options;
  String? specializationScope;
  String? typeFilter;
  String? unitFilter;
  bool? isRequired;
  int? sortOrder;
  int? stepNumber;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.label, this.type, this.placeholder, this.options, this.specializationScope, this.typeFilter, this.unitFilter, this.isRequired, this.sortOrder, this.stepNumber, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    label = json["label"];
    type = json["type"];
    placeholder = json["placeholder"];
    options = json["options"] == null ? null : (json["options"] as List).map((e) => Options.fromJson(e)).toList();
    specializationScope = json["specialization_scope"];
    typeFilter = json["type_filter"];
    unitFilter = json["unit_filter"];
    isRequired = json["is_required"];
    sortOrder = json["sort_order"];
    stepNumber = json["step_number"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["label"] = label;
    _data["type"] = type;
    _data["placeholder"] = placeholder;
    if(options != null) {
      _data["options"] = options?.map((e) => e.toJson()).toList();
    }
    _data["specialization_scope"] = specializationScope;
    _data["type_filter"] = typeFilter;
    _data["unit_filter"] = unitFilter;
    _data["is_required"] = isRequired;
    _data["sort_order"] = sortOrder;
    _data["step_number"] = stepNumber;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Options {
  String? label;
  String? value;

  Options({this.label, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    label = json["label"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["label"] = label;
    _data["value"] = value;
    return _data;
  }
}
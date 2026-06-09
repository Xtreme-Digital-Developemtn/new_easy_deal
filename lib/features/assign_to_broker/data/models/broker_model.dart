class BrokerModel {
  final int id;
  final String accountType;
  final String fullName;
  final String image;
  final String name;
  final List<Specializations> specializations;
  final List<Areas> areas;
  final String type;
  final String imageUrl;
  bool selected;

  BrokerModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.accountType,
    required this.specializations,
    required this.areas,
    required this.image,
    required this.type,
    required this.imageUrl,
    this.selected = false,
  });

  factory BrokerModel.fromJson(Map<String, dynamic> json) {
    return BrokerModel(
      id: json['id'] ?? 0,

      accountType:
      json['accountType'] ??
          json['account_type'] ??
          '',

      fullName:
      json['fullName'] ??
          json['full_name'] ??
          '',

      image: json['image'] ?? '',

      name:
      json['name'] ??
          json['full_name'] ??
          '',

      type:
      json['type'] ??
          json['account_type'] ??
          '',

      imageUrl:
      json['imageUrl'] ??
          json['image_url'] ??
          json['image'] ??
          json['logo'] ??
          '',

      specializations: (json['specializations'] as List?)
          ?.map((e) => Specializations.fromJson(e))
          .toList() ??
          [],

      areas: (json['areas'] as List?)
          ?.map((e) => Areas.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountType': accountType,
      'fullName': fullName,
      'image': image,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'specializations':
      specializations.map((e) => e.toJson()).toList(),
      'areas': areas.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BrokerModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Specializations {
  int? id;
  String? specialization;
  String? specializationScope;

  Specializations({
    this.id,
    this.specialization,
    this.specializationScope,
  });

  factory Specializations.fromJson(Map<String, dynamic> json) {
    return Specializations(
      id: json['id'],
      specialization: json['specialization'],
      specializationScope: json['specializationScope'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization,
      'specializationScope': specializationScope,
    };
  }
}

class Areas {
  String? nameEn;
  String? nameAr;
  int? cityId;

  Areas({
    this.nameEn,
    this.nameAr,
    this.cityId,
  });

  factory Areas.fromJson(Map<String, dynamic> json) {
    return Areas(
      nameEn: json['nameEn'],
      nameAr: json['nameAr'],
      cityId: json['cityId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameEn': nameEn,
      'nameAr': nameAr,
      'cityId': cityId,
    };
  }
}
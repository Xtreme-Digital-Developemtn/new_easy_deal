import 'dart:convert';

class UnitMakeRequestModel {
  final String status;
  final String message;
  final UnitRequestData data;

  UnitMakeRequestModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UnitMakeRequestModel.fromJson(Map<String, dynamic> json) {
    return UnitMakeRequestModel(
      status: json['status'],
      message: json['message'],
      data: UnitRequestData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UnitRequestData {
  final int id;
  final String title;
  final String specializationScope;
  final String type;
  final String unit;
  final int userId;
  final String status;
  final int numberOfReplies;
  final String attributes;
  final DateTime createdAt;
  final DateTime updatedAt;

  UnitRequestData({
    required this.id,
    required this.title,
    required this.specializationScope,
    required this.type,
    required this.unit,
    required this.userId,
    required this.status,
    required this.numberOfReplies,
    required this.attributes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UnitRequestData.fromJson(Map<String, dynamic> json) {
    return UnitRequestData(
      id: json['id'],
      title: json['title'],
      specializationScope: json['specialization_scope'],
      type: json['type'],
      unit: json['unit'],
      userId: json['user_id'],
      status: json['status'],
      numberOfReplies: json['number_of_replies'],
      attributes: json['attributes'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'specialization_scope': specializationScope,
      'type': type,
      'unit': unit,
      'user_id': userId,
      'status': status,
      'number_of_replies': numberOfReplies,
      'attributes': attributes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// لتحويل الـ attributes إلى Map بسهولة
  Map<String, dynamic> get attributesMap =>
      jsonDecode(attributes) as Map<String, dynamic>;
}
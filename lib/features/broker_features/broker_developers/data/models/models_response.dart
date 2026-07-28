class ModelsResponse {
  final String status;
  final String message;
  final List<ModelData> data;
  final int count;

  ModelsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.count,
  });

  factory ModelsResponse.fromJson(Map<String, dynamic> json) {
    return ModelsResponse(
      status: json['status'],
      message: json['message'],
      count: json['count'],
      data: (json['data'] as List)
          .map((e) => ModelData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'count': count,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class ModelData {
  final dynamic id;
  final dynamic date;
  final dynamic code;
  final dynamic unitType;
  final dynamic subUnitType;
  final dynamic numberOfUnits;
  final dynamic numberOfRooms;
  final dynamic numberOfBathrooms;
  final dynamic numberOfFloors;
  final dynamic unitArea;
  final dynamic landingArea;
  final dynamic projectId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Project project;

  ModelData({
    required this.id,
    required this.date,
    required this.code,
    required this.unitType,
    this.subUnitType,
    required this.numberOfUnits,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.numberOfFloors,
    required this.unitArea,
    required this.landingArea,
    required this.projectId,
    required this.createdAt,
    required this.updatedAt,
    required this.project,
  });

  factory ModelData.fromJson(Map<String, dynamic> json) {
    return ModelData(
      id: json['id'],
      date: json['date'],
      code: json['code'],
      unitType: json['unitType'],
      subUnitType: json['subUnitType'],
      numberOfUnits: json['numberOfUnits'],
      numberOfRooms: json['numberOfRooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      numberOfFloors: json['numberOfFloors'],
      unitArea: json['unitArea'],
      landingArea: json['landingArea'],
      projectId: json['projectId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      project: Project.fromJson(json['project']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'code': code,
    'unitType': unitType,
    'subUnitType': subUnitType,
    'numberOfUnits': numberOfUnits,
    'numberOfRooms': numberOfRooms,
    'numberOfBathrooms': numberOfBathrooms,
    'numberOfFloors': numberOfFloors,
    'unitArea': unitArea,
    'landingArea': landingArea,
    'projectId': projectId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'project': project.toJson(),
  };
}

class Project {
  final dynamic id;
  final dynamic name;
  final dynamic managementTeam;
  final Developer developer;
  final List<dynamic> otherSubAreas;

  Project({
    required this.id,
    required this.name,
    required this.managementTeam,
    required this.developer,
    required this.otherSubAreas,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      managementTeam: json['managementTeam'],
      developer: Developer.fromJson(json['developer']),
      otherSubAreas: json['otherSubAreas'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'managementTeam': managementTeam,
    'developer': developer.toJson(),
    'otherSubAreas': otherSubAreas,
  };
}

class Developer {
  final dynamic id;
  final dynamic name;
  final dynamic email;

  Developer({
    required this.id,
    this.name,
    this.email,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
  };
}
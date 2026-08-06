class BrokerMapsModel {
  String? status;
  String? message;
  BrokerMapsData? data;

  BrokerMapsModel({
    this.status,
    this.message,
    this.data,
  });

  BrokerMapsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? BrokerMapsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class BrokerMapsData {
  List<MapItem>? data;
  int? count;

  BrokerMapsData({
    this.data,
    this.count,
  });

  BrokerMapsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((e) => MapItem.fromJson(e))
          .toList();
    }

    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}

class MapItem {
  int? id;
  int? brokerId;
  String? description;
  String? fileUrl;
  ImageUrl? imageUrl;
  String? createdAt;

  MapItem({
    this.id,
    this.brokerId,
    this.description,
    this.fileUrl,
    this.imageUrl,
    this.createdAt,
  });

  MapItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brokerId = json['broker_id'];
    description = json['description'];
    fileUrl = json['fileUrl'];
    imageUrl = json['imageUrl'] != null
        ? ImageUrl.fromJson(json['imageUrl'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'broker_id': brokerId,
      'description': description,
      'fileUrl': fileUrl,
      'imageUrl': imageUrl?.toJson(),
      'created_at': createdAt,
    };
  }
}

class ImageUrl {
  int? id;
  String? url;
  String? type;

  ImageUrl({
    this.id,
    this.url,
    this.type,
  });

  ImageUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'type': type,
    };
  }
}
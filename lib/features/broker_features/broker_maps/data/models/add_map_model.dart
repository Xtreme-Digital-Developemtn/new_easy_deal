class AddMapModel {
  String? status;
  String? message;
  Data? data;

  AddMapModel({this.status, this.message, this.data});

  AddMapModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? brokerId;
  int? galleryId;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.brokerId,
        this.galleryId,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    brokerId = json['broker_id'];
    galleryId = json['gallery_id'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['broker_id'] = this.brokerId;
    data['gallery_id'] = this.galleryId;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

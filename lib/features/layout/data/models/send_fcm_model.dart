class SendFcmModel {
  final String? status;
  final String? message;
  final dynamic data;

  SendFcmModel({
    this.status,
    this.message,
    this.data,
  });

  factory SendFcmModel.fromJson(Map<String, dynamic> json) {
    return SendFcmModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }
}
class UnitSendReplyModel {
  final String status;
  final String message;

  UnitSendReplyModel({required this.status, required this.message});

  factory UnitSendReplyModel.fromJson(Map<String, dynamic> json) {
    return UnitSendReplyModel(
      status: json['status'],
      message: json['message'],
    );
  }
}

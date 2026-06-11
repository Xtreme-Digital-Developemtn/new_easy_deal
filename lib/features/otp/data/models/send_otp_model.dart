class SendOtpModel {
  String? status;
  String? message;
  Data? data;

  SendOtpModel({this.status, this.message, this.data});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
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
  String? otp;
  String? smsStatus;
  Response? response;
  String? message;
  DebugInfo? debugInfo;

  Data({this.otp, this.smsStatus, this.response, this.message, this.debugInfo});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    smsStatus = json['sms_status'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    message = json['message'];
    debugInfo = json['debug_info'] != null
        ? new DebugInfo.fromJson(json['debug_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['sms_status'] = this.smsStatus;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['message'] = this.message;
    if (this.debugInfo != null) {
      data['debug_info'] = this.debugInfo!.toJson();
    }
    return data;
  }
}

class Response {
  String? code;
  String? sMSID;
  String? cost;

  Response({this.code, this.sMSID, this.cost});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    sMSID = json['SMSID'];
    cost = json['Cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['SMSID'] = this.sMSID;
    data['Cost'] = this.cost;
    return data;
  }
}

class DebugInfo {
  bool? otpGenerated;
  bool? smsDelivered;
  String? responseCode;

  DebugInfo({this.otpGenerated, this.smsDelivered, this.responseCode});

  DebugInfo.fromJson(Map<String, dynamic> json) {
    otpGenerated = json['otp_generated'];
    smsDelivered = json['sms_delivered'];
    responseCode = json['response_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp_generated'] = this.otpGenerated;
    data['sms_delivered'] = this.smsDelivered;
    data['response_code'] = this.responseCode;
    return data;
  }
}

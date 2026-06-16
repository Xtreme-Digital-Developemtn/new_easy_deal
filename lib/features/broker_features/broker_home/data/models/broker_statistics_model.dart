class BrokerStatisticsModel {
  String? status;
  String? message;
  Data? data;

  BrokerStatisticsModel({this.status, this.message, this.data});

  BrokerStatisticsModel.fromJson(Map<String, dynamic> json) {
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
  int? allRequestsCount;
  int? numberOfReceivedRequestsForBroker;
  int? numberOfCreatedRequestsForBroker;
  int? newRequestsCount;
  int? inProcessingRequestsCount;
  int? finishedRequestsCount;

  Data(
      {this.allRequestsCount,
        this.numberOfReceivedRequestsForBroker,
        this.numberOfCreatedRequestsForBroker,
        this.newRequestsCount,
        this.inProcessingRequestsCount,
        this.finishedRequestsCount});

  Data.fromJson(Map<String, dynamic> json) {
    allRequestsCount = json['allRequestsCount'];
    numberOfReceivedRequestsForBroker =
    json['numberOfReceivedRequestsForBroker'];
    numberOfCreatedRequestsForBroker = json['numberOfCreatedRequestsForBroker'];
    newRequestsCount = json['newRequestsCount'];
    inProcessingRequestsCount = json['inProcessingRequestsCount'];
    finishedRequestsCount = json['finishedRequestsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allRequestsCount'] = this.allRequestsCount;
    data['numberOfReceivedRequestsForBroker'] =
        this.numberOfReceivedRequestsForBroker;
    data['numberOfCreatedRequestsForBroker'] =
        this.numberOfCreatedRequestsForBroker;
    data['newRequestsCount'] = this.newRequestsCount;
    data['inProcessingRequestsCount'] = this.inProcessingRequestsCount;
    data['finishedRequestsCount'] = this.finishedRequestsCount;
    return data;
  }
}

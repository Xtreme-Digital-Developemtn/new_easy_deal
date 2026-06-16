class PromoCodesLastAppliedModel {
  bool? success;
  String? message;
  Data? data;

  PromoCodesLastAppliedModel({this.success, this.message, this.data});

  PromoCodesLastAppliedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? promoCode;
  int? discountPercentage;
  String? expiredDate;
  String? appliedAt;
  String? endDate;

  Data(
      {this.id,
        this.promoCode,
        this.discountPercentage,
        this.expiredDate,
        this.appliedAt,
        this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promoCode = json['promo_code'];
    discountPercentage = json['discount_percentage'];
    expiredDate = json['expired_date'];
    appliedAt = json['applied_at'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['promo_code'] = this.promoCode;
    data['discount_percentage'] = this.discountPercentage;
    data['expired_date'] = this.expiredDate;
    data['applied_at'] = this.appliedAt;
    data['end_date'] = this.endDate;
    return data;
  }
}

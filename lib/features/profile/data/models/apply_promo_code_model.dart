class ApplyPromoCodeModel {
  bool? success;
  String? message;
  Data? data;

  ApplyPromoCodeModel({this.success, this.message, this.data});

  ApplyPromoCodeModel.fromJson(Map<String, dynamic> json) {
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
  String? discountPercentage;
  PromoCode? promoCode;

  Data({this.discountPercentage, this.promoCode});

  Data.fromJson(Map<String, dynamic> json) {
    discountPercentage = json['discount_percentage'];
    promoCode = json['promo_code'] != null
        ? new PromoCode.fromJson(json['promo_code'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount_percentage'] = this.discountPercentage;
    if (this.promoCode != null) {
      data['promo_code'] = this.promoCode!.toJson();
    }
    return data;
  }
}

class PromoCode {
  int? id;
  String? promoCode;
  int? discountPercentage;
  String? expiredDate;
  bool? activeInActive;
  bool? used;
  Null? usedAt;
  String? createdAt;
  String? updatedAt;
  AssignedUser? assignedUser;
  int? logsCount;
  List<RecentLogs>? recentLogs;

  PromoCode(
      {this.id,
        this.promoCode,
        this.discountPercentage,
        this.expiredDate,
        this.activeInActive,
        this.used,
        this.usedAt,
        this.createdAt,
        this.updatedAt,
        this.assignedUser,
        this.logsCount,
        this.recentLogs});

  PromoCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promoCode = json['promo_code'];
    discountPercentage = json['discount_percentage'];
    expiredDate = json['expired_date'];
    activeInActive = json['active_in_active'];
    used = json['used'];
    usedAt = json['used_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    assignedUser = json['assigned_user'] != null
        ? new AssignedUser.fromJson(json['assigned_user'])
        : null;
    logsCount = json['logs_count'];
    if (json['recent_logs'] != null) {
      recentLogs = <RecentLogs>[];
      json['recent_logs'].forEach((v) {
        recentLogs!.add(new RecentLogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['promo_code'] = this.promoCode;
    data['discount_percentage'] = this.discountPercentage;
    data['expired_date'] = this.expiredDate;
    data['active_in_active'] = this.activeInActive;
    data['used'] = this.used;
    data['used_at'] = this.usedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.assignedUser != null) {
      data['assigned_user'] = this.assignedUser!.toJson();
    }
    data['logs_count'] = this.logsCount;
    if (this.recentLogs != null) {
      data['recent_logs'] = this.recentLogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignedUser {
  int? id;
  String? fullName;
  String? email;
  String? role;

  AssignedUser({this.id, this.fullName, this.email, this.role});

  AssignedUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}

class RecentLogs {
  int? id;
  bool? applied;
  String? appliedAt;

  RecentLogs({this.id, this.applied, this.appliedAt});

  RecentLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applied = json['applied'];
    appliedAt = json['applied_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['applied'] = this.applied;
    data['applied_at'] = this.appliedAt;
    return data;
  }
}

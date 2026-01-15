
class AllReportsIssuesModel {
  String? status;
  String? message;
  Data? data;

  AllReportsIssuesModel({this.status, this.message, this.data});

  AllReportsIssuesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? currentPage;
  List<Data1>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    links = json["links"] == null ? null : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["first_page_url"] = firstPageUrl;
    _data["from"] = from;
    _data["last_page"] = lastPage;
    _data["last_page_url"] = lastPageUrl;
    if(links != null) {
      _data["links"] = links?.map((e) => e.toJson()).toList();
    }
    _data["next_page_url"] = nextPageUrl;
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["prev_page_url"] = prevPageUrl;
    _data["to"] = to;
    _data["total"] = total;
    return _data;
  }
}

class Links {
  dynamic url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    label = json["label"];
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["label"] = label;
    _data["active"] = active;
    return _data;
  }
}

class Data1 {
  int? id;
  dynamic userId;
  String? type;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? priority;
  String? status;
  String? category;
  dynamic attachments;
  String? contactEmail;
  String? contactPhone;
  dynamic resolvedAt;
  dynamic resolvedBy;
  dynamic resolutionNoteAr;
  dynamic resolutionNoteEn;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic user;

  Data1({this.id, this.userId, this.type, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.priority, this.status, this.category, this.attachments, this.contactEmail, this.contactPhone, this.resolvedAt, this.resolvedBy, this.resolutionNoteAr, this.resolutionNoteEn, this.isActive, this.createdAt, this.updatedAt, this.user});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    type = json["type"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    priority = json["priority"];
    status = json["status"];
    category = json["category"];
    attachments = json["attachments"];
    contactEmail = json["contact_email"];
    contactPhone = json["contact_phone"];
    resolvedAt = json["resolved_at"];
    resolvedBy = json["resolved_by"];
    resolutionNoteAr = json["resolution_note_ar"];
    resolutionNoteEn = json["resolution_note_en"];
    isActive = json["is_active"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    user = json["user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["type"] = type;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["priority"] = priority;
    _data["status"] = status;
    _data["category"] = category;
    _data["attachments"] = attachments;
    _data["contact_email"] = contactEmail;
    _data["contact_phone"] = contactPhone;
    _data["resolved_at"] = resolvedAt;
    _data["resolved_by"] = resolvedBy;
    _data["resolution_note_ar"] = resolutionNoteAr;
    _data["resolution_note_en"] = resolutionNoteEn;
    _data["is_active"] = isActive;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["user"] = user;
    return _data;
  }
}
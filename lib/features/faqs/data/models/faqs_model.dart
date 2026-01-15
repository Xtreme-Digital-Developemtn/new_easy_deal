
class FaqsModel {
  String? status;
  String? message;
  List<Data>? data;

  FaqsModel({this.status, this.message, this.data});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  Question? question;
  Answer? answer;
  String? category;
  int? sortOrder;
  String? updatedAt;

  Data({this.id, this.question, this.answer, this.category, this.sortOrder, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    question = json["question"] == null ? null : Question.fromJson(json["question"]);
    answer = json["answer"] == null ? null : Answer.fromJson(json["answer"]);
    category = json["category"];
    sortOrder = json["sort_order"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(question != null) {
      _data["question"] = question?.toJson();
    }
    if(answer != null) {
      _data["answer"] = answer?.toJson();
    }
    _data["category"] = category;
    _data["sort_order"] = sortOrder;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Answer {
  String? ar;
  String? en;

  Answer({this.ar, this.en});

  Answer.fromJson(Map<String, dynamic> json) {
    ar = json["ar"];
    en = json["en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ar"] = ar;
    _data["en"] = en;
    return _data;
  }
}

class Question {
  String? ar;
  String? en;

  Question({this.ar, this.en});

  Question.fromJson(Map<String, dynamic> json) {
    ar = json["ar"];
    en = json["en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ar"] = ar;
    _data["en"] = en;
    return _data;
  }
}
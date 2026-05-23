class BrokerModel {
  final int id;
  final String name;
  final String type;
  final String imageUrl;
  bool selected;

  BrokerModel({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    this.selected = false,
  });

  factory BrokerModel.fromJson(Map<String, dynamic> json) {
    return BrokerModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? json['full_name'] ?? '',
      type: json['account_type'] ?? json['type'] ?? '',
      imageUrl: json['image'] ?? json['image_url'] ?? json['logo'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BrokerModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
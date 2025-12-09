class ItemModel {
  final String id;
  final String name;
  final String type;
  final String imageUrl;

  ItemModel({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ItemModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
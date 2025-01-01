import 'dart:typed_data';

class ScannerEntity {
  int id;
  DateTime createdTime;
  int type;
  Uint8List image;
  String content;

  ScannerEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.image,
    required this.content,
  });

  factory ScannerEntity.fromJson(Map<String, dynamic> json) {
    return ScannerEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      image: json['image'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'image': image,
      'content': content,
    };
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String postSenderUid;
  final String festivalName;
  final String image;
  final String description;
  final String countryName;
  PostModel({
    required this.postSenderUid,
    required this.festivalName,
    required this.image,
    required this.description,
    required this.countryName,
  });

  PostModel copyWith({
    String? postSenderUid,
    String? festivalName,
    String? image,
    String? description,
    String? countryName,
  }) {
    return PostModel(
      postSenderUid: postSenderUid ?? this.postSenderUid,
      festivalName: festivalName ?? this.festivalName,
      image: image ?? this.image,
      description: description ?? this.description,
      countryName: countryName ?? this.countryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postSenderUid': postSenderUid,
      'festivalName': festivalName,
      'image': image,
      'description': description,
      'countryName': countryName,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postSenderUid: map['postSenderUid'] as String,
      festivalName: map['festivalName'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      countryName: map['countryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(postSenderUid: $postSenderUid, festivalName: $festivalName, image: $image, description: $description, countryName: $countryName)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.postSenderUid == postSenderUid &&
      other.festivalName == festivalName &&
      other.image == image &&
      other.description == description &&
      other.countryName == countryName;
  }

  @override
  int get hashCode {
    return postSenderUid.hashCode ^
      festivalName.hashCode ^
      image.hashCode ^
      description.hashCode ^
      countryName.hashCode;
  }
}

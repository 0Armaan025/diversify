// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FestivalPost {
  final String festivalName;
  final String startTiming;
  final String isGoingOn;
  final String posterUid;
  final String image;
  final String exploreLink;
  FestivalPost({
    required this.festivalName,
    required this.startTiming,
    required this.isGoingOn,
    required this.posterUid,
    required this.image,
    required this.exploreLink,
  });

  FestivalPost copyWith({
    String? festivalName,
    String? startTiming,
    String? isGoingOn,
    String? posterUid,
    String? image,
    String? exploreLink,
  }) {
    return FestivalPost(
      festivalName: festivalName ?? this.festivalName,
      startTiming: startTiming ?? this.startTiming,
      isGoingOn: isGoingOn ?? this.isGoingOn,
      posterUid: posterUid ?? this.posterUid,
      image: image ?? this.image,
      exploreLink: exploreLink ?? this.exploreLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'festivalName': festivalName,
      'startTiming': startTiming,
      'isGoingOn': isGoingOn,
      'posterUid': posterUid,
      'image': image,
      'exploreLink': exploreLink,
    };
  }

  factory FestivalPost.fromMap(Map<String, dynamic> map) {
    return FestivalPost(
      festivalName: map['festivalName'] as String,
      startTiming: map['startTiming'] as String,
      isGoingOn: map['isGoingOn'] as String,
      posterUid: map['posterUid'] as String,
      image: map['image'] as String,
      exploreLink: map['exploreLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FestivalPost.fromJson(String source) =>
      FestivalPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FestivalPost(festivalName: $festivalName, startTiming: $startTiming, isGoingOn: $isGoingOn, posterUid: $posterUid, image: $image, exploreLink: $exploreLink)';
  }

  @override
  bool operator ==(covariant FestivalPost other) {
    if (identical(this, other)) return true;

    return other.festivalName == festivalName &&
        other.startTiming == startTiming &&
        other.isGoingOn == isGoingOn &&
        other.posterUid == posterUid &&
        other.image == image &&
        other.exploreLink == exploreLink;
  }

  @override
  int get hashCode {
    return festivalName.hashCode ^
        startTiming.hashCode ^
        isGoingOn.hashCode ^
        posterUid.hashCode ^
        image.hashCode ^
        exploreLink.hashCode;
  }
}

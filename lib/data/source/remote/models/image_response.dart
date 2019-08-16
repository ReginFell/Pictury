import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse {
  List<Data> data;

  ImageResponse({this.data});

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);

  @override
  String toString() {
    return 'ImageResponse{data: $data}';
  }
}

@JsonSerializable()
class Data {
  String id;
  String title;
  String description;
  int datetime;
  String cover;
  int coverWidth;
  int coverHeight;
  String accountUrl;
  int accountId;
  String privacy;
  String layout;
  int views;
  String link;
  int ups;
  int downs;
  int points;
  int score;
  bool isAlbum;
  bool favorite;
  bool nsfw;
  String section;
  int commentCount;
  int favoriteCount;
  String topic;
  int topicId;
  int imagesCount;
  bool inGallery;
  bool isAd;
  int adType;
  String adUrl;
  bool inMostViral;
  bool includeAlbumAds;
  List<Images> images;

  Data(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.cover,
      this.coverWidth,
      this.coverHeight,
      this.accountUrl,
      this.accountId,
      this.privacy,
      this.layout,
      this.views,
      this.link,
      this.ups,
      this.downs,
      this.points,
      this.score,
      this.isAlbum,
      this.favorite,
      this.nsfw,
      this.section,
      this.commentCount,
      this.favoriteCount,
      this.topic,
      this.topicId,
      this.imagesCount,
      this.inGallery,
      this.isAd,
      this.adType,
      this.adUrl,
      this.inMostViral,
      this.includeAlbumAds,
      this.images});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Images {
  String id;
  String title;
  String description;
  int datetime;
  String type;
  bool animated;
  int width;
  int height;
  int size;
  int views;
  int bandwidth;
  bool favorite;
  bool isAd;
  bool inMostViral;
  bool hasSound;
  int adType;
  String adUrl;
  String edited;
  bool inGallery;
  String link;
  int mp4Size;
  String mp4;
  String gifv;
  String hls;

  Images({
    this.id,
    this.title,
    this.description,
    this.datetime,
    this.type,
    this.animated,
    this.width,
    this.height,
    this.size,
    this.views,
    this.bandwidth,
    this.favorite,
    this.isAd,
    this.inMostViral,
    this.hasSound,
    this.adType,
    this.adUrl,
    this.edited,
    this.inGallery,
    this.link,
    this.mp4Size,
    this.mp4,
    this.gifv,
    this.hls,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

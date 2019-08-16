// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) {
  return ImageResponse(
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      datetime: json['datetime'] as int,
      cover: json['cover'] as String,
      coverWidth: json['coverWidth'] as int,
      coverHeight: json['coverHeight'] as int,
      accountUrl: json['accountUrl'] as String,
      accountId: json['accountId'] as int,
      privacy: json['privacy'] as String,
      layout: json['layout'] as String,
      views: json['views'] as int,
      link: json['link'] as String,
      ups: json['ups'] as int,
      downs: json['downs'] as int,
      points: json['points'] as int,
      score: json['score'] as int,
      isAlbum: json['isAlbum'] as bool,
      favorite: json['favorite'] as bool,
      nsfw: json['nsfw'] as bool,
      section: json['section'] as String,
      commentCount: json['commentCount'] as int,
      favoriteCount: json['favoriteCount'] as int,
      topic: json['topic'] as String,
      topicId: json['topicId'] as int,
      imagesCount: json['imagesCount'] as int,
      inGallery: json['inGallery'] as bool,
      isAd: json['isAd'] as bool,
      adType: json['adType'] as int,
      adUrl: json['adUrl'] as String,
      inMostViral: json['inMostViral'] as bool,
      includeAlbumAds: json['includeAlbumAds'] as bool,
      images: (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Images.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': instance.datetime,
      'cover': instance.cover,
      'coverWidth': instance.coverWidth,
      'coverHeight': instance.coverHeight,
      'accountUrl': instance.accountUrl,
      'accountId': instance.accountId,
      'privacy': instance.privacy,
      'layout': instance.layout,
      'views': instance.views,
      'link': instance.link,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'score': instance.score,
      'isAlbum': instance.isAlbum,
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'section': instance.section,
      'commentCount': instance.commentCount,
      'favoriteCount': instance.favoriteCount,
      'topic': instance.topic,
      'topicId': instance.topicId,
      'imagesCount': instance.imagesCount,
      'inGallery': instance.inGallery,
      'isAd': instance.isAd,
      'adType': instance.adType,
      'adUrl': instance.adUrl,
      'inMostViral': instance.inMostViral,
      'includeAlbumAds': instance.includeAlbumAds,
      'images': instance.images
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      datetime: json['datetime'] as int,
      type: json['type'] as String,
      animated: json['animated'] as bool,
      width: json['width'] as int,
      height: json['height'] as int,
      size: json['size'] as int,
      views: json['views'] as int,
      bandwidth: json['bandwidth'] as int,
      favorite: json['favorite'] as bool,
      isAd: json['isAd'] as bool,
      inMostViral: json['inMostViral'] as bool,
      hasSound: json['hasSound'] as bool,
      adType: json['adType'] as int,
      adUrl: json['adUrl'] as String,
      edited: json['edited'] as String,
      inGallery: json['inGallery'] as bool,
      link: json['link'] as String,
      mp4Size: json['mp4Size'] as int,
      mp4: json['mp4'] as String,
      gifv: json['gifv'] as String,
      hls: json['hls'] as String);
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': instance.datetime,
      'type': instance.type,
      'animated': instance.animated,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'views': instance.views,
      'bandwidth': instance.bandwidth,
      'favorite': instance.favorite,
      'isAd': instance.isAd,
      'inMostViral': instance.inMostViral,
      'hasSound': instance.hasSound,
      'adType': instance.adType,
      'adUrl': instance.adUrl,
      'edited': instance.edited,
      'inGallery': instance.inGallery,
      'link': instance.link,
      'mp4Size': instance.mp4Size,
      'mp4': instance.mp4,
      'gifv': instance.gifv,
      'hls': instance.hls
    };

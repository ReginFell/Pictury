// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) {
  return ImageResponse(
      id: json['id'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      description: json['description'],
      altDescription: json['altDescription'] as String,
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      categories: json['categories'] as List,
      likes: json['likes'] as int,
      likedByUser: json['likedByUser'] as bool,
      currentUserCollections: json['currentUserCollections'] as List,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'description': instance.description,
      'altDescription': instance.altDescription,
      'urls': instance.urls,
      'categories': instance.categories,
      'likes': instance.likes,
      'likedByUser': instance.likedByUser,
      'currentUserCollections': instance.currentUserCollections,
      'user': instance.user
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
      self: json['self'] as String,
      html: json['html'] as String,
      download: json['download'] as String,
      downloadLocation: json['downloadLocation'] as String);
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'downloadLocation': instance.downloadLocation
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as String,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      username: json['username'] as String,
      name: json['name'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      twitterUsername: json['twitterUsername'] as String,
      portfolioUrl: json['portfolioUrl'] as String,
      bio: json['bio'] as String,
      location: json['location'],
      links: json['links'] == null
          ? null
          : UserLinks.fromJson(json['links'] as Map<String, dynamic>),
      profileImage: json['profileImage'] == null
          ? null
          : ProfileImage.fromJson(json['profileImage'] as Map<String, dynamic>),
      instagramUsername: json['instagramUsername'] as String,
      totalCollections: json['totalCollections'] as int,
      totalLikes: json['totalLikes'] as int,
      totalPhotos: json['totalPhotos'] as int,
      acceptedTos: json['acceptedTos'] as bool);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'username': instance.username,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'twitterUsername': instance.twitterUsername,
      'portfolioUrl': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links,
      'profileImage': instance.profileImage,
      'instagramUsername': instance.instagramUsername,
      'totalCollections': instance.totalCollections,
      'totalLikes': instance.totalLikes,
      'totalPhotos': instance.totalPhotos,
      'acceptedTos': instance.acceptedTos
    };

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) {
  return UserLinks(
      self: json['self'] as String,
      html: json['html'] as String,
      photos: json['photos'] as String,
      likes: json['likes'] as String,
      portfolio: json['portfolio'] as String,
      following: json['following'] as String,
      followers: json['followers'] as String);
}

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
      'following': instance.following,
      'followers': instance.followers
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) {
  return ProfileImage(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String);
}

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) {
  return Urls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String);
}

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowModel _$FollowModelFromJson(Map<String, dynamic> json) {
  return FollowModel()
    ..id = json['id'] as int
    ..follower = json['follower'] as int
    ..following = json['following'] as String
    ..updatedAt = json['updated_at'] as String
    ..createdAt = json['created_at'] as String
    ..apiKey = json['ApiKey'] as String
    ..apiToken = json['ApiToken'] as String
    ..userId = json['user_id'] as int;
}

Map<String, dynamic> _$FollowModelToJson(FollowModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('follower', instance.follower);
  writeNotNull('following', instance.following);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('ApiKey', instance.apiKey);
  writeNotNull('ApiToken', instance.apiToken);
  writeNotNull('user_id', instance.userId);
  return val;
}

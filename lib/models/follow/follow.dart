import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'follow.g.dart';


@JsonSerializable(includeIfNull: false)
class FollowModel {
  int id;
  int follower;
  String following;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'ApiKey')
  String apiKey;
  @JsonKey(name: 'ApiToken')
  String apiToken;
  @JsonKey(name: 'user_id')
  int userId;

  FollowModel.fetch({this.apiKey,this.apiToken,this.userId});




  FollowModel();


  factory FollowModel.fromJson(Map<String, dynamic> json) => _$FollowModelFromJson(json);

  Map<String, dynamic> toJson() => _$FollowModelToJson(this);
}

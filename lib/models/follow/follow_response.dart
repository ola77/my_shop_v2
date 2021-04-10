import 'package:json_annotation/json_annotation.dart';

import 'follow.dart';

part 'follow_response.g.dart';


@JsonSerializable()
class FollowResponse {
  bool status;
  String message;
  FollowModel data;

  FollowResponse();


  factory FollowResponse.fromJson(Map<String, dynamic> json) => _$FollowResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FollowResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:try_retrofit/model/data.dart';
import 'package:try_retrofit/model/support.dart';

part 'user_responses.g.dart';

@JsonSerializable()
class UserResponses {
  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  int total;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Data> data;
  Support support;

  UserResponses({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserResponses.fromJson(Map<String, dynamic> json) => _$UserResponsesFromJson(json);
}

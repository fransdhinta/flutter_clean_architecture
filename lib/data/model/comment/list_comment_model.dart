import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/model/post/list_post_model.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';

class ListCommentModel extends Equatable {
  ListCommentModel({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  });
  late final String id;
  late final String message;
  late final OwnerModel owner;
  late final String post;
  late final String publishDate;

  ListCommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    owner = OwnerModel.fromJson(json['owner']);
    post = json['post'];
    publishDate = json['publishDate'];
  }

  ListCommentEntity toEntity() => ListCommentEntity(
      id: id,
      message: message,
      owner: owner,
      post: post,
      publishDate: publishDate);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        message,
        owner,
        post,
        publishDate,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/model/comment/list_comment_model.dart';
import 'package:flutter_clean_architecture/data/model/post/list_post_model.dart';

class ListCommentEntity extends Equatable {
  ListCommentEntity({
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

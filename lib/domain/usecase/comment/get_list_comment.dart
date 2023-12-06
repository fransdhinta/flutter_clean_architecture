import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class GetListComment {
  final RepositoriesDomain repositoriesDomain;

  GetListComment(this.repositoriesDomain);

  Future<Either<String, List<ListCommentEntity>>> fetchCommentList() {
    return repositoriesDomain.getListComment();
  }
}

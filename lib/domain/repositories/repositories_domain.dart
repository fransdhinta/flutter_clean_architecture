import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/create_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/detail_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';

abstract class RepositoriesDomain {
  Future<Either<String, List<ListUserEntity>>> getListUser();
  Future<Either<String, List<ListPostEntity>>> getListPost();
  Future<Either<String, List<ListCommentEntity>>> getListComment();

  Future<Either<String, CreateUserEntity>> getCreateUser(
      InputCreateUserModel icum);
  Future<Either<String, DetailUserEntity>> getDetailUser(String idUser);
}

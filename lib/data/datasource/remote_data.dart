import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/data/model/comment/list_comment_model.dart';
import 'package:flutter_clean_architecture/data/model/post/list_post_model.dart';
import 'package:flutter_clean_architecture/data/model/user/create_user_model.dart';
import 'package:flutter_clean_architecture/data/model/user/detail_user_model.dart';
import 'package:flutter_clean_architecture/data/model/user/list_user_model.dart';

abstract class RemoteData {
  Future<List<ListUserModel>> listUserModel();
  Future<List<ListPostModel>> listPostModel();
  Future<List<ListCommentModel>> listCommentModel();
  Future<DetailUserModel> detailUserModel(String idUser);
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum);
}

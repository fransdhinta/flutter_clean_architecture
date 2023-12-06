import 'dart:convert';

import 'package:flutter_clean_architecture/common/constant.dart';
import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/data/datasource/remote_data.dart';
import 'package:flutter_clean_architecture/data/model/comment/list_comment_model.dart';
import 'package:flutter_clean_architecture/data/model/post/list_post_model.dart';
import 'package:flutter_clean_architecture/data/model/user/create_user_model.dart';
import 'package:flutter_clean_architecture/data/model/user/detail_user_model.dart';
import 'package:flutter_clean_architecture/data/model/user/list_user_model.dart';

import 'package:http/http.dart' as http;

class RemoteDataImpl implements RemoteData {
  final http.Client client;

  RemoteDataImpl(this.client);

  @override
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum) async {
    final request = await http.post(Uri.parse('${Constant.baseUrl}user/create'),
        headers: {
          "app-id": Constant.appId
        },
        body: {
          "firstName": icum.firstName,
          "lastName": icum.lastName,
          "email": icum.email
        });

    final response = jsonDecode(request.body);
    print("Log Create User: $response");
    return CreateUserModel.fromJson(response);
  }

  @override
  Future<DetailUserModel> detailUserModel(String idUser) async {
    final request = await http.get(
        Uri.parse('${Constant.baseUrl}user/${idUser}'),
        headers: {"app-id": Constant.appId});

    final response = jsonDecode(request.body);

    return DetailUserModel.fromJson(response);
  }

  @override
  Future<List<ListCommentModel>> listCommentModel() async {
    final request = await http.get(
        Uri.parse('${Constant.baseUrl}comment?page=1&limit=10'),
        headers: {"app-id": Constant.appId});

    final response = jsonDecode(request.body);

    final List data = response["data"];

    return data.map((value) => ListCommentModel.fromJson(value)).toList();
  }

  @override
  Future<List<ListPostModel>> listPostModel() async {
    final request = await http.get(
        Uri.parse('${Constant.baseUrl}post?page=0&limit=10'),
        headers: {"app-id": Constant.appId});

    final response = jsonDecode(request.body);

    final List data = response["data"];

    return data.map((value) => ListPostModel.fromJson(value)).toList();
  }

  @override
  Future<List<ListUserModel>> listUserModel() async {
    final request = await http.get(
        Uri.parse('${Constant.baseUrl}user?page=1&limit=10'),
        headers: {"app-id": Constant.appId});

    final response = jsonDecode(request.body);

    final List data = response["data"];

    return data.map((value) => ListUserModel.fromJson(value)).toList();
  }
}

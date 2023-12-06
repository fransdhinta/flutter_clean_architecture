import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/create_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/detail_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class RepositoryDomainImpl implements RepositoriesDomain {
  final RemoteDataImpl remoteDataImpl;

  RepositoryDomainImpl(this.remoteDataImpl);

  @override
  Future<Either<String, CreateUserEntity>> getCreateUser(
      InputCreateUserModel icum) async {
    try {
      final result = await remoteDataImpl.createUserModel(icum);

      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, DetailUserEntity>> getDetailUser(String idUser) async {
    try {
      final result = await remoteDataImpl.detailUserModel(idUser);

      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListCommentEntity>>> getListComment() async {
    try {
      final result = await remoteDataImpl.listCommentModel();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListPostEntity>>> getListPost() async {
    try {
      final result = await remoteDataImpl.listPostModel();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      print(stackTrace);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListUserEntity>>> getListUser() async {
    try {
      final result = await remoteDataImpl.listUserModel();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}

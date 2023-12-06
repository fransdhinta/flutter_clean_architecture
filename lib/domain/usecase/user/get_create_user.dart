import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/domain/intities/user/create_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class GetCreateUser {
  final RepositoriesDomain repositoriesDomain;

  GetCreateUser(this.repositoriesDomain);

  Future<Either<String, CreateUserEntity>> fetchCreateUser(
      InputCreateUserModel icum) {
    return repositoriesDomain.getCreateUser(icum);
  }
}

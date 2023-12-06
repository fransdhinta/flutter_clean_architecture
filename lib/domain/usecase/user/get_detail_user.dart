import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/intities/user/create_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/detail_user_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class GetDetailUser {
  final RepositoriesDomain repositoriesDomain;

  GetDetailUser(this.repositoriesDomain);

  Future<Either<String, DetailUserEntity>> fetchDetailUser(String idUser) {
    return repositoriesDomain.getDetailUser(idUser);
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class GetListUser {
  final RepositoriesDomain repositoriesDomain;

  GetListUser(this.repositoriesDomain);

  Future<Either<String, List<ListUserEntity>>> fetchUserList() {
    return repositoriesDomain.getListUser();
  }
}

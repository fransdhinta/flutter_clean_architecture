import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';

class GetListPost {
  final RepositoriesDomain repositoriesDomain;

  GetListPost(this.repositoriesDomain);

  Future<Either<String, List<ListPostEntity>>> fetchPostList() {
    return repositoriesDomain.getListPost();
  }
}

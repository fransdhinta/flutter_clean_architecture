import 'package:flutter_clean_architecture/data/datasource/remote_data.dart';
import 'package:flutter_clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:flutter_clean_architecture/data/repositories/repository_domain_impl.dart';
import 'package:flutter_clean_architecture/domain/repositories/repositories_domain.dart';
import 'package:flutter_clean_architecture/domain/usecase/comment/get_list_comment.dart';
import 'package:flutter_clean_architecture/domain/usecase/post/get_list_post.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_create_user.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_detail_user.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_list_user.dart';
import 'package:flutter_clean_architecture/presentation/cubit/comment/list_comment/list_comment_cubit.dart';
import 'package:flutter_clean_architecture/presentation/cubit/post/list_post/list_post_cubit.dart';
import 'package:flutter_clean_architecture/presentation/cubit/user/create_user/create_user_cubit.dart';
import 'package:flutter_clean_architecture/presentation/cubit/user/detail_user/detail_user_cubit.dart';
import 'package:flutter_clean_architecture/presentation/cubit/user/list_user/list_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

void initialize() {
  //use-case
  locator.registerFactory(() => GetCreateUser(locator()));
  locator.registerFactory(() => GetDetailUser(locator()));
  locator.registerFactory(() => GetListComment(locator()));
  locator.registerFactory(() => GetListPost(locator()));
  locator.registerFactory(() => GetListUser(locator()));

  //state-management-cubit
  locator.registerFactory(() => ListUserCubit(locator()));
  locator.registerFactory(() => ListPostCubit(locator()));
  locator.registerFactory(() => ListCommentCubit(locator()));
  locator.registerFactory(() => DetailUserCubit(locator()));
  locator.registerFactory(() => CreateUserCubit(locator()));

  //repository-domain-impl
  locator.registerFactory<RepositoriesDomain>(
      () => RepositoryDomainImpl(locator()));

  //repository-remote-data
  locator.registerFactory(() => RemoteDataImpl(locator()));

  //external
  locator.registerFactory(() => Client());
}

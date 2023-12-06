import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/domain/usecase/post/get_list_post.dart';

part 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit(this.getListPost) : super(ListPostInitial());

  final GetListPost getListPost;

  getPostList() async {
    final result = await getListPost.fetchPostList();

    result.fold((l) {
      emit(ListPostError(l.toString()));
    }, (r) {
      emit(ListPostLoaded(r, "Posts data fetched successfully"));
    });
  }
}

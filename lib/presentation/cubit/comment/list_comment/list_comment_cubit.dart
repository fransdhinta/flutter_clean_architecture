import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';
import 'package:flutter_clean_architecture/domain/usecase/comment/get_list_comment.dart';

part 'list_comment_state.dart';

class ListCommentCubit extends Cubit<ListCommentState> {
  ListCommentCubit(this.getListComment) : super(ListCommentInitial());

  final GetListComment getListComment;

  getCommentList(BuildContext context) async {
    final result = await getListComment.fetchCommentList();

    result.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Comments data fetch error")));
      emit(ListCommentError(l.toString()));
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Comments data fetched successfully")));
      emit(ListCommentLoaded(r, "Comments data fetched successfully"));
    });
  }
}

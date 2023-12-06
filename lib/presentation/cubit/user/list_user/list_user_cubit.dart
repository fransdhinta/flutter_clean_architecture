import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_list_user.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit(this.getListUser) : super(ListUserInitial());

  final GetListUser getListUser;

  getUserList() async {
    final result = await getListUser.fetchUserList();

    result.fold((l) {
      emit(ListUserError(l.toString()));
    }, (r) {
      emit(ListUserLoaded(r, "Users data fetched successfully"));
    });
  }
}

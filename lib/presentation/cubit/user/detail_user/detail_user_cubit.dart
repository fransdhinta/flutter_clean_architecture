import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/domain/intities/user/detail_user_entity.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_detail_user.dart';

part 'detail_user_state.dart';

class DetailUserCubit extends Cubit<DetailUserState> {
  DetailUserCubit(this.getDetailUser) : super(DetailUserInitial());

  final GetDetailUser getDetailUser;

  getUserDetail(String idUser) async {
    final result = await getDetailUser.fetchDetailUser(idUser);

    result.fold((l) {
      emit(DetailUserError(l.toString()));
    }, (r) {
      emit(DetailUserLoaded(r, "Detail User's data fetched successfully"));
    });
  }
}

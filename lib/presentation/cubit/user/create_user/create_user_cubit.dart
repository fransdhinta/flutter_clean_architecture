import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/common/enum_status.dart';
import 'package:flutter_clean_architecture/common/input_create_user_model.dart';
import 'package:flutter_clean_architecture/domain/intities/user/create_user_entity.dart';
import 'package:flutter_clean_architecture/domain/usecase/user/get_create_user.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.getCreateUser) : super(CreateUserInitial());

  final GetCreateUser getCreateUser;
  static final firstName = TextEditingController();
  static final lastName = TextEditingController();
  static final email = TextEditingController();

  init() {
    emit(CreateUserLoaded(null, "Initial load", EnumStatus.empty));
  }

  getUserCreate(BuildContext context) async {
    emit(CreateUserLoaded(null, "Loading...", EnumStatus.loading));
    final input = InputCreateUserModel(
        firstName: firstName.text, lastName: lastName.text, email: email.text);
    final result = await getCreateUser.fetchCreateUser(input);

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Create User's data fetch error")));
      emit(CreateUserError(l.toString(), EnumStatus.error));
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Create User's data fetched successfully")));
      emit(CreateUserLoaded(
          r, "Create User's data fetched successfully", EnumStatus.loaded));
    });
  }
}

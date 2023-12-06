import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/common/enum_status.dart';
import 'package:flutter_clean_architecture/common/routers.dart';
import 'package:flutter_clean_architecture/presentation/cubit/user/create_user/create_user_cubit.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonError.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonLoading.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CreateUserCubit, CreateUserState>(
        builder: (context, state) {
          if (state is CreateUserLoaded) {
            print("Current State is: ${state.enumStatus}");
            print("State Message: ${state.message}");
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffc4c4c4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CreateUserCubit.firstName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "First Name",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffc4c4c4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CreateUserCubit.lastName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Last Name",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffc4c4c4),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CreateUserCubit.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (state.enumStatus != EnumStatus.loading) {
                        context.read<CreateUserCubit>().getUserCreate(context);
                      }
                    },
                    child: state.enumStatus == EnumStatus.loading
                        ? CircularProgressIndicator()
                        : Text("Create User")),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.listPost);
                    },
                    child: Text("Lihat Post")),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.listComment);
                    },
                    child: Text("Lihat Comment")),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.listUser);
                    },
                    child: Text("Lihat User")),
              ],
            );
          } else if (state is CreateUserError) {
            return CommonError();
          }
          return CommonLoading();
        },
      ),
    );
  }
}

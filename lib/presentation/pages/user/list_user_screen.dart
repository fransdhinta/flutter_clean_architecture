import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/common/routers.dart';
import 'package:flutter_clean_architecture/domain/intities/user/list_user_entity.dart';
import 'package:flutter_clean_architecture/injection.dart' as git;
import 'package:flutter_clean_architecture/presentation/cubit/user/list_user/list_user_cubit.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonError.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonLoading.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Post"),
        ),
        body: BlocProvider(
          create: (context) => git.locator<ListUserCubit>()..getUserList(),
          child: BlocBuilder<ListUserCubit, ListUserState>(
            builder: (context, state) {
              if (state is ListUserLoaded) {
                return ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListUserEntity data = state.list[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routers.detailUser,
                              arguments: {"id": data.id});
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image.network(
                                data.picture,
                                width: 100,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${data.title}'),
                                    Text('${data.firstName} ${data.lastName}')
                                  ]),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (state is ListUserError) {
                return CommonError();
              }
              return CommonLoading();
            },
          ),
        ));
  }
}

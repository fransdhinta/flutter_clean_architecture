import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/intities/user/detail_user_entity.dart';
import 'package:flutter_clean_architecture/presentation/cubit/user/detail_user/detail_user_cubit.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonError.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonLoading.dart';
import 'package:flutter_clean_architecture/injection.dart' as git;

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID: $id"),
      ),
      body: BlocProvider(
        create: (context) => git.locator<DetailUserCubit>()..getUserDetail(id),
        child: BlocBuilder<DetailUserCubit, DetailUserState>(
          builder: (context, state) {
            if (state is DetailUserLoaded) {
              DetailUserEntity data = state.detailUserEntity;

              return Container(
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
                    Expanded(child: Text('${data.firstName} ${data.lastName}')),
                  ],
                ),
              );
            } else if (state is DetailUserError) {
              return CommonError();
            }
            return CommonLoading();
          },
        ),
      ),
    );
  }
}

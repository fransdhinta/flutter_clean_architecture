import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/intities/comment/list_comment_entity.dart';
import 'package:flutter_clean_architecture/injection.dart' as git;
import 'package:flutter_clean_architecture/presentation/cubit/comment/list_comment/list_comment_cubit.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonError.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonLoading.dart';

class ListCommentScreen extends StatelessWidget {
  const ListCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Post"),
      ),
      body: BlocProvider(
        create: (context) =>
            git.locator<ListCommentCubit>()..getCommentList(context),
        child: BlocBuilder<ListCommentCubit, ListCommentState>(
          builder: (context, state) {
            if (state is ListCommentLoaded) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    ListCommentEntity data = state.list[index];

                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${data.owner.firstName} ${data.owner.lastName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(child: Text('${data.publishDate}')),
                            ],
                          ),
                          Text('${data.message}')
                        ],
                      ),
                    );
                  });
            } else if (state is ListCommentLoaded) {
              return CommonError();
            }
            return CommonLoading();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';
import 'package:flutter_clean_architecture/presentation/cubit/post/list_post/list_post_cubit.dart';
import 'package:flutter_clean_architecture/injection.dart' as git;
import 'package:flutter_clean_architecture/presentation/widget/CommonError.dart';
import 'package:flutter_clean_architecture/presentation/widget/CommonLoading.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Post"),
        ),
        body: BlocProvider(
          create: (context) => git.locator<ListPostCubit>()..getPostList(),
          child: BlocBuilder<ListPostCubit, ListPostState>(
            builder: (context, state) {
              if (state is ListPostLoaded) {
                return ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListPostEntity data = state.list[index];

                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.network(
                              data.image,
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: Text('${data.text}')),
                          ],
                        ),
                      );
                    });
              } else if (state is ListPostError) {
                return CommonError();
              }
              return CommonLoading();
            },
          ),
        ));
  }
}

part of 'list_comment_cubit.dart';

@immutable
abstract class ListCommentState {}

// sealed class ListCommentState extends Equatable {
//   const ListCommentState();

//   @override
//   List<Object> get props => [];
// }

class ListCommentInitial extends ListCommentState {}

class ListCommentLoaded extends ListCommentState {
  final List<ListCommentEntity> list;
  final String message;

  ListCommentLoaded(this.list, this.message);
}

class ListCommentError extends ListCommentState {
  final String message;

  ListCommentError(this.message);
}

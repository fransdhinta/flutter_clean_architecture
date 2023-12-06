part of 'list_post_cubit.dart';

@immutable
abstract class ListPostState {}

// sealed class ListPostState extends Equatable {
//   const ListPostState();

//   @override
//   List<Object> get props => [];
// }

class ListPostInitial extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<ListPostEntity> list;
  final String message;

  ListPostLoaded(this.list, this.message);
}

class ListPostError extends ListPostState {
  final String message;

  ListPostError(this.message);
}

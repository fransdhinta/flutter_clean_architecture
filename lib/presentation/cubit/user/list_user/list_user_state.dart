part of 'list_user_cubit.dart';

@immutable
abstract class ListUserState {}

// sealed class ListUserState extends Equatable {
//   const ListUserState();

//   @override
//   List<Object> get props => [];
// }

class ListUserInitial extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<ListUserEntity> list;
  final String message;

  ListUserLoaded(this.list, this.message);
}

class ListUserError extends ListUserState {
  final String message;

  ListUserError(this.message);
}

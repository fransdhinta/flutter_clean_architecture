part of 'detail_user_cubit.dart';

@immutable
abstract class DetailUserState {}

// sealed class DetailUserState extends Equatable {
//   const DetailUserState();

//   @override
//   List<Object> get props => [];
// }

class DetailUserInitial extends DetailUserState {}

class DetailUserLoaded extends DetailUserState {
  final DetailUserEntity detailUserEntity;
  final String message;

  DetailUserLoaded(this.detailUserEntity, this.message);
}

class DetailUserError extends DetailUserState {
  final String message;

  DetailUserError(this.message);
}

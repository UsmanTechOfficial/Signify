part of 'req_sign_user_detail_bloc.dart';

sealed class ReqSignUserDetailEvent extends Equatable {
  const ReqSignUserDetailEvent();

  @override
  List<Object> get props => [];
}

class AddNewSingedUserEvent extends ReqSignUserDetailEvent {
  final DocumentUserModel signedUser;

  const AddNewSingedUserEvent(this.signedUser);

  @override
  List<Object> get props => [signedUser];
}

class UserOrderEvent extends ReqSignUserDetailEvent {
  final bool setOrder;

  const UserOrderEvent(this.setOrder);

  @override
  List<Object> get props => [setOrder];
}

class RemoveUserEvent extends ReqSignUserDetailEvent {
  final int index;

  const RemoveUserEvent(this.index);

  @override
  List<Object> get props => [index];
}

class NextNavigateEvent extends ReqSignUserDetailEvent {
  const NextNavigateEvent();
}

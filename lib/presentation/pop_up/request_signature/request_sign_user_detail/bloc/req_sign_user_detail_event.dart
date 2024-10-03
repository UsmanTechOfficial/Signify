part of 'req_sign_user_detail_bloc.dart';

sealed class ReqSignUserDetailEvent extends Equatable {
  const ReqSignUserDetailEvent();

  @override
  List<Object> get props => [];
}

class UserOrderEvent extends ReqSignUserDetailEvent {
  final bool setOrder;

  const UserOrderEvent(this.setOrder);

  @override
  List<Object> get props => [setOrder];
}

class AddNewSingerEvent extends ReqSignUserDetailEvent {
  final DocumentUserModel signedUser;

  const AddNewSingerEvent(this.signedUser);

  @override
  List<Object> get props => [signedUser];
}

class AddNewViewerEvent extends ReqSignUserDetailEvent {
  final RecipientModel viewer;

  const AddNewViewerEvent(this.viewer);

  @override
  List<Object> get props => [viewer];
}

class RemoveViewerEvent extends ReqSignUserDetailEvent {
  final int index;

  const RemoveViewerEvent(this.index);

  @override
  List<Object> get props => [index];
}

class RemoveSignerEvent extends ReqSignUserDetailEvent {
  final int index;

  const RemoveSignerEvent(this.index);

  @override
  List<Object> get props => [index];
}

class NextNavigateEvent extends ReqSignUserDetailEvent {
  const NextNavigateEvent();
}

part of 'req_sign_user_detail_bloc.dart';

sealed class ReqSignUserDetailState extends Equatable {
  const ReqSignUserDetailState();

  @override
  List<Object> get props => [];
}

final class ReqSignRecipientDetailInitial extends ReqSignUserDetailState {
  const ReqSignRecipientDetailInitial();
}

class UserChangedState extends ReqSignUserDetailState {
  final List<DocumentUserModel> signedUser;
  final bool order;

  const UserChangedState(this.signedUser, this.order);

  @override
  List<Object> get props => [signedUser, order];

  UserChangedState copyWith({
    List<DocumentUserModel>? signedUser,
    bool? order,
  }) {
    return UserChangedState(
      signedUser ?? this.signedUser,
      order ?? this.order,
    );
  }
}

class UserErrorState extends ReqSignUserDetailState {
  final String error;

  const UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}

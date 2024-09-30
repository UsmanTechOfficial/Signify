part of 'req_sign_user_detail_bloc.dart';

sealed class ReqSignUserDetailState extends Equatable {
  const ReqSignUserDetailState();

  @override
  List<Object> get props => [];
}

final class ReqSignRecipientDetailInitial extends ReqSignUserDetailState {
  const ReqSignRecipientDetailInitial();
}

class UserAddedState extends ReqSignUserDetailState {
  final List<DocumentUserModel> signedUser;
  final bool order;

  const UserAddedState(this.signedUser, this.order);

  @override
  List<Object> get props => [signedUser, order];

  UserAddedState copyWith({
    List<DocumentUserModel>? signedUser,
    bool? order,
  }) {
    return UserAddedState(
      signedUser ?? this.signedUser,
      order ?? this.order,
    );
  }
}

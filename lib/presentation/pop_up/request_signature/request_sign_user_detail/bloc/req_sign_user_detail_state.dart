part of 'req_sign_user_detail_bloc.dart';

sealed class ReqSignUserDetailState extends Equatable {
  const ReqSignUserDetailState();

  @override
  List<Object> get props => [];
}

final class ReqSignRecipientDetailInitial extends ReqSignUserDetailState {
  const ReqSignRecipientDetailInitial();
}

class SignerChangedState extends ReqSignUserDetailState {
  final List<DocumentUserModel> signedUser;
  final bool order;

  const SignerChangedState(this.signedUser, this.order);

  @override
  List<Object> get props => [signedUser, order];

  SignerChangedState copyWith({
    List<DocumentUserModel>? signedUser,
    bool? order,
  }) {
    return SignerChangedState(
      signedUser ?? this.signedUser,
      order ?? this.order,
    );
  }
}

class ViewerChangedState extends ReqSignUserDetailState {
  final List<RecipientModel> viewers;

  const ViewerChangedState(this.viewers);

  ViewerChangedState copyWith({List<RecipientModel>? viewers}) {
    return ViewerChangedState(
      viewers ?? this.viewers,
    );
  }

  @override
  List<Object> get props => [viewers];
}

class UserErrorState extends ReqSignUserDetailState {
  final String error;

  const UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}

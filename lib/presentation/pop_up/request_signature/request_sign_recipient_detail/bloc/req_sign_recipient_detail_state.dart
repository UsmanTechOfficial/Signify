part of 'req_sign_recipient_detail_bloc.dart';

sealed class ReqSignRecipientDetailState extends Equatable {
  const ReqSignRecipientDetailState();

  @override
  List<Object> get props => [];
}

final class ReqSignRecipientDetailInitial extends ReqSignRecipientDetailState {
  const ReqSignRecipientDetailInitial();
}

class RecipientAddedState extends ReqSignRecipientDetailState {
  final List<String> recipientList;
  final bool order;

  const RecipientAddedState(this.recipientList, this.order);

  @override
  List<Object> get props => [recipientList, order];

  RecipientAddedState copyWith({
    List<String>? recipientList,
    bool? order,
  }) {
    return RecipientAddedState(
      recipientList ?? this.recipientList,
      order ?? this.order,
    );
  }
}

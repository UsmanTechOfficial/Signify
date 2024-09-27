part of 'req_sign_recipient_detail_bloc.dart';

sealed class ReqSignRecipientDetailEvent extends Equatable {
  const ReqSignRecipientDetailEvent();

  @override
  List<Object> get props => [];
}

class AddNewRecipientEvent extends ReqSignRecipientDetailEvent {
  final List<String> recipients;

  const AddNewRecipientEvent(this.recipients);

  @override
  List<Object> get props => [recipients];
}

class RecipientOrderEvent extends ReqSignRecipientDetailEvent {
  final bool setOrder;

  const RecipientOrderEvent(this.setOrder);

  @override
  List<Object> get props => [setOrder];
}

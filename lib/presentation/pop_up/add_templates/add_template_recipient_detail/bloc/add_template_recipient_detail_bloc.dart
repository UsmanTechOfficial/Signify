import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_template_recipient_detail_event.dart';
part 'add_template_recipient_detail_state.dart';

class AddTemplateRecipientDetailBloc
    extends Bloc<AddTemplateRecipientDetailEvent, AddTemplateRecipientDetailState> {
  AddTemplateRecipientDetailBloc() : super(AddTemplateRecipientDetailInitial()) {
    on<AddTemplateRecipientDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

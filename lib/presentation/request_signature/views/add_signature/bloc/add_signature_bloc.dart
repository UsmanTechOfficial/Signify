import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_signature_event.dart';
import 'add_signature_state.dart';

class AddSignatureBloc extends Bloc<AddSignatureEvent, AddSignatureState> {
  AddSignatureBloc() : super(const AddSignatureInitial()) {
    on<OnSignatureSelectionEvent>((event, emit) {
      emit(OnSignatureSelectedState(selectedSignature: event.selectedSign));
    });
  }
}

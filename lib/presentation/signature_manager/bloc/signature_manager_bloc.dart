import 'package:flutter_bloc/flutter_bloc.dart';

import '../../request_signature/widgets/add_signature_widgets/pen_tools.dart';
import 'signature_manager_event.dart';
import 'signature_manager_state.dart';

class SignatureManagerBloc extends Bloc<SignatureManagerEvent, SignatureManagerState> {
  int selectedSign = -1;
  var selectedStroke = PenStroke.fine;
  var selectedColor = PenColors.black;

  /// [AddSignatureInitial]
  SignatureManagerBloc() : super(const AddSignatureInitial()) {
    /// [OnSignatureSelectionEvent] emit [OnSignatureSelectedState]
    on<OnSignatureSelectionEvent>((event, emit) {
      emit(OnSignatureSelectedState(selectedSignature: event.selectedSign));
    });

    /// [OnPenStrokeSelectionEvent] emit [OnPenStrokeSelectionState]
    on<OnPenStrokeSelectionEvent>((event, emit) {
      emit(OnPenStrokeSelectionState(selectedStroke: event.penStroke));
    });

    /// [OnPenColorSelectionEvent] emit [OnPenColorSelectionState]
    on<OnPenColorSelectionEvent>((event, emit) {
      emit(OnPenColorSelectionState(selectedColor: event.penColor));
    });
  }
}

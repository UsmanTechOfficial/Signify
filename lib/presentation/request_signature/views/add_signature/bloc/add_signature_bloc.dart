import 'package:dyno_sign/presentation/widgets/add_signature_widgets/pen_tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_signature_event.dart';
import 'add_signature_state.dart';

class AddSignatureBloc extends Bloc<AddSignatureEvent, AddSignatureState> {
  int selectedSign = -1;
  var selectedStroke = PenStroke.fine;
  int selectedColor = PenColors.black.index;

  /// [AddSignatureInitial]
  AddSignatureBloc() : super(const AddSignatureInitial()) {
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

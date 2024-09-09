import 'package:flutter_bloc/flutter_bloc.dart';

import 'folders_event.dart';
import 'folders_state.dart';

class FoldersBloc extends Bloc<FoldersEvent, FoldersState> {
  FoldersBloc() : super(FoldersInitial()) {
    on<FoldersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

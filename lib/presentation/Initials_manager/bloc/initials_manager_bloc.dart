import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initials_manager_event.dart';
part 'initials_manager_state.dart';

class InitialsManagerBloc
    extends Bloc<InitialsManagerEvent, InitialsManagerState> {
  InitialsManagerBloc() : super(InitialsManagerInitial()) {
    on<InitialsManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

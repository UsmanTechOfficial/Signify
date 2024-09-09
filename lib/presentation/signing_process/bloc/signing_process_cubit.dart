import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  SigningProcessCubit() : super(SigningProcessInitial());
}


import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/sign_documents/only_for_me/for_me_selected_document/bloc/for_me_selected_doc_bloc.dart';

class SignDocForMeBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ForMeSelectedDocBloc>(() => ForMeSelectedDocBloc());
  }
}

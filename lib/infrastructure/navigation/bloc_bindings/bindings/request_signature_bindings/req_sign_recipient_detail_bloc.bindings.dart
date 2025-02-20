import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_user_detail/bloc/req_sign_user_detail_bloc.dart';
import '../../../../dal/services/data_models_repository/req_sign_doc_data_repository.dart';

class ReqSignRecipientDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignUserDetailBloc>(
        () => ReqSignUserDetailBloc(getIt<ReqSignDocumentRepository>()));
  }
}

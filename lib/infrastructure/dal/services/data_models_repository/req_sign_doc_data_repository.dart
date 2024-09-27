import '../../models/app_models/document_user_model.dart';
import '../../models/request_signature_models/req_sign_doc_model.dart';
import '../../models/selected_file.model.dart';

class ReqSignDocDataRepository {
  ReqSignDocModel _reqSignDocModel = ReqSignDocModel.empty();

  ReqSignDocModel get reqSignDocModel => _reqSignDocModel;

  void updateAgreementDetail(AgreementDetailModel agreementDetail) {
    _reqSignDocModel = _reqSignDocModel.copyWith(agreementDetail: agreementDetail);
  }

  void updateRecipientDetail(List<DocumentUserModel> recipientDetail) {
    _reqSignDocModel = _reqSignDocModel.copyWith(recipientDetail: recipientDetail);
  }

  void updateSelectedFile(List<SelectedFileModel> selectedFile) {
    _reqSignDocModel = _reqSignDocModel.copyWith(selectedFile: selectedFile);
  }

  void updateEmailDetail(List<EmailDetailModel> emailDetail) {
    _reqSignDocModel = _reqSignDocModel.copyWith(emailDetail: emailDetail);
  }

  ReqSignDocModel getFinalReqSignDocModel() {
    return _reqSignDocModel;
  }
}

import '../../models/api_models/document_model.dart';
import '../../models/api_models/document_user_model.dart';
import '../../models/api_models/recipinet_model.dart';

class ReqSignDocumentRepository {
  DocumentModel _documentModel = DocumentModel(
    title: '',
    message: '',
    userId: '',
    fieldsData: {},
    file: '',
    documentUsers: [],
    recipients: [],
  );

  DocumentModel get documentModel => _documentModel;

  // Update the title of the document
  void updateTitle(String title) {
    _documentModel = _documentModel.copyWith(title: title);
  }

  // Update the message associated with the document
  void updateMessage(String message) {
    _documentModel = _documentModel.copyWith(message: message);
  }

  // Update the userId associated with the document
  void updateUserId(String userId) {
    _documentModel = _documentModel.copyWith(userId: userId);
  }

  // Update fieldsData (dynamic fields in the document)
  void updateFieldsData(Map<String, dynamic> fieldsData) {
    _documentModel = _documentModel.copyWith(fieldsData: fieldsData);
  }

  // Update the file linked with the document
  void updateFile(String file) {
    _documentModel = _documentModel.copyWith(file: file);
  }

  // Update the list of document users
  void updateDocumentUsers(List<DocumentUserModel> documentUsers) {
    _documentModel = _documentModel.copyWith(documentUsers: documentUsers);
  }

  // Update the list of recipients for the document
  void updateRecipients(List<RecipientModel> recipients) {
    _documentModel = _documentModel.copyWith(recipients: recipients);
  }

  // Retrieve the final DocumentModel
  DocumentModel getFinalDocumentModel() {
    return _documentModel;
  }
}

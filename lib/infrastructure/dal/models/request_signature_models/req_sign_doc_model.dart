import 'package:equatable/equatable.dart';

import '../app_models/document_user_model.dart';
import '../selected_file.model.dart';

part 'agreement_detail_model.dart';
part 'email_detail_model.dart';
part 'recipient_detail_model.dart';
part 'user_model.dart';

class ReqSignDocModel extends Equatable {
  final AgreementDetailModel agreementDetail;
  final List<DocumentUserModel> recipientDetail;
  final List<SelectedFileModel> selectedFile;
  final List<EmailDetailModel> emailDetail;

  const ReqSignDocModel({
    required this.agreementDetail,
    required this.recipientDetail,
    required this.selectedFile,
    required this.emailDetail,
  });

  factory ReqSignDocModel.empty() {
    return const ReqSignDocModel(
      agreementDetail:
          AgreementDetailModel(name: '', desc: '', role: AgreementUserRole.addRecipient),
      recipientDetail: [],
      selectedFile: [],
      emailDetail: [],
    );
  }

  ReqSignDocModel copyWith({
    AgreementDetailModel? agreementDetail,
    List<DocumentUserModel>? recipientDetail,
    List<SelectedFileModel>? selectedFile,
    List<EmailDetailModel>? emailDetail,
  }) {
    return ReqSignDocModel(
      agreementDetail: agreementDetail ?? this.agreementDetail,
      recipientDetail: recipientDetail ?? this.recipientDetail,
      selectedFile: selectedFile ?? this.selectedFile,
      emailDetail: emailDetail ?? this.emailDetail,
    );
  }

  @override
  List<Object?> get props => [agreementDetail, recipientDetail, selectedFile, emailDetail];

  @override
  bool get stringify => true;
}

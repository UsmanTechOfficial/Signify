part of 'req_sign_doc_model.dart';

enum AgreementUserRole {
  addRecipient('Add recipient'),
  includeMe('Include me as a signer'),
  receiveCopy('Receives a copy'),
  onlyMe('I am the only signer');

  final String role;

  const AgreementUserRole(this.role);
}

// class AgreementDetailModel extends Equatable {
//   final String name;
//   final String desc;
//   final AgreementUserRole role;
//
//   const AgreementDetailModel({
//     required this.name,
//     required this.desc,
//     required this.role,
//   });
//
//   factory AgreementDetailModel.empty() {
//     return const AgreementDetailModel(
//       name: '',
//       desc: '',
//       role: AgreementUserRole.addRecipient,
//     );
//   }
//
//   AgreementDetailModel copyWith({
//     String? name,
//     String? desc,
//     AgreementUserRole? role,
//   }) {
//     return AgreementDetailModel(
//       name: name ?? this.name,
//       desc: desc ?? this.desc,
//       role: role ?? this.role,
//     );
//   }
//
//   @override
//   List<Object?> get props => [name, desc, role];
//
//   @override
//   bool get stringify => true;
// }

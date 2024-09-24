part of 'req_sign_doc_model.dart';

class RecipientDetailModel extends Equatable {
  final String name;
  final String email;

  const RecipientDetailModel({
    required this.name,
    required this.email,
  });

  factory RecipientDetailModel.empty() {
    return const RecipientDetailModel(
      name: '',
      email: '',
    );
  }

  RecipientDetailModel copyWith({
    String? name,
    String? email,
  }) {
    return RecipientDetailModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [name, email];

  @override
  bool get stringify => true;
}

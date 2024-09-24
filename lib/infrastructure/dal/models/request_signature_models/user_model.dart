part of 'req_sign_doc_model.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String role;

  const UserModel({
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.empty() {
    return const UserModel(
      name: '',
      email: '',
      role: '',
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  @override
  List<Object> get props => [name, email, role];

  @override
  bool get stringify => true;
}

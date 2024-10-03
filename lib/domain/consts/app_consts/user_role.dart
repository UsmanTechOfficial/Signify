part of '../consts.dart';

enum RecipientUserRole {
  addRecipient('Add signer & Viewer'),
  onlyMe('I am the only signer');

  final String role;

  const RecipientUserRole(this.role);
}

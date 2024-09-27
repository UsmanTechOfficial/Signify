part of '../consts.dart';

enum RecipientUserRole {
  addRecipient('Add recipient'),
  includeMe('Include me as a signer'),
  receiveCopy('Receives a copy'),
  onlyMe('I am the only signer');

  final String role;

  const RecipientUserRole(this.role);
}

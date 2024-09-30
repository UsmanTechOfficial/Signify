enum SignedUserStatus {
  needTOSign('Needs to sign'),
  onlyView('Only view'),
  receiveCopy('Receive a copy');

  final String status;

  const SignedUserStatus(this.status);
}

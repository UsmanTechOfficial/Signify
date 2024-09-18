enum SignProcessTypes {
  requestSignatures('Request Signatures'),
  onlyForMe('Only For Me'),
  sendByOthers('Send By Others');

  final String type;

  const SignProcessTypes(this.type);
}

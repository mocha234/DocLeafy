class SignIn {
  final String responseMessage;

  SignIn({
    this.responseMessage,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(responseMessage: json["message"]);
  }
}

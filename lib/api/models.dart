class LoginResponse {
  String tokenType;
  String scope;
  int? expiresIn;
  int? extExpiresIn;
  int? expiresOn;
  String accessToken;
  String? refreshToken;
  String? idToken;
  String? sessionState;
  String? refreshExpiresIn;

  LoginResponse({
    required this.tokenType,
    required this.scope,
    this.expiresIn,
    this.extExpiresIn,
    this.expiresOn,
    required this.accessToken,
    required this.refreshToken,
    this.idToken,
    this.sessionState,
    this.refreshExpiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        tokenType: json['token_type'],
        scope: json['scope'],
        expiresIn: json['expires_in'] ?? 0,
        extExpiresIn: json['ext_expires_in'] ?? 0,
        expiresOn: json['expires_on'] ?? 0,
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'] ?? "",
        idToken: json['id_token'] ?? "",
        sessionState: json['session_state'] ?? "",
        refreshExpiresIn: json['refresh_expires_in'] ?? "");
  }
}

// class Error {
//   String code;
//   String message;

//   Error({required this.code, required this.message});

//   factory Error.fromJson(Map<String, dynamic> json) {
//     return Error(
//       code: json['code'],
//       message: json['message'],
//     );
//   }
// }

// class LoginRequest {
//   String username;
//   String password;

//   LoginRequest({required this.username, required this.password});

//   Map<String, dynamic> toJson() => {
//         'username': username,
//         'password': password,
//       };
// }

// class ChangePasswordRequest {
//   String oldPassword;
//   String newPassword;
//   String confirmPassword;

//   ChangePasswordRequest({
//     required this.oldPassword,
//     required this.newPassword,
//     required this.confirmPassword,
//   });

//   Map<String, dynamic> toJson() => {
//         'oldPassword': oldPassword,
//         'newPassword': newPassword,
//         'confirmPassword': confirmPassword,
//       };
// }

// class RegistrationRequest {
//   String password;
//   String confirmPassword;
//   String firstName;
//   String lastName;
//   String email;

//   RegistrationRequest({
//     required this.password,
//     required this.confirmPassword,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//   });

//   Map<String, dynamic> toJson() => {
//         'password': password,
//         'confirmPassword': confirmPassword,
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//       };
// }

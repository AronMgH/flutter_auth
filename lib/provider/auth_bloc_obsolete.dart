// import 'package:bloc/bloc.dart';

// import '../api/auth_service.dart';

// abstract class AuthenticationEvent {}

// class LoginEvent extends AuthenticationEvent {
//   final String username;
//   final String password;

//   LoginEvent(this.username, this.password);
// }

// class RegistrationEvent extends AuthenticationEvent {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String password;
//   final String confirmPassword;

//   RegistrationEvent(this.firstName, this.lastName, this.email, this.password,
//       this.confirmPassword);
// }

// class ChangePasswordEvent extends AuthenticationEvent {
//   final String oldPassword;
//   final String newPassword;
//   final String confirmPassword;

//   ChangePasswordEvent(this.oldPassword, this.newPassword, this.confirmPassword);
// }

// abstract class AuthenticationState {}

// // Authenticated and Unauthenticated States will be used to categorize the other specific stataes

// class Authenticated extends AuthenticationState {}

// class Unauthenticated extends AuthenticationState {}

// class RegistrationSuccess
//     extends Unauthenticated {} // even if a user is able to register successfully, they still need to login.

// class LoginError extends Unauthenticated {}

// class RegistrationError extends Unauthenticated {}

// // Because these states require the user to be loggedin we will extend them from Authenticated.
// class LoginSuccess extends Authenticated {}

// class ChangePasswordSuccess extends Authenticated {}

// class ChangePasswordError extends Authenticated {}

// // will be used to show loading widget. this state can be triggered both when user is logged in and loggedout
// class RequestLoading extends AuthenticationState {}

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final AuthService _authService = AuthService();

//   AuthenticationBloc() : super(Unauthenticated());

//   Stream<AuthenticationState> mapEventToState(
//       AuthenticationEvent event) async* {
//     // yield Unauthenticated();
//     yield RequestLoading();
//     if (event is LoginEvent) {
//       try {
//         await _authService.login(event.username, event.password);
//         yield LoginSuccess();
//       } catch (error) {
//         yield LoginError();
//       }
//     } else if (event is RegistrationEvent) {
//       try {
//         await _authService.register(event.firstName, event.lastName,
//             event.email, event.password, event.confirmPassword);
//         yield RegistrationSuccess();
//       } catch (error) {
//         yield RegistrationError();
//       }
//     } else if (event is ChangePasswordEvent) {
//       try {
//         await _authService.changePassword(
//             event.oldPassword, event.newPassword, event.confirmPassword);
//         yield ChangePasswordSuccess();
//       } catch (error) {
//         yield ChangePasswordError();
//       }
//     }
//   }
// }

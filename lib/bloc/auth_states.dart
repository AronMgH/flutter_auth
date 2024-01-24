abstract class AuthenticationState {}

// Authenticated and Unauthenticated States will be used to categorize the other specific stataes

class Authenticated extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class RegistrationSuccess
    extends Unauthenticated {} // even if a user is able to register successfully, they still need to login.

class LoginError extends Unauthenticated {}

class RegistrationError extends Unauthenticated {}

// Because these states require the user to be loggedin we will extend them from Authenticated.
class LoginSuccess extends Authenticated {}

class ChangePasswordSuccess extends Authenticated {}

class ChangePasswordError extends Authenticated {}

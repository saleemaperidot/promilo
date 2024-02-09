part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginInitial(
      {required String usename, required String password}) = LoginInitial;
}

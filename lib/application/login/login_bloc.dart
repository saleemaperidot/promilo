import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:roottest/domain/core/failure/mainfailure.dart';

import 'package:roottest/domain/login/repo/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginServices _loginServices;
  LoginBloc(this._loginServices) : super(LoginState.initial()) {
    on<LoginInitial>((event, emit) async {
      print("called");
      // TODO: implement event handler
      emit(state.copyWith(hasError: false, isLoading: true, status: false));
      final result = await _loginServices.login(
          usename: event.usename, password: event.password);
      print(result);
      final _state = result.fold((MainFailure f) {
        String? message;
        if (f.runtimeType.toString() == '_ServerFailure') {
          message = "Email or Password is not Valid";
        } else if (f.runtimeType.toString() == '_ClientFailure') {
          message = "Something went wrong !!!check network ";
        }
        return LoginState(
            status: false,
            isLoading: false,
            hasError: true,
            message: "Email or Password is not Valid");
      }, (r) {
        return LoginState(
            status: true,
            isLoading: false,
            hasError: false,
            message: "Login Success");
      });
      emit(_state);
    });
  }
}

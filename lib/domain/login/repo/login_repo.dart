import 'package:dartz/dartz.dart';
import 'package:roottest/domain/core/failure/mainfailure.dart';
import 'package:roottest/domain/login/login_model/login_model.dart';

abstract class LoginServices {
  Future<Either<MainFailure, LoginModel>> login(
      {required String usename, required String password});
}

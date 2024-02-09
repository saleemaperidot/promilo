import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:roottest/domain/core/apis/apis.dart';
import 'package:roottest/domain/core/failure/mainfailure.dart';
import 'package:roottest/domain/login/login_model/login_model.dart';

import 'package:roottest/domain/login/repo/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LoginServices)
class LoginImplementation extends LoginServices {
  @override
  Future<Either<MainFailure, LoginModel>> login(
      {required String usename, required String password}) async {
    print("implementation");
    var bytes = utf8.encode(password); // data being hashed
    var digestPass = sha256.convert(bytes);
    try {
      final formData = FormData.fromMap({
        'username': usename,
        'password': digestPass,
        'grant_type': 'password',
      });
      final response = await Dio().post(Apis.login,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=='
          }),
          data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        print(response.data);
        final result = LoginModel.fromJson(response.data);
        print(result);
        return Right(result);
      } else {
        print("error");
        print(response.statusCode);
        return Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.ClientFailure());
    }
  }
}

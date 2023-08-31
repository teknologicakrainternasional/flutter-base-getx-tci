import 'package:base_flutter_tci/domain/_core/failures/app_failures.dart';
import 'package:base_flutter_tci/domain/auth/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Stream<User?> streamUser();

  Future<Either<AppFailure, Unit>> logIn({
    required String username,
    required String password,
  });

  Future<void> logOut();
}
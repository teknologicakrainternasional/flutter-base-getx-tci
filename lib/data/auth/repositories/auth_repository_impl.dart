import 'dart:async';

import 'package:base_flutter_tci/_core/app_extensions.dart';
import 'package:base_flutter_tci/_core/utils/logger.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';
import 'package:base_flutter_tci/data/auth/datasources/auth_local_datasource.dart';
import 'package:base_flutter_tci/data/auth/datasources/auth_remote_datasource.dart';
import 'package:base_flutter_tci/domain/_core/failures/app_failures.dart';
import 'package:base_flutter_tci/domain/auth/entities/user.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppFailure, Unit>> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final token = await remoteDatasource.getToken(
        username: username,
        password: password,
      );
      await localDatasource.storeToken(token);
      final user = await remoteDatasource.getUser();
      await localDatasource.storeUser(user);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }

  @override
  Future<void> logOut() async {
    await localDatasource.deleteToken();
    await localDatasource.deleteUser();
  }

  @override
  Stream<User?> streamUser() async* {
    try {
      final user = await remoteDatasource.getUser();
      await localDatasource.storeUser(user);
    } catch (e) {
      logger.e(e);
    }
    yield* localDatasource.streamUserModel.stream.map(
      (userModel) => userModel?.toDomain(),
    );
  }
}

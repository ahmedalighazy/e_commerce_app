import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity/loginResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/authRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(String email, String password) {
    return authRepository.login(email, password);
  }
}

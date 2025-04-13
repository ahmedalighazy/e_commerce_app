import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity/loginResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/registerResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/authRepository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => right(response) );
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) async{
   var either = await authRemoteDataSource.login(email, password);
   return either.fold((error)=> Left(error), (response)=> right(response));
  }

}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/loginResponseDto.dart';
import 'package:e_commerce_app/data/model/registerResponseDto.dart';
import 'package:e_commerce_app/domain/entity/registerResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      ) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(NetworkError(
          errorMessage: 'No Internet Connection, please check your internet.',
        ));
      }

      final response = await apiManager.postData(
        EndPoints.register,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );

      final statusCode = response.statusCode ?? 0;

      if (statusCode >= 200 && statusCode < 300) {
        final registerResponse = RegisterResponseDto.fromJson(response.data);
        return Right(registerResponse);
      } else {
        String errorMessage = "Unexpected server error";
        try {
          final errorResponse = RegisterResponseDto.fromJson(response.data);
          errorMessage = errorResponse.message ?? errorMessage;
        } catch (_) {}
        return Left(ServerError(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(String email, String password)async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(NetworkError(
          errorMessage: 'No Internet Connection, please check your internet.',
        ));
      }

      final response = await apiManager.postData(
        EndPoints.login,
        body: {
          "email": email,
          "password": password,
        },
      );

      final statusCode = response.statusCode ?? 0;

      if (statusCode >= 200 && statusCode < 300) {
        final loginResponse = LoginResponseDto.fromJson(response.data);
        return Right(loginResponse);
      } else {
        String errorMessage = "Unexpected server error";
        try {
          final errorResponse = LoginResponseDto.fromJson(response.data);
          errorMessage = errorResponse.message ?? errorMessage;
        } catch (_) {}
        return Left(ServerError(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}

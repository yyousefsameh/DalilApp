import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout to the server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout from the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.unknown:
        return ServerFailure(dioException.error.toString());
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try again");
    } else if (statusCode == 500) {
      return ServerFailure('Server Error, Try again later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

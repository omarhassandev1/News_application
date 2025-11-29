import 'package:dio/dio.dart';

abstract class FailureModel implements Exception {
  String errorMessage;
  int? statusCode;

  FailureModel({this.statusCode, required this.errorMessage});

  @override
  String toString() {
    return errorMessage;
  }

  static FailureModel getNetworkFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return BaseFailure(errorMessage: 'Bad network connection');

      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
        return BaseFailure(errorMessage: 'Server error');

      case DioExceptionType.connectionError:
        return BaseFailure(errorMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return BaseFailure(errorMessage: 'Something went wrong');
    }
  }
}

class BaseFailure extends FailureModel {
  BaseFailure({super.statusCode, required super.errorMessage});
}

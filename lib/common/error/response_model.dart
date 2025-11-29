import 'package:news_app/common/error/failure_model.dart';

sealed class Response<T>{}

class Success<T> extends Response<T>{
  final T data;

  Success({required this.data});
}

class Failure<T> extends Response<T>{
  final FailureModel error;

  Failure({required this.error});
}

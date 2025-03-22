import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;
  Failure(this.errormessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormessage);
  static ServerFailure fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهى وقت الاتصال.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت فترة إرسال البيانات.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت فترة استقبال البيانات.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب.');
      case DioExceptionType.connectionError:
        return ServerFailure('حدث خطأ في الاتصال.');
      case DioExceptionType.unknown:
        return ServerFailure('خطأ غير متوقع: ${dioException.message}');
      default:
        return ServerFailure('حدث خطأ غير معروف.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

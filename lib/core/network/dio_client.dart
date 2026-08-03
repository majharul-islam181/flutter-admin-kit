import 'package:dio/dio.dart';
import 'package:flutter_admin_kit/core/errors/failures.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 80,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.none,
        ),
      );

  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
}

@lazySingleton
class DioClient {
  final Dio _dio;
  final LocalStorageService _localStorage;
  final Logger _logger;

  DioClient(this._dio, this._localStorage, this._logger) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _localStorage.getAuthToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          _logger.i('Request: [${options.method}] ${options.uri}\nHeaders: ${options.headers}\nData: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i('Response: [${response.statusCode}] ${response.requestOptions.uri}\nData: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          _logger.e('Error: [${error.response?.statusCode}] ${error.requestOptions.uri}\nMessage: ${error.message}\nResponse: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }

  /// Get request wrapper
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// Post request wrapper
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// Put request wrapper
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// Delete request wrapper
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Failure _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'Connection timed out. Please check your internet.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;
        String message = 'Received invalid response from server.';

        if (responseData is Map && responseData.containsKey('message')) {
          message = responseData['message'].toString();
        } else if (responseData is Map && responseData.containsKey('error')) {
          message = responseData['error'].toString();
        }

        if (statusCode == 401 || statusCode == 403) {
          return AuthFailure(message: message);
        }
        return ServerFailure(
          message: message,
          statusCode: statusCode,
          errorDetails: responseData,
        );
      case DioExceptionType.cancel:
        return const UnknownFailure(message: 'Request was cancelled.');
      default:
        return const UnknownFailure(message: 'An unexpected network error occurred.');
    }
  }
}

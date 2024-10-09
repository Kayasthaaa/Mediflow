import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mediflow_bloc/constant/app_url.dart';

abstract class ApiClient {
  /// mediflow
  static final Dio _mediflowDio = Dio();
  static final Dio _mediflowWithAuthDio = Dio();

  /// cemr
  static final Dio _cemrDio = Dio();
  static final Dio _cemrWithAuthDio = Dio();

  /// public token
  static String _mediflowPublicToken = '';
  static String _cemrPublicToken = '';

  /// mediflow client without auth
  static Dio mediflowApi() {
    _mediflowDio.options.baseUrl = kMediflowApiUrl;
    return _mediflowDio;
  }

  /// medilfow client with auth
  static Future<Dio> mediflowWithAuthApi() async {
    _mediflowWithAuthDio.options.baseUrl = kMediflowApiUrl;
    if (_mediflowPublicToken == '') {
      Response response = await mediflowApi().post(
        '/api/v2/token/GetToken',
        data: {
          'username': kMediflowPublicUsername,
          'password': kMediflowPublicPassword,
        },
      );
      if (response.statusCode == 200) {
        _mediflowPublicToken = response.data['token'];
      }
    }
    _mediflowWithAuthDio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $_mediflowPublicToken',
    };
    return _mediflowWithAuthDio;
  }

  /// cemr api without auth
  static Dio cemrApi() {
    _cemrDio.options.baseUrl = kCemrApiUrl;
    return _cemrDio;
  }

  /// cemr api with auth
  static Future<Dio> cemrWithAuthApi() async {
    _cemrWithAuthDio.options.baseUrl = kCemrApiUrl;
    if (_cemrPublicToken == '') {
      Response response = await cemrApi().post(
        '/api/Token/Login',
        data: {
          'username': kCemrPublicUsername,
          'password': kCemrPublicPassword,
        },
      );
      if (response.statusCode == 200) {
        _cemrPublicToken = response.data['token'];
      }
    }
    _cemrWithAuthDio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $_cemrPublicToken',
    };
    return _cemrWithAuthDio;
  }
}

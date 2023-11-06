import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class AuthApi extends BaseDio {
  Future<Response<BaseResponse>> auth(String token, String smsCode) =>
      get('v1/auth/$token?smsCode=$smsCode');
}

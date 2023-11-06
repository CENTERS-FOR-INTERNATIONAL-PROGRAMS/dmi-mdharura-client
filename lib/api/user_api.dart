import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class UserApi extends BaseDio {
  Future<Response<BaseResponse>> verify(
          String phoneNumber, Map<String, dynamic> query) =>
      get('v1/user/verify/$phoneNumber', queryParameters: query);

  Future<Response<BaseResponse>> retrieve(Map<String, dynamic> query) =>
      get('v1/user', queryParameters: query);

  Future<Response<BaseResponse>> create(
          String token, String unitId, Map<String, dynamic> data) =>
      post('v1/user/$token/$unitId', data: data);
}

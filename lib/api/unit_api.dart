import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class UnitApi extends BaseDio {
  Future<Response<BaseResponse>> create(
          String unitId, Map<String, dynamic> data) =>
      post('v1/unit/$unitId', data: data);

  Future<Response<BaseResponse>> update(
          String unitId, Map<String, dynamic> data) =>
      put('v1/unit/$unitId', data: data);

  Future<Response<BaseResponse>> retrieve(Map<String, dynamic> query) =>
      get('v1/unit', queryParameters: query);

  Future<Response<BaseResponse>> remove(String unitId) =>
      delete('v1/unit/$unitId');
}

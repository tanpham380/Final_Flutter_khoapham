import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_sale_25042023/data/api/api_request.dart';

import 'package:flutter_app_sale_25042023/data/api/dto/user_dto.dart';
import 'package:flutter_app_sale_25042023/utils/exception_utils.dart';

import '../data/api/app_reposnse.dart';

class SignUpRepository {
  ApiRequest? _apiRequest;

  void setApiRequest(ApiRequest apiRequest) {
    _apiRequest = apiRequest;
  }

  Future<UserDTO> signUpService(String email, String name ,String phone ,String password , String address ) async {
    Completer<UserDTO> completer = Completer();
    try {
      Response<dynamic> response = await _apiRequest?.signUp(email, password , name , phone , address);
      AppResponse<UserDTO> appResponse = AppResponse.fromJson(response.data, UserDTO.fromJson);
      completer.complete(appResponse.data);
    } on DioException catch(dioException) {
      var message = ExceptionUtils.getErrorMessage(dioException.response?.data);
      completer.completeError(message);
    } catch(e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }

}
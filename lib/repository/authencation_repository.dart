import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_sale_25042023/data/api/api_request.dart';

import 'package:flutter_app_sale_25042023/data/api/dto/user_dto.dart';
import 'package:flutter_app_sale_25042023/utils/exception_utils.dart';

import '../data/api/app_reposnse.dart';

class AuthenticationRepository {
  ApiRequest? _apiRequest;

  void setApiRequest(ApiRequest apiRequest) {
    _apiRequest = apiRequest;
  }

  Future<UserDTO> signInService(String email, String password) async {
    Completer<UserDTO> completer = Completer();
    try {
      Response<dynamic> response = await _apiRequest?.signIn(email, password);
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
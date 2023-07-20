import 'dart:async';

import 'package:flutter_app_sale_25042023/common/base/base_bloc.dart';
import 'package:flutter_app_sale_25042023/common/base/base_event.dart';
import 'package:flutter_app_sale_25042023/data/api/dto/user_dto.dart';

import 'package:flutter_app_sale_25042023/data/parser/user_value_object_parser.dart';
import 'package:flutter_app_sale_25042023/presentation/sign_in/bloc/sign_in_event.dart';

import '../../../model/user_value_object.dart';
import '../../../repository/authencation_repository.dart';


class SignInBloc extends BaseBloc {
  AuthenticationRepository? _repository;

  void setAuthenticationRepository(AuthenticationRepository repository) {
    _repository = repository;
  }

  @override
  void dispatch(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        executeSignIn(event as SignInEvent);
        break;
    }
  }

  void executeSignIn(SignInEvent event) async {
    loadingSink.add(true);
    try {
      UserDTO? userDTO =
          await _repository?.signInService(event.email, event.password);
      UserValueObject userValueObject =
          UserValueObjectParser.parseFromUserDTO(userDTO);
      messageSink.add("Login successful");
    } catch (e) {
      messageSink.add(e.toString());
    }
    loadingSink.add(false);
  }
}
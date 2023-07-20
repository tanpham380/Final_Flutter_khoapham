import 'dart:async';

import 'package:flutter_app_sale_25042023/common/base/base_bloc.dart';
import 'package:flutter_app_sale_25042023/common/base/base_event.dart';
import 'package:flutter_app_sale_25042023/data/api/dto/user_dto.dart';

import 'package:flutter_app_sale_25042023/data/parser/user_value_object_parser.dart';



import '../../../model/user_value_object.dart';
import '../../../repository/authencation_repository.dart';
import 'sign_up_event.dart';



class SignUpBloc extends BaseBloc {
  AuthenticationRepository? _repository;

  void setSignUpRepository(AuthenticationRepository repository) {
    _repository = repository;
  }

  @override
  void dispatch(BaseEvent event) {
    switch (event.runtimeType) {
      case SignUpEvent:
        executeSignUp(event as SignUpEvent);
        break;
    }
  }

  void executeSignUp(SignUpEvent event) async {
    loadingSink.add(true);
    try {
      UserDTO? userDTO =
          await _repository?.signUpService(event.email, event.password , event.name , event.phone , event.address);
      UserValueObject userValueObject =
          UserValueObjectParser.parseFromUserDTO(userDTO);
      messageSink.add("Create user successful");
    } catch (e) {
      messageSink.add(e.toString());
    }
    loadingSink.add(false);
  }
}
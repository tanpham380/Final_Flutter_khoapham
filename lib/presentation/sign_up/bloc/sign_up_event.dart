import 'package:flutter_app_sale_25042023/common/base/base_event.dart';

class SignUpEvent extends BaseEvent {
  String email, password , name , phone , address;

  SignUpEvent({required this.email, required this.password , required this.name , required this.phone , required this.address});

  @override
  List<Object?> get props => [];
}
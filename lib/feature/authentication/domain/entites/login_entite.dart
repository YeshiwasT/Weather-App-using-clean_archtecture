
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{

  final String userName;
  final String password;

  LoginEntity({required this.userName, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userName, password];
  
}
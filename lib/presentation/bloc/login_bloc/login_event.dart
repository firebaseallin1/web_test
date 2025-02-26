
 import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnInitialEvent extends LoginEvent{
  @override
  List<Object?> get props => [];
}

class OnLoadingEvent  extends LoginEvent{
  @override
  List<Object?> get props => [];
}

class OnLoadedEvent  extends LoginEvent{
  @override
  List<Object?> get props => [];
}

class OnVerificationEvent extends LoginEvent{
  final String userName;
  final  String password;

   const OnVerificationEvent({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName,password];}




import 'package:equatable/equatable.dart';

import '../../../data/model/user_model/users_model.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}


class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoadedState  extends LoginState{
  @override
  List<Object?> get props => [];
}



class VerificationError extends LoginState{

  final String errorMessage;

  const VerificationError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}


class verificationSuccesState  extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccess  extends LoginState{
   final List<UsersComponents> list;
   LoginSuccess({required this.list});
  @override
  List<Object?> get props => [list];
}

class LoginError  extends LoginState{
  final String message;
  LoginError({required this.message});
  @override
  List<Object?> get props => [message];
}



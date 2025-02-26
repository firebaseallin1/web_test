

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/login_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginRepo loginRepo = LoginRepo();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) {

    });

    on<OnVerificationEvent>((event, emit) async {
      print('bloc worked ${event.userName.toString()}');
      print('${event.userName.toString()}');
      emit(LoginLoadingState());
      if (event.userName.toString()=='' ) {
        emit(LoginLoadedState());
        emit(VerificationError('UserName is empty'));
        print('userid error');

      }else if (event.password.toString().isEmpty ) {
        emit(LoginLoadedState());
        emit(VerificationError('Password is empty'));

      }else{
        // emit(LoginLoadedState());
        // emit(verificationSuccesState());
        await login(event, emit);
      }
    });


  }


  Future login(OnVerificationEvent event, Emitter<LoginState> emit) async {

    var body = {
      "Userid":event.userName.toString(),
      "Password":event.password.toString()
    };

    var response = await loginRepo.login(body);

    if (response.status==1) {
      print('login success');

      emit(LoginLoadedState());
      emit(LoginSuccess(list: response.usersComponents!));
    } else {
      print('loginerror');
      emit(LoginLoadedState());
      emit(LoginError(message: response.message.toString()));
    }

  }


}


import 'package:fluttertoast/fluttertoast.dart';

import 'login_event.dart';

import 'login_model.dart';
import 'login_repository.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.onInit());
  LoginRepository loginRepository = LoginRepository();
  String devTkn = '123';



  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {


     if (event is OnLoginApiHit) {
      var isSuccess = await onLoginApi(state, event.email, event.password);
      if (isSuccess.statusCode==1) {
        yield LoginState.onLoginSuccess(state, true,false,isSuccess);
      }
      else {
        yield LoginState.onLoginFailure(state, false,false,isSuccess);
      }
    }

  }


  Future<LoginModel> onLoginApi(LoginState state, String email, String password) async {
    LoginModel respp = await loginRepository.loginApi(email, password);

    if (respp.statusCode == 1) {
      print("cvbnjhgfdxsxdcvb" + respp.statusCode.toString());
      return respp;
    }
    else {
      // Fluttertoast.showToast(msg: "Please try using different id");
      return respp;
    }
  }


}

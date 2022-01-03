

import 'login_model.dart';

class LoginState {
  final bool isSuccess;
  final bool isError;
  final  LoginModel model;


  LoginState._(this.isSuccess,this.isError,this.model);

  LoginState.onLoginSuccess(LoginState state, bool isSuccess,bool isError,LoginModel model)
      : this._(isSuccess,false,model);

  LoginState.onLoginFailure(LoginState state, bool isSuccess,bool isError,LoginModel model)
      : this._(false,isError,model);

  LoginState.onInit() : this._(false, false,LoginModel());

}

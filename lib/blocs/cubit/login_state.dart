part of 'login_cubit.dart';

 class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
   const LoginStateInitial();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateError extends LoginState {
  final String error;
  const LoginStateError(this.error);
}

class LoginStateLoaded extends LoginState {
  const LoginStateLoaded();
}

part of 'login_cubit.dart';

sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoaded extends LoginState {
  final bool isAuth;

  LoginLoaded({
    required this.isAuth,
  });
  @override
  List<Object> get props => [isAuth];
}

final class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
}
class IsAuthenticated extends AuthenticationEvent{
  @override
  List<Object?> get props => [];
}
class IsLogout extends AuthenticationEvent{
  @override
  List<Object?> get props => [];
}

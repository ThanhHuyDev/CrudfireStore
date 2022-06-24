import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crudfirestore/models/app_user.dart';
import 'package:crudfirestore/repositories/authentication_repositories.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepostory) : super(UnInitialized()) {
    on<IsAuthenticated>(_handleVerifyUserAuth);
    on<IsLogout>(_handleIsLogout);
  }
  final AuthenticationRepostory _authenticationRepostory;

  FutureOr<void> _handleVerifyUserAuth(
      IsAuthenticated event, Emitter<AuthenticationState> emit) async {
    emit(VerifyingAuth());
    bool IsAuthenticated = await _authenticationRepostory.isLoggedIn();
    if (IsAuthenticated) {
      emit(Authenticated(AppUser()));
    }else{
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _handleIsLogout(IsLogout event, Emitter<AuthenticationState> emit) async{
    emit(UnAuthenticated());
    return await _authenticationRepostory.signOut();
  }
}

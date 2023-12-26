import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(UserLoggedState(message: "loded"));
      } else {
        emit(UserNotLoggedState());
      }
    });
    on<SignInWithGoogleEvent>((event, emit) async {
      await _signInWithGoogle(event, emit);
    });

    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      await _signInWithEmailAndPassword(event.email, event.password);
    });
    on<SignOutEvent>((event, emit) async {
      await _signOut(event, emit);
    });
  }

  Future<void> _signInWithGoogle(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user!;

      emit(UserLoggedState(message: 'loded'));
      add(AuthenticationUserChanged(user));
    } catch (e) {
      emit(AuthenticationErrorState(error: "Error signing in with Google"));
    }
  }

  Future<void> _signOut(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    await _auth.signOut();
  }

  Future<String?> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } catch (e) {
      return "Error in Signup : $e";
    }
    return null;
  }
}

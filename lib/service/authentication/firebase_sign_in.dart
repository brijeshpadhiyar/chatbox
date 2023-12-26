import 'package:chatbox/blocs/Authentication/authentication_bloc.dart';

class FirebaseService {
  Future<void> signInWithGoogle() async {
    AuthenticationBloc().add(SignInWithGoogleEvent());
  }

  Future<void> signOunt() async {
    AuthenticationBloc().add(SignOutEvent());
  }
}

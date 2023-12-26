import 'package:chatbox/blocs/Authentication/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

final AuthenticationBloc authenticationBloc = AuthenticationBloc();

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthenticationService() {
    auth.authStateChanges().listen((user) {
      authenticationBloc.add(AuthenticationUserChanged(user));
    });
  }
}

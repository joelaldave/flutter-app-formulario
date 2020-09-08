import 'dart:async';

import 'package:formvalidation/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //recuperar los datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validpass);

  //

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al steam
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  //obtener ultimo valor ingresado alos streams

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

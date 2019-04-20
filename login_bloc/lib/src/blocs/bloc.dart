import 'dart:async';
import 'validators.dart';

class Bloc with validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  Stream<String> get email => _email.stream.transform(validateEMail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

//dispose
  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = new Bloc();

import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEMail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  //we dont care of third comparable
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (email, password) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

//dispose
  dispose() {
    _email.close();
    _password.close();
  }

  submit()
  {
    print('Emai is valid : ${_email.value}');
    print('Password is valid : ${_password .value}');
  }
}

final bloc = new Bloc();

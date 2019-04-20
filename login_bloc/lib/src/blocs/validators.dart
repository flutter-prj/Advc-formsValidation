import 'dart:async';

mixin validators {
  final validateEMail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add('valid password added');
    } else {
      sink.addError('password length should be more than 8 chars length');
    }
  });
}

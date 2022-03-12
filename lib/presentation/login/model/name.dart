import 'package:formz/formz.dart';

enum NameValidationError {
  /// Generic invalid error.
  invalid
}

class Name extends FormzInput<String, NameValidationError> {
  /// {@macro email}
  const Name.pure() : super.pure('');

  /// {@macro email}
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : NameValidationError.invalid;
  }
}
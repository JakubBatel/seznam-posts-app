typedef Validator<T> = String? Function(T);

class FormValidators {
  static final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );

  const FormValidators._();

  static Validator<Object?> none() => (_) => null;

  static Validator<Object?> notNullValidator({String? message}) => (value) => _validateNotNull(value, message: message);

  static Validator<String?> notNullAndNotEmptyValidator({String? message}) =>
      (value) => _validateNotNullAndNotEmpty(value, message: message);

  static Validator<String?> emailValidator(
          {bool requiredField = true, String? emptyMessage, String? invalidEmailMessage}) =>
      (email) => _validateEmail(
            email,
            requiredField: requiredField,
            emptyMessage: emptyMessage,
            invalidEmailMessage: invalidEmailMessage,
          );

  static String? _validateNotNull(Object? value, {String? message}) {
    if (value == null) {
      return message ?? 'This field is required';
    }
    return null;
  }

  static String? _validateNotNullAndNotEmpty(String? value, {String? message}) {
    final notNullValidationResult = _validateNotNull(value, message: message);
    if (notNullValidationResult != null) {
      return notNullValidationResult;
    }
    if (value!.isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  static String? _validateEmail(String? email,
      {bool requiredField = true, String? emptyMessage, String? invalidEmailMessage}) {
    if (requiredField) {
      final notNullValidationResult = _validateNotNullAndNotEmpty(email, message: emptyMessage);
      if (notNullValidationResult != null) {
        return notNullValidationResult;
      }
    }

    if ((email == null || email.isEmpty) && !requiredField) {
      return null;
    }

    final isValid = emailRegExp.hasMatch(email!);
    if (!isValid) {
      return invalidEmailMessage ?? 'Invalid email';
    }
    return null;
  }
}

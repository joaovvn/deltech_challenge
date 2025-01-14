// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'LoginControllerBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$credentialAtom =
      Atom(name: 'LoginControllerBase.credential', context: context);

  @override
  UserCredential? get credential {
    _$credentialAtom.reportRead();
    return super.credential;
  }

  @override
  set credential(UserCredential? value) {
    _$credentialAtom.reportWrite(value, super.credential, () {
      super.credential = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void navigateToSignUpPage(BuildContext context) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.navigateToSignUpPage');
    try {
      return super.navigateToSignUpPage(context);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
message: ${message},
credential: ${credential}
    ''';
  }
}

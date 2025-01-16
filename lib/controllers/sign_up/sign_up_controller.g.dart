// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on SignUpControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SignUpControllerBase.isLoading', context: context);

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
      Atom(name: 'SignUpControllerBase.message', context: context);

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

  late final _$signUpCompletedAtom =
      Atom(name: 'SignUpControllerBase.signUpCompleted', context: context);

  @override
  bool get signUpCompleted {
    _$signUpCompletedAtom.reportRead();
    return super.signUpCompleted;
  }

  @override
  set signUpCompleted(bool value) {
    _$signUpCompletedAtom.reportWrite(value, super.signUpCompleted, () {
      super.signUpCompleted = value;
    });
  }

  late final _$passwordObscureAtom =
      Atom(name: 'SignUpControllerBase.passwordObscure', context: context);

  @override
  bool get passwordObscure {
    _$passwordObscureAtom.reportRead();
    return super.passwordObscure;
  }

  @override
  set passwordObscure(bool value) {
    _$passwordObscureAtom.reportWrite(value, super.passwordObscure, () {
      super.passwordObscure = value;
    });
  }

  late final _$confirmPasswordObscureAtom = Atom(
      name: 'SignUpControllerBase.confirmPasswordObscure', context: context);

  @override
  bool get confirmPasswordObscure {
    _$confirmPasswordObscureAtom.reportRead();
    return super.confirmPasswordObscure;
  }

  @override
  set confirmPasswordObscure(bool value) {
    _$confirmPasswordObscureAtom
        .reportWrite(value, super.confirmPasswordObscure, () {
      super.confirmPasswordObscure = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('SignUpControllerBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$SignUpControllerBaseActionController =
      ActionController(name: 'SignUpControllerBase', context: context);

  @override
  void switchPasswordVisibility() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.switchPasswordVisibility');
    try {
      return super.switchPasswordVisibility();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchConfirmPasswordVisibility() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.switchConfirmPasswordVisibility');
    try {
      return super.switchConfirmPasswordVisibility();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
message: ${message},
signUpCompleted: ${signUpCompleted},
passwordObscure: ${passwordObscure},
confirmPasswordObscure: ${confirmPasswordObscure}
    ''';
  }
}

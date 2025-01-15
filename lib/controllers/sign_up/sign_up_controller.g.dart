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

  late final _$signUpAsyncAction =
      AsyncAction('SignUpControllerBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
message: ${message},
signUpCompleted: ${signUpCompleted}
    ''';
  }
}

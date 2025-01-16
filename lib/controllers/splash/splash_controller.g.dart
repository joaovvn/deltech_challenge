// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashController on SplashControllerBase, Store {
  late final _$authenticatedAtom =
      Atom(name: 'SplashControllerBase.authenticated', context: context);

  @override
  bool? get authenticated {
    _$authenticatedAtom.reportRead();
    return super.authenticated;
  }

  @override
  set authenticated(bool? value) {
    _$authenticatedAtom.reportWrite(value, super.authenticated, () {
      super.authenticated = value;
    });
  }

  late final _$loadedAtom =
      Atom(name: 'SplashControllerBase.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$verifyAuthenticationAsyncAction = AsyncAction(
      'SplashControllerBase.verifyAuthentication',
      context: context);

  @override
  Future verifyAuthentication() {
    return _$verifyAuthenticationAsyncAction
        .run(() => super.verifyAuthentication());
  }

  @override
  String toString() {
    return '''
authenticated: ${authenticated},
loaded: ${loaded}
    ''';
  }
}

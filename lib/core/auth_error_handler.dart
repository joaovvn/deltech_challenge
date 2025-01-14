import 'package:firebase_auth/firebase_auth.dart';

String handleAuthError(FirebaseAuthException error) {
  switch (error.code) {
    case 'email-already-in-use':
      return 'Já existe uma conta com este endereço de e-mail.';
    case 'invalid-email':
      return 'O endereço de e-mail não é válido.';
    case 'operation-not-allowed':
      return 'Contas de e-mail/senha não estão habilitadas. Habilite no Firebase Console, na aba Auth.';
    case 'weak-password':
      return 'A senha não é forte o suficiente.';
    case 'too-many-requests':
      return 'Você enviou muitas requisições. Tente novamente mais tarde.';
    case 'user-token-expired':
      return 'O token de autenticação expirou. Faça login novamente.';
    case 'network-request-failed':
      return 'Falha na requisição de rede. Verifique sua conexão com a internet.';
    default:
      return 'Erro desconhecido: ${error.message}';
  }
}

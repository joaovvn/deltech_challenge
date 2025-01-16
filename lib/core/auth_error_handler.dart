import 'package:firebase_auth/firebase_auth.dart';

String handleAuthError(FirebaseAuthException error) {
  switch (error.code) {
    case 'email-already-in-use':
      return 'An account with this email address already exists.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'operation-not-allowed':
      return 'Email/password accounts are not enabled. Enable them in the Firebase Console under the Auth tab.';
    case 'weak-password':
      return 'The password is not strong enough.';
    case 'too-many-requests':
      return 'You have sent too many requests. Please try again later.';
    case 'user-token-expired':
      return 'The authentication token has expired. Please log in again.';
    case 'network-request-failed':
      return 'Network request failed. Check your internet connection.';
    default:
      return 'Unknown error: ${error.message}';
  }
}

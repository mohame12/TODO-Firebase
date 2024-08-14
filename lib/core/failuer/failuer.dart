import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    switch (e) {
      case FirebaseAuthException:
        return FirebaseFailure.fromAuthException(e as FirebaseAuthException);
      default:
        return FirebaseFailure._fromGeneralException(e);
    }
  }

  factory FirebaseFailure._fromGeneralException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFailure('You do not have permission to perform this action.');

      case 'unavailable':
        return FirebaseFailure('The service is currently unavailable.');

      case 'aborted':
        return FirebaseFailure('The operation was aborted.');

      case 'already-exists':
        return FirebaseFailure('The document already exists.');

      case 'not-found':
        return FirebaseFailure('The document was not found.');

      case 'deadline-exceeded':
        return FirebaseFailure('The operation timed out.');

      case 'failed-precondition':
        return FirebaseFailure('The operation was rejected due to a failed precondition.');

      case 'invalid-argument':
        return FirebaseFailure('An invalid argument was provided.');

      case 'internal':
        return FirebaseFailure('An internal error occurred.');

      case 'resource-exhausted':
        return FirebaseFailure('Resource exhausted, please try again later.');

      case 'unauthenticated':
        return FirebaseFailure('You are not authenticated, please log in.');

      case 'unimplemented':
        return FirebaseFailure('This operation is not implemented.');

      case 'cancelled':
        return FirebaseFailure('The operation was cancelled.');

      case 'data-loss':
        return FirebaseFailure('Unrecoverable data loss or corruption.');

      case 'unknown':
        return FirebaseFailure('An unknown error occurred, please try again.');

      default:
        return FirebaseFailure('An error occurred: ${e.message}');
    }
  }

  factory FirebaseFailure.fromAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseFailure('The email address is badly formatted.');

      case 'user-disabled':
        return FirebaseFailure('This user account has been disabled.');

      case 'user-not-found':
        return FirebaseFailure('No user found for the provided email.');

      case 'wrong-password':
        return FirebaseFailure('The password is invalid for the given email.');

      case 'email-already-in-use':
        return FirebaseFailure('The email address is already in use by another account.');

      case 'operation-not-allowed':
        return FirebaseFailure('Email/password accounts are not enabled.');

      case 'weak-password':
        return FirebaseFailure('The password provided is too weak.');

      case 'too-many-requests':
        return FirebaseFailure('Too many attempts to sign in, please try again later.');

      case 'account-exists-with-different-credential':
        return FirebaseFailure('An account already exists with a different credential.');

      case 'invalid-credential':
        return FirebaseFailure('The credential provided is malformed or has expired.');

      default:
        return FirebaseFailure('Authentication error: ${e.message}');
    }
  }
}

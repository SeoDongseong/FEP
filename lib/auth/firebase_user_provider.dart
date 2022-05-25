import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FinancialEducationPlatformFirebaseUser {
  FinancialEducationPlatformFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FinancialEducationPlatformFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FinancialEducationPlatformFirebaseUser>
    financialEducationPlatformFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FinancialEducationPlatformFirebaseUser>((user) =>
            currentUser = FinancialEducationPlatformFirebaseUser(user));

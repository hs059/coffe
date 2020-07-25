import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Auth._();

  static final Auth auth = Auth._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SharedPreferences sharedPreferences;

  Future<SharedPreferences> initSp() async {
    if (sharedPreferences == null) {
      return sharedPreferences = await SharedPreferences.getInstance();
    } else {
      return sharedPreferences;
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> registerUsingEmailAndPassword(
      {String email, String password}) async {
    try {
      sharedPreferences = await initSp();

      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      assert(authResult.user != null);

      String userId = authResult.user.uid;

      sharedPreferences.setString('userId', userId);
      sharedPreferences.setBool('isLogin', true);
      return userId;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getUserId() async {
    sharedPreferences = await initSp();
    String userId = sharedPreferences.getString('userId');
    return userId;
  }

  Future<bool> getIsLogin() async {
    sharedPreferences = await initSp();
    bool isLogin = sharedPreferences.getBool('isLogin');
    return isLogin;
  }

  Future<String> loginUsingEmailAndPassword(
      {String email, String password}) async {
    try {
      sharedPreferences = await initSp();

      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      String userId = authResult.user.uid;
      assert(authResult.user != null);
      sharedPreferences.setString('userId', userId);
      sharedPreferences.setBool('isLogin', true);
      return userId;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> loginUsingGoogle() async {
    try {
      sharedPreferences = await initSp();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      String accessToken = googleSignInAuthentication.accessToken;
      String idToken = googleSignInAuthentication.idToken;
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: idToken, accessToken: accessToken);
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(authCredential);

      String userId = authResult.user.uid;
      print(userId);
      sharedPreferences.setString('userId', userId);
      sharedPreferences.setBool('isLogin', true);

      if (authResult.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    sharedPreferences = await initSp();
    sharedPreferences.setBool('isLogin', false);
    sharedPreferences.setString('userId', '');
    firebaseAuth.signOut();
  }
}

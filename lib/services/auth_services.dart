part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;

  static Future<void> signUp() async {
    await Firebase.initializeApp();

    String msg = "";
    return msg;
  }
}

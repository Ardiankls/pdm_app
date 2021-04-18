part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;
}

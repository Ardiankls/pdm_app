part of 'services.dart';

class ProjectServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static CollectionReference projectCollection =
      FirebaseFirestore.instance.collection("projects");
  static DocumentReference projectDocument;

  static Future<bool> addProject(Projects projects) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    projectDocument = await projectCollection.add({
      'projectId': projects.projectId,
      'projectTitle': projects.projectTitle,
      // 'projectDate': projects.projectDate,
      'projectMusic': projects.projectMusic,
      'projectDrive': projects.projectDrive,
      'projectStatus': projects.projectStatus,
      'addBy': auth.currentUser.uid,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

    if (projectDocument != null) {
      projectCollection.doc(projectDocument.id).update({
        'projectId': projectDocument.id,
      });
      return true;
    } else {
      return false;
    }
  }
}

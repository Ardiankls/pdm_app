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
      'projectDate': projects.projectDate,
      'projectDesc': projects.projectDesc,
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

  static Future<String> updateStatus(Projects projects) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg;
    await projectCollection.doc(projects.projectId).update({
      'projectStatus': 'Finished',
      'updatedAt': dateNow,
    }).then((value) {
      msg = "success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }

  static Future<bool> deleteProject(Projects projects) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await projectCollection.doc(projects.projectId).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });
    return hsl;
  }
}

part of 'pages.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference projectCollection =
      FirebaseFirestore.instance.collection("projects");

  static FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Widget allList() {
    return ListView(
      children: [
        SingleChildScrollView(
          child: StreamBuilder(
            stream: projectCollection.snapshots(),
            builder:
                (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Failed to load data");
              }
              if (!snapshot.hasData) {
                return Text("Currently There is No Video Projects");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return new Column(
                children: snapshot.data.docs.map((DocumentSnapshot doc) {
                  Projects projects = new Projects(
                    doc.data()['projectId'],
                    doc.data()['projectTitle'],
                    doc.data()['projectDate'],
                    doc.data()['projectDesc'],
                    doc.data()['projectMusic'],
                    doc.data()['projectDrive'],
                    doc.data()['projectBy'],
                    doc.data()['projectStatus'],
                    doc.data()['createdAt'],
                    doc.data()['updateddAt'],
                  );
                  return ProjectCard(projects: projects);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget onGoingList() {
    return ListView(
      children: [
        SingleChildScrollView(
          child: StreamBuilder(
            stream: projectCollection
                .where('projectStatus', isEqualTo: 'OnGoing')
                .snapshots(),
            builder:
                (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Failed to load data");
              }
              if (!snapshot.hasData) {
                return Text("Currently There is No Video Projects");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return new Column(
                children: snapshot.data.docs.map((DocumentSnapshot doc) {
                  Projects projects = new Projects(
                    doc.data()['projectId'],
                    doc.data()['projectTitle'],
                    doc.data()['projectDate'],
                    doc.data()['projectDesc'],
                    doc.data()['projectMusic'],
                    doc.data()['projectDrive'],
                    doc.data()['projectBy'],
                    doc.data()['projectStatus'],
                    doc.data()['createdAt'],
                    doc.data()['updateddAt'],
                  );
                  return ProjectCard(projects: projects);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget finishedList() {
    return ListView(
      children: [
        SingleChildScrollView(
          child: StreamBuilder(
            stream: projectCollection
                .where('projectStatus', isEqualTo: 'Finished')
                .snapshots(),
            builder:
                (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Failed to load data");
              }
              if (!snapshot.hasData) {
                return Text("Currently There is No Video Projects");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return new Column(
                children: snapshot.data.docs.map((DocumentSnapshot doc) {
                  Projects projects = new Projects(
                    doc.data()['projectId'],
                    doc.data()['projectTitle'],
                    doc.data()['projectDate'],
                    doc.data()['projectDesc'],
                    doc.data()['projectMusic'],
                    doc.data()['projectDrive'],
                    doc.data()['projectBy'],
                    doc.data()['projectStatus'],
                    doc.data()['createdAt'],
                    doc.data()['updateddAt'],
                  );
                  return ProjectCard(projects: projects);
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  // int a =

  Future<void> getUser() async {
    await Firebase.initializeApp();
    String uid = auth.currentUser.uid;
    await userCollection.doc(uid).get().then((value) {
      setState(() {
        name = value['name'];
      });
    });
  }

  String name;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF161E29),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                        child: IconButton(
                          icon: const Icon(Icons.person_rounded, size: 40),
                          color: Color(0xFF7041FF),
                          onPressed: () {
                            Navigator.pushNamed(context, Profile.routeName);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              ['val'],
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Welcome Back',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Create.routeName);
                              },
                              child: Text(
                                '+Create Project',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF7041FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TabBar(
                      indicatorColor: Color(0xFF7041FF),
                      tabs: [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "On Going",
                        ),
                        Tab(
                          text: "Finished",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        allList(),
                        onGoingList(),
                        finishedList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

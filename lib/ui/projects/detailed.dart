part of '../pages/pages.dart';

class Detailed extends StatefulWidget {
  @override
  _DetailedState createState() => _DetailedState();
  static String routeName = "/detailed";
}

String proId;
String proTitle;
String proDesc;
String proDate;
String proMusic;
String proDrive;
String proStatus;

@override
class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    Projects projects = ModalRoute.of(context).settings.arguments;
    proId = projects.projectId;
    proTitle = projects.projectTitle;
    proDesc = projects.projectDesc;
    proDate = projects.projectDate;
    // proMusic = projects.projectMusic;
    proDrive = projects.projectDrive;
    proStatus = projects.projectStatus;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF161E29),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                child: Stack(
                  children: [
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, size: 40),
                            color: Color(0xFFFFFFFF),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Home.routeName);
                            },
                          ),
                        ),
                      ),
                    ),
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
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Title"),
                                      Text(proTitle),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Desc"),
                                      Text(proDesc),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Date"),
                                      Text(proDate),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Music"),
                                      Text(proMusic == null ? "" : proMusic),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Drive"),
                                      Text(proDrive == null ? "" : proDrive),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Column(
                                    children: [
                                      Text("Stat"),
                                      Text(proStatus),
                                    ],
                                  ),
                                  SizedBox(height: 40),
                                  SizedBox(
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: proStatus == "OnGoing"
                                            ? ElevatedButton(
                                                onPressed: () async {
                                                  await ProjectServices
                                                      .updateStatus(projects);
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          Home.routeName);
                                                },
                                                child: Text("Finish"),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF7041FF),
                                                  shape: StadiumBorder(),
                                                ),
                                              )
                                            : Container()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ))),
    );
  }
}

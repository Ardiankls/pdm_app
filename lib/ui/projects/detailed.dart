part of '../pages/pages.dart';

class Detailed extends StatefulWidget {
  @override
  _DetailedState createState() => _DetailedState();
}

String proId;
String proTitle;
String proDesc;
String proDate;
String proMusic;
String proDrive;
String proStatus;

@override
Widget build(BuildContext context) {
  Projects projects = ModalRoute.of(context).settings.arguments;
  proId = projects.projectId;
  proTitle = projects.projectTitle;
  proDesc = projects.projectDesc;
  proDate = projects.projectDate;
  proDrive = projects.projectDrive;
  proStatus = projects.projectStatus;
}

class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

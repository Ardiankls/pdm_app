part of 'widgets.dart';

class ProjectCard extends StatefulWidget {
  final Projects projects;
  ProjectCard({this.projects});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    Projects project = widget.projects;

    return Card(
      elevation: 0,
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
          ),
          title: Text(
            project.projectTitle,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            maxLines: 1,
            softWrap: true,
          ),
          subtitle: Text(
            "default",
            // project.projectDesc,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            maxLines: 1,
          ),
          trailing: IconButton(
            icon: Icon(CupertinoIcons.trash_circle),
            onPressed: null,
          ),
        ),
      ),
    );
  }
}

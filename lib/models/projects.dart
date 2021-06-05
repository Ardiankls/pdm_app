part of 'models.dart';

class Projects extends Equatable {
  final String projectId;
  final String projectTitle;
  final DateTime projectDate;
  final String projectMusic;
  final String projectDrive;
  final String projectBy;
  final String projectStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Projects(
    this.projectId,
    this.projectTitle,
    this.projectDate,
    this.projectMusic,
    this.projectDrive,
    this.projectBy,
    this.projectStatus,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object> get props => [
        projectId,
        projectTitle,
        projectDate,
        projectMusic,
        projectDrive,
        projectBy,
        createdAt,
        updatedAt
      ];
}

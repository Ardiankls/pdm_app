part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;

  Users(
    this.uid,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object> get props => [
        uid,
        name,
        email,
        password,
        createdAt,
        updatedAt,
      ];
}

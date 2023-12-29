import 'dart:convert';

class User {
  final String userName;
  final String? image;
  final int? finishedExercises;
  final String? userEmail; // Optional
  final String password;

  User({
    required this.userName,
    this.image,
    this.finishedExercises,
    this.userEmail,
    required this.password,
  });

  User copyWith({
    String? userName,
    String? image,
    int? finishedExercises,
    String? userEmail,
    String? password,
  }) {
    return User(
      userName: userName ?? this.userName,
      image: image ?? this.image,
      finishedExercises: finishedExercises ?? this.finishedExercises,
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'image': image,
      'finishedExercises': finishedExercises,
      'userEmail': userEmail,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] as String,
      image: map['image'] as String,
      finishedExercises: map['finishedExercises'] as int,
      userEmail: map['userEmail'] as String?,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userName: $userName, image: $image, finishedExercises: $finishedExercises, userEmail: $userEmail, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.image == image &&
        other.finishedExercises == finishedExercises &&
        other.userEmail == userEmail &&
        other.password == password;
  }

  @override
  int get hashCode =>
      userName.hashCode ^
      image.hashCode ^
      finishedExercises.hashCode ^
      userEmail.hashCode ^
      password.hashCode;
}

class NewUserResponse {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  NewUserResponse(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory NewUserResponse.fromJson(Map<String, dynamic> json) {
    return NewUserResponse(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'] ?? 'First Name',
      lastName: json['lastName'] ?? 'Last Name ',
      avatar: json['avatar'],
    );
  }
}

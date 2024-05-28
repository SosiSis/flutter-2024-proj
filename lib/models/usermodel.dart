class User {
  String id;
  String name;
  String email;
  String password; // Consider security implications of storing passwords

  User({required this.id, required this.name, required this.email, required this.password});

  // Method to update user data
  User copyWith({String? name, String? email, String? password}) {
    return User(
      id: this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
class UserModel {
  String id;
  String email;
  String name;
  String photoUrl;
  String birthDate;
  String cpf;
  String gender;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.birthDate,
    required this.cpf,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      name: data['name'],
      photoUrl: data['photoUrl'],
      birthDate: data['birthDate'],
      cpf: data['cpf'],
      gender: data['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'birthDate': birthDate,
      'cpf': cpf,
      'gender': gender,
    };
  }
}

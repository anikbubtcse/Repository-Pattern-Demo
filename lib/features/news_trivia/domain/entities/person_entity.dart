class PersonEntity {
  final String name;
  final String email;
  final int id;

  PersonEntity({required this.name, required this.email, required this.id});

  factory PersonEntity.fromJson(Map<String, dynamic> json) {
    return PersonEntity(
        name: json['name'], email: json['email'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id};
  }

}

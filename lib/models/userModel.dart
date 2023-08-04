class UserModel {
  final String name;
  final String email;
  String image =
      'https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg';
  UserModel(
      {required this.name,
      required this.email,
      this.image =
          'https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg'});
  factory UserModel.fromJson(json) {
    return UserModel(
        name: json['name'], email: json['email'], image: json['image']);
  }

  Map<String, dynamic> toJson() =>
      {'image': image, 'name': name, 'email': email};
}

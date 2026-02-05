class UserModel {
  ///collection name
  static const String collectionName = 'users';

  ///attributes
  String name, email, id;
  bool? isDark;

  ///constructor
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.isDark,
  });

  /// object => json
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id, 'isDark': isDark};
  }

  /// json => object
  UserModel.fromJson(data)
    : this(
        name: data['name'],
        email: data['email'],
        id: data['id'],
        isDark: data['isDark'],
      );
}

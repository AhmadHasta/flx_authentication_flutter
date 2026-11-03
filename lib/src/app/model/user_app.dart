import 'package:flx_authentication_flutter/src/app/model/user.dart';

class UserApp extends User {
  UserApp({
    required super.id,
    required this.nip,
    required super.name,
    required this.role,
  });

  factory UserApp.fromJson(Map<String, dynamic> json) {
    final nip = (json['nip'] ?? json['username'] ?? '').toString();
    final rawId = json['id'] ?? json['user_id'];
    final id = rawId is int
        ? rawId
        : (int.tryParse(rawId?.toString() ?? '0') ?? 0);
    final name = (json['name'] ?? '').toString();
    final role = (json['role'] ?? json['structure_id'] ?? '').toString();
    return UserApp(
      nip: nip,
      id: id,
      name: name,
      role: role,
    );
  }

  final String nip;
  final String role;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nip': nip,
      'name': name,
      'role': role,
    };
  }
}

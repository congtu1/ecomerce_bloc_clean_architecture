import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? remember_token;
  final String? created_at;
  final String? updated_at;

  const User(
      {required this.id,
      this.name,
      this.email,
      this.password,
      this.remember_token,
      this.created_at,
      this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, email, password, remember_token, created_at, updated_at];

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: -1);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
}

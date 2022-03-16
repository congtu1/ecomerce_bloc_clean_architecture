abstract class AuthRepository {
  Future<void> signIn(dynamic data);
  Future<void> register(dynamic data);
  Future<void> signOut();
}

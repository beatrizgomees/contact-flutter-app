abstract class AuthService{

  Future<void> signInWithEmailAndPassword({required String email, required String password});

  Future<void> createUserWithEmailAndPassword({required String email, required String password});

  Future<void> signOut();
}
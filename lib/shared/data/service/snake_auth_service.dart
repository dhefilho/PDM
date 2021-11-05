import 'package:firebase_auth/firebase_auth.dart';

class IAuth {
  Future<String> login(String email, String senha) async {}
  Future<String> cadastro(String email, String senha) async {}
}

class SnakeAuthService implements IAuth {
  @override
  Future<String> cadastro(String email, String senha) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);

      print(userCredential.user.uid);
      return 'usuário cadastrado com sucesso';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'Nenhum usuário encontrado';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Senha errada';
      } else if (e.code == 'email-already-in-use') {
        return 'Esse e-mail já está sendo usado';
        ;
      } else {
        return e.code;
      }
    }
  }

  @override
  Future<String> login(String email, String senha) async {
    print('sss');
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);
      print(userCredential.user.uid);
      return 'login com sucesso';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
    }
  }
}

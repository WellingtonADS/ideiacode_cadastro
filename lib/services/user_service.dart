import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String id) async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
    return doc.exists ? UserModel.fromMap(doc.data() as Map<String, dynamic>) : null;
  }
}

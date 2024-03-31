import 'package:teachers_app/models/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  late DocumentReference<Map<String, dynamic>> _studentDocument;
  late String _uid;

  DatabaseServices(String uid) {
    _uid = uid;
    _studentDocument =
        FirebaseFirestore.instance.collection('students').doc(uid);
  }

  Future<UserModel?> getStudentInfo() async {
    final studentInfoDocSnapshot = await _studentDocument.get();

    if (studentInfoDocSnapshot.exists) {
      final data = studentInfoDocSnapshot.data();
      if (data == null) return null;
      return UserModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future<void> setData(UserModel userModel) async {
    userModel.uid = _uid;
    await _studentDocument.set(userModel.toJson());
  }

  Future<void> updateImageUrl(String url) async {
    await _studentDocument.update({'profilePictureUrl': url});
  }

  Future<UserModel?> updateDocument(UserModel userModel) async {
    await _studentDocument.update(userModel.toJson());
    return await getStudentInfo();
  }

  void setUser(String uid) {
    if (uid != _uid) {
      _studentDocument =
          FirebaseFirestore.instance.collection('students').doc(uid);
    }
  }
}

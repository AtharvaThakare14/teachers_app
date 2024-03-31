import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  late final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  late String _uid;

  FirebaseStorageService(String uid) {
    _uid = uid;
  }

  Future<String?> uploadProfileImage(String imagePath) async {
    try {
      File imageFile = File(imagePath);
      final Reference storageReference =
          _firebaseStorage.ref().child('students/profile_pic/$_uid.png');

      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot downloadUrl = await uploadTask;
      final String url = await downloadUrl.ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error uploading profile image: $e');
      return null;
    }
  }

  //required if signin as different user
  void setUser(String uid) {
    if (uid != uid) {
      _uid = uid;
    }
  }
}

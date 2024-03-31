import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachers_app/models/user_info_model.dart';
import 'package:teachers_app/utilis.dart';
import 'package:teachers_app/controller/auth_controller.dart';
import 'package:teachers_app/services/database_service.dart';
import 'package:teachers_app/services/storage_services.dart';

class UserInfoController extends ChangeNotifier {
  late final DatabaseServices _databaseServices;
  late final FirebaseStorageService _storageServices;

  UserModel? _userInfo;
  bool isLoading = false;

  UserInfoController(DatabaseServices databaseServices,
      FirebaseStorageService firebaseStorageService) {
    _databaseServices = databaseServices;
    _storageServices = firebaseStorageService;
  }

  UserModel? get userInfo => _userInfo;
  set changeUserInfo(UserModel value) {
    _userInfo = value;
    notifyListeners();
  }

  Future<UserModel?> fetchUserInfo({required BuildContext context}) async {
    try {
      _userInfo = await _databaseServices.getStudentInfo();
      return _userInfo;
    } catch (error) {
      print(error);
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
    }
    return null;
  }

  Future<void> setUserInfo(bool mounted,
      {required BuildContext context, required UserModel userInfo}) async {
    try {
      isLoading = true;
      notifyListeners();
      userInfo.emailAddress =
          Provider.of<AuthController>(context, listen: false).user?.email;

      await _databaseServices.setData(userInfo);
      if (!mounted) return;
      _userInfo = await fetchUserInfo(context: context);
    } catch (error) {
      print("printing error$error");
      Utils.showSnackBar(
          context, Utils.errorSnackBar(message: error.toString()));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> uploadImage(
      {required BuildContext context,
      required String imagePath,
      bool shouldUpdate = false}) async {
    try {
      isLoading = true;
      notifyListeners();
      String? imageUrl = await _storageServices.uploadProfileImage(imagePath);
      if (shouldUpdate) {
        await _databaseServices.updateImageUrl(imageUrl!);
      }
      return imageUrl;
    } catch (error) {
      debugPrint("printing error$error");
      Utils.showSnackBar(
        context,
        Utils.errorSnackBar(message: error.toString()),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return null;
  }

  Future<void> updateDocument({
    required BuildContext context,
    required UserModel userInfo,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      _userInfo = await _databaseServices.updateDocument(userInfo);
    } catch (error) {
      debugPrint("printing error$error");
      Utils.showSnackBar(
        context,
        Utils.errorSnackBar(message: error.toString()),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:intl/intl.dart';

class UserModel {
  String? uid;
  String? emailAddress;
  String? password;
  String? profilePictureUrl;
  String? firstName;
  String? lastName;
  String? middleName;
  String? collegeId;
  String? dob;
  String? bloodGroup;
  String? phoneNumber;
  String? degree;
  String? branch;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? userType;
  bool? isVerified;

  UserModel({
    this.uid,
    this.emailAddress,
    this.password,
    this.profilePictureUrl,
    this.firstName,
    this.lastName,
    this.middleName,
    this.collegeId,
    this.dob,
    this.bloodGroup,
    this.phoneNumber,
    this.degree,
    this.branch,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.userType = "Student",
    this.isVerified = false,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    profilePictureUrl = json['profilePictureUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    collegeId = json['collegeId'];
    dob = DateFormat('yyyy-MM-dd').format(json['dob'].toDate());
    bloodGroup = json['bloodGroup'];
    phoneNumber = json['phoneNumber'];
    degree = json['degree'];
    branch = json['branch'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    userType = json['userType'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['profilePictureUrl'] = profilePictureUrl;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['collegeId'] = collegeId;
    // data['dob'] = Timestamp.fromDate(DateTime.parse(dob!));
    data['bloodGroup'] = bloodGroup;
    data['phoneNumber'] = phoneNumber;
    data['degree'] = degree;
    data['branch'] = branch;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['userType'] = userType;
    data['isVerified'] = isVerified;
    return data;
  }
}

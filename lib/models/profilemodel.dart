// app/modules/profile/models/profile_model.dart
class ProfileModel {
  final String memberNo;
  final String memberName;
  final String registrationDate;
  final String division;
  final String subDivision;
  final String empNo;
  final String designation;

  ProfileModel({
    required this.memberNo,
    required this.memberName,
    required this.registrationDate,
    required this.division,
    required this.subDivision,
    required this.empNo,
    required this.designation,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      memberNo: json['memberNo'] ?? '',
      memberName: json['memberName'] ?? '',
      registrationDate: json['registrationDate'] ?? '',
      division: json['division'] ?? '',
      subDivision: json['subDivision'] ?? '',
      empNo: json['empNo'] ?? '',
      designation: json['designation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberNo': memberNo,
      'memberName': memberName,
      'registrationDate': registrationDate,
      'division': division,
      'subDivision': subDivision,
      'empNo': empNo,
      'designation': designation,
    };
  }


}

extension ProfileModelCopyWith on ProfileModel {
  ProfileModel copyWith({
    String? memberNo,
    String? memberName,
    String? registrationDate,
    String? division,
    String? subDivision,
    String? empNo,
    String? designation,
  }) {
    return ProfileModel(
      memberNo: memberNo ?? this.memberNo,
      memberName: memberName ?? this.memberName,
      registrationDate: registrationDate ?? this.registrationDate,
      division: division ?? this.division,
      subDivision: subDivision ?? this.subDivision,
      empNo: empNo ?? this.empNo,
      designation: designation ?? this.designation,
    );
  }
}

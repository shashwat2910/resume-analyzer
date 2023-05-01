class JobModel {
  String companyName;
  String location;
  String ctc;
  String jobRole;
  String employement_type;
  JobModel({
    required this.companyName,
    required this.location,
    required this.ctc,
    required this.jobRole,
    required this.employement_type,
  });
  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'location': location,
        'ctc': ctc,
        'jobRole': jobRole,
        'employement_type': employement_type,
      };
}

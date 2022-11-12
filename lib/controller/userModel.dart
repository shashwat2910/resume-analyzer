class UserModel {
  String uuid;
  String first_name;
  var middle_name;
  String last_name;
  String course;
  String primary_specialization;
  String roll_number;
  String joining_year;
  String graduation_year;
  String email;
  String phone_number;
  String current_address;

  UserModel({
    required this.uuid,
    required this.first_name,
    this.middle_name,
    required this.last_name,
    required this.course,
    required this.primary_specialization,
    required this.roll_number,
    required this.joining_year,
    required this.graduation_year,
    required this.email,
    required this.phone_number,
    required this.current_address,
  });

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'first_name' : first_name,
        'middle_name' : middle_name,
        'last_name' : last_name,
        'course' : course,
        'primary_specialization' : primary_specialization,
        'roll_number' : roll_number,
        'joining_year' : joining_year,
        'email' : email,
        'phone_number' : phone_number,
        'current_address' : current_address
      };
}

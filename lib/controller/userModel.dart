class UserModel {
  String uuid;
  String first_name;
  var middle_name;
  String last_name;
  String course;
  String primary_specialization;
  String roll_number;
  int joining_year;
  int graduation_year;
  String email;
  int phone_number;
  String github;
  String linkedin;
  String addressLine1;
  var addressLine2;
  String state;
  String city;
  int postalcode;

  UserModel(
      {required this.uuid,
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
      required this.github,
      required this.linkedin,
      required this.addressLine1,
      this.addressLine2,
      required this.state,
      required this.city,
      required this.postalcode});

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'first_name': first_name,
        'middle_name': middle_name,
        'last_name': last_name,
        'course': course,
        'primary_specialization': primary_specialization,
        'roll_number': roll_number,
        'joining_year': joining_year,
        'email': email,
        'phone_number': phone_number,
        'github': github,
        'linedin': linkedin,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'state': state,
        'city': city,
        'postalcode': postalcode,
      };
}


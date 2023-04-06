import './counsellor_appointments.dart';

class Counsellor{
  String? id;
  String? displayName;
  String? email;
  String? photoUrl;
  String? dob;
  String? gender;
  String? specialisation;
  List<Appointments>? appointments;

  Counsellor({
     this.id,
     this.displayName,
     this.email,
     this.photoUrl,
     this.gender,
    this.specialisation,
    this.dob,
    this.appointments
  });

  Counsellor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    dob = json['dob'];
    gender = json['gender'];
    specialisation = json['specialisation'];
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
  }

  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['displayName']=displayName;
    data['photoUrl'] = photoUrl;
    data['email'] = email;
    data['dob'] = dob;
    data['specialisation']= specialisation;
    data['gender'] = gender;
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Counsellor{id: $id, displayName: $displayName, email: $email, photoUrl: $photoUrl, dob: $dob, gender: $gender, specialisation: $specialisation}';
  }
}
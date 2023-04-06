import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/controllers/user/user_repository.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'package:raabta_fyp/Models/user/user_appointments.dart';
import '../../Models/counsellor/counsellor_model.dart';
import '../../Models/counsellor/counsellor_appointments.dart';
import 'user_repository.dart';

class UserProvider with ChangeNotifier{
  final UserRepository _userRepository= FirebaseUsersRepository();
  UserModel user =UserModel();
  List<Counsellor> counsellors=[];

  Future<UserModel> getUser(String id)async{
    user = await _userRepository.getUser(id);
    notifyListeners();
    return user;
  }
  Future<void>addUser(UserModel user)async{
    await _userRepository.addUser(user);
  }

  Future<void>profileComplete(String dob, String gender, String preference)async{
    user.dateOfBirth=dob;
    user.preference=preference;
    user.gender=gender;
    notifyListeners();
    await _userRepository.addUser(user);
  }

  Future<void> getCounsellors()async{
    counsellors=await _userRepository.getAllCounsellors();
    notifyListeners();
}

  Future<void>editProfile(String fullName, String email, String preference)async{
    user.fullName=fullName;
    user.preference=preference;
    user.email=email;
    notifyListeners();
    await _userRepository.addUser(user);

  }
  Future<void>getAppointments()async{
    user=await getUser(user.id!);
    notifyListeners();
  }

  Future<void>createAppointment(UserAppointments u_appointment)async{
    user.appointments!.add(u_appointment);
    notifyListeners();
    await _userRepository.createAppointment(user);
  }

Future <void> setAppointment(Counsellor counsellor, Appointments c_appointment)async{
    counsellor.appointments!.add(c_appointment);
    await _userRepository.setAppointment(counsellor);
}

}


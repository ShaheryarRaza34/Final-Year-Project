import 'package:flutter/material.dart';
import '../controllers/user/user_provider.dart';
import 'package:raabta_fyp/User/personality_test.dart';
import 'package:raabta_fyp/User/profile_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'home_user.dart';


import 'navbar_user.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/RaabtaLogo.png"),
                  height: 150,
                  width: 150,
                ),
                const Image(
                  image: AssetImage("assets/images/Cover.png"),
                  // height: 200,
                  // width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 18.0),
                  child: Text("Welcome!\nStart your journey", style: TextStyle(fontSize: 20 ),textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: ElevatedButton(
                    onPressed: ()async {
                      _googleSignIn.signOut();
                      final GoogleSignInAccount? user = await _googleSignIn.signIn();

                      final  GoogleSignInAuthentication? authentication = await user?.authentication;
                      if(authentication?.accessToken!=null && authentication?.idToken!=null) {
                        final credential = GoogleAuthProvider.credential(
                          accessToken: authentication?.accessToken,
                          idToken: authentication?.idToken,
                        );
                        UserCredential userCredential =
                            await _auth.signInWithCredential((credential));
                        if(userCredential.user != null){
                          if(userCredential.additionalUserInfo!.isNewUser){
                            await context.read<UserProvider>().addUser( UserModel(id: user!.id, fullName: user.displayName, email: user.email, photoUrl: user.photoUrl, dateOfBirth: null, gender: null, preference: null,appointments: []));
                            await context.read<UserProvider>().getUser(user!.id);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const ProfileUser()));
                            await _googleSignIn.signOut();
                          }
                          else{
                            await context.read<UserProvider>().getUser(user!.id);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const NavBarUser()));
                            _googleSignIn.signOut();
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFFFFF),
                      minimumSize: const Size(100, 50),
                      side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Sign In with ",
                          style: TextStyle(fontSize: 22, color: Color(0xff006A6A)),
                        ),
                        Image(
                          image: AssetImage("assets/images/googleLogo.png"),
                          height: 38,
                          //width: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


}

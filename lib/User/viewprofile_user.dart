import 'package:flutter/material.dart';
import 'package:raabta_fyp/User/editprofile_user.dart';

class ViewprofileUser extends StatefulWidget {
  const ViewprofileUser({Key? key}) : super(key: key);

  @override
  State<ViewprofileUser> createState() => _ViewprofileUserState();
}

class _ViewprofileUserState extends State<ViewprofileUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0),
                child: Image.asset(
                  "assets/images/ProfileHeading.png",
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0),
                child: Image.asset(
                  "assets/images/ProfilePic.png",
                  // width: 150,
                  // height: 180,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 6.0, top: 10),
                  child: Text("Patient 1", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),)
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 10.0),
                  child: Text("Anxiety", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ViewprofileCounsellor()));
                    //
                  },
                  child: Text("View Personality Test", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xff006A6A)),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFFFFF),
                    minimumSize: Size(300, 50),
                    side: BorderSide(width: 1, color: Color(0xff006A6A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EditprofileUser()));
                          //
                        },
                        child: Text("EDIT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff006A6A),
                          minimumSize: Size(120, 50),
                          // side: BorderSide(
                          //     width: 1,
                          //     color: Color(0xff100D57)
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => ViewprofileCounsellor()));
                          // //
                        },
                        child: Text("LOGOUT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF93535),
                          minimumSize: Size(120, 50),
                          // side: BorderSide(width: 1, color: Color(0xff006A6A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

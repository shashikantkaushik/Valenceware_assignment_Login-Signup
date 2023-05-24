

import 'package:flutter/material.dart';
import 'package:valenceware_assignment/user_model.dart';
import 'package:provider/provider.dart';
import 'package:valenceware_assignment/auth.dart';
import 'package:valenceware_assignment/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:valenceware_assignment/auth.dart';
import 'package:valenceware_assignment/home_screen.dart';
import 'package:valenceware_assignment/register.dart';
import 'package:valenceware_assignment/button.dart';
import 'package:provider/provider.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {

  final nameController = TextEditingController();
  final addController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addController.dispose();
    dobController.dispose();
  }

  // for selecting image


  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple.shade50,
                        ),
                        child: Image.asset(
                          "assets/image1.png",
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            // name field
                            SizedBox(
                              height: 20,
                            ),
                            TextField(

                              decoration: InputDecoration(
                                hintText: "Enter Your Name",
                                icon: Icon(Icons.account_box_rounded, color: Color(0xFFC5C6d0),
                                size: 30),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              controller: nameController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // email
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Delhi",
                                icon: Icon(Icons.location_on, color: Color(0xFFC5C6d0),
                                    size: 30),
                              ),
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              controller: addController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // bio
                            TextField(
                              decoration: InputDecoration(
                                hintText: "31-02-2002",
                                icon: Icon(Icons.date_range_outlined, color: Color(0xFFC5C6d0),
                                    size: 30),
                              ),
                              keyboardType: TextInputType.datetime,
                              maxLines: 1,
                              controller: dobController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () => storeData(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Color(0xFF189AB4),
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFF1F5F5FF),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,

        ),
      ),
    );
  }

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      add: addController.text.trim(),
      dob: dobController.text.trim(),

      createdAt: "",
      phoneNumber: "",
      uid: "",

    );

      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,

        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
    }
  }


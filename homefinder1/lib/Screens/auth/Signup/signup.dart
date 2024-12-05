import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/SignIn/signin.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';
import 'package:homefinder1/Screens/auth/Signup/controller/signup_controller.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../../../utilities/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue ?? true;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {



    return GetBuilder(
        init: SignUpController(),
        builder: (SignUpController controller) {
          return Scaffold(
              body: SafeArea(
            child: Container(
              color: const Color(0xffFFFFFF),
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                  child: Center(
                child: Form(
                  key: controller.formkey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 240,
                              child: Image.asset(
                                'lib/assets/images/logo-white.png',

                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text("  Home Finder",
                                  style: TextStyle(
                                      color:kDarkBlueColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont)),
                            ),
                          ],
                        ),

                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 110.0,
                              ),
                              child: Text(
                                "     by creating a free account",
                                style: TextStyle(color: Color(0xff252525)),
                              ),
                            ),
                          ],
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.usernameController,
                          validator: (e){
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textfieldHint: "User Name",
                          textfieldIcon: const Image(
                            image:
                                AssetImage("lib/assets/images/ProfileIcon.png"),
                          ),
                          ispasswordField: false,
                          obscureText: false,
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.emailaddressController,
                          validator: controller.emailValidator,
                          keyboardType: TextInputType.emailAddress,
                          textfieldHint: "EmailAddress",
                          textfieldIcon: const Image(
                            image:
                                AssetImage("lib/assets/images/MessageIcon.png"),
                          ),
                          ispasswordField: false,
                          obscureText: false,
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.passwordController,
                          validator: controller.passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          textfieldHint: "Password",
                          textfieldIcon: const Image(
                            image: AssetImage("lib/assets/images/LockIcon.png"),
                          ),
                          ispasswordField: true,
                          obscureText:  !controller.passwordVisible1,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              controller.passwordVisible1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                controller.passwordVisible1 = !controller.passwordVisible1;
                              });
                            },
                          ),
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.confirmPasswordController,
                          validator: controller.confirmValidator,
                          keyboardType: TextInputType.visiblePassword,
                          textfieldHint: "Confirm Password",
                          textfieldIcon: const Image(
                            image: AssetImage("lib/assets/images/LockIcon.png"),
                          ),
                          ispasswordField: true,
                          obscureText:  !controller.passwordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              controller.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                controller.passwordVisible = !controller.passwordVisible;
                              });
                            },
                          ),
                        ),
                          SizedBox(height: 30,),
                        SizedBox(
                          height: 55,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formkey.currentState!.validate()) {
                                controller.registerWithEmail(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff6C63FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.navigate_next,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                "Already a member?"),
                            TextButton(
                              onPressed: () { Get.to(()=>const SignIn()); },
                              child: const Text(
                                "Log In",
                                style: TextStyle(color: Color(0xff6C63FF)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          ));
        });
  }
}

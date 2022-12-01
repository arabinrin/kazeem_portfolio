import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kazeem_portfolio/controller/auth_repository.dart';
import 'package:kazeem_portfolio/utils/text_style.dart';
import 'package:kazeem_portfolio/widgets/button.dart';
import 'package:kazeem_portfolio/widgets/custom_textfield.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
class EmailSignIn extends StatefulWidget {
  EmailSignIn({Key? key}) : super(key: key);

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController phone = TextEditingController();

  bool _loadingState = false;
  final authrepository = AuthRepository();

  final _formKey = GlobalKey<FormState>();

  bool check = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
          body: Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 30.h),
             
                SizedBox(height: 20.h),
                Text('Create Your Account',
                    style:headerTextStyle),
                SizedBox(height: 30.h),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      
                      CustomFormField(
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (!regex.hasMatch(value!)) {
                            return 'Invalid email address';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        label: '',
                        icon: const Icon(Icons.email_rounded),
                        hint: 'funica@mail.com',
                      ),
                      CustomFormField(
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'Password cannot be less than 8 characters';
                            } else {
                              return null;
                            }
                          },
                          isObscure: obscure,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          label: '',
                          icon: const Icon(
                            Icons.lock,
                          ),
                          sufIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: obscure
                                ? const Icon(
                                    Icons.remove_red_eye,
                                  )
                                : const Icon(Icons.hide_image),
                          ),
                          hint: 'Password'),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              activeColor: color.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: check,
                              onChanged: (bool? checked) {
                                setState(() {
                                  check = checked!;
                                });
                              }),
                          Text('Remember me',
                              style: bodyTextStyle,
                              ),],
                        
                      ),
                      SizedBox(height: 20.h),
                      if (!_loadingState)
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _loadingState = true;
                              });
                              await Future.value(
                                authrepository.createWithEmailAndPwd(
                                  emailController.text.trim(),
                                  passwordController.text,
                                  context,
                                  // fullName.text.trim().split(' ')[0],
                                  // fullName.text.trim().split(' ')[1],
                                  // phone.text,
                                ),
                              );
                              setState(() {
                                _loadingState = false;
                              });
                            }
                          },
                          child: Button(
                              title: 'Sign up',
                              color: color.primaryColor,
                              textcolor: color.backgroundColor),
                        ),
                     
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(height: 20.h),
                
                SizedBox(height: 20.h),
                
              ]),
            ),
          ),),
    );
  }
}

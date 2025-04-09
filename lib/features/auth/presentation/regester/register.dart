import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:e_commerce_app/core/resources/values_manager.dart';
import 'package:e_commerce_app/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widget/main_text_field.dart';
import 'package:e_commerce_app/core/widget/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  var nameController = TextEditingController(text: 'Ahmed Ali');
  var emailController = TextEditingController(text: 'ahmedali@gmail.com');
  var phoneController = TextEditingController(text: '0123456789');
  var passwordController = TextEditingController(text: '12345678');
  var rePasswordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p28),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.s65,
                  ),
                  Center(
                      child: Image.asset(ImageAssets.routeLogo,
                          height: AppSize.s90)),
                  SizedBox(
                    height: AppSize.s50,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.person,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'Full Name',
                    label: 'enter your full name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'Enter your mobile number.',
                    label: 'Mobile Number',
                    textInputType: TextInputType.phone,
                    validation: AppValidators.validateFullName,
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.email,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'enter your email address',
                    label: 'E-mail address',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateFullName,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'enter your password',
                    isObscured: true,
                    label: 'Password',
                    textInputType: TextInputType.text,
                    validation: AppValidators.validateFullName,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.password,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'enter rePassword',
                    isObscured: true,
                    label: 'rePassword',
                    textInputType: TextInputType.text,
                    validation: AppValidators.validateFullName,
                    controller: rePasswordController,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomElevatedButton(
                    label: 'Sign up',
                    onTap: () {},
                    backgroundColor: ColorManager.white,
                    radius: 20,
                    isStadiumBorder: false,
                    textStyle: getBoldStyle(
                        color: ColorManager.primaryDark, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Or SingIn',
                              style: getBoldStyle(
                                  color: ColorManager.white, fontSize: 15.sp)))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

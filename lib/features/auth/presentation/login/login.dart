import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:e_commerce_app/core/resources/values_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widget/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s65,
                  ),
                  Center(
                      child: Image.asset(ImageAssets.routeLogo,
                          height: AppSize.s90)),
                  SizedBox(
                    height: AppSize.s90,
                  ),
                  Text(
                    'Welcome Back to Route.',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: AppSize.s24),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: AppSize.s16),
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
                    hint: 'E_mail Address',
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorManager.primaryDark,
                    ),
                    hint: 'Enter your Password',
                    label: 'Password',
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: AppSize.s16),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        isStadiumBorder: false,
                        label: 'Login',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s18),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.mainRoute, (route) => false);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Spacer(),
                      Text(
                        'Don’t have an account?',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: AppSize.s16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUpRoute);
                          },
                          child: Text(
                            'Create Account',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: AppSize.s16),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:e_commerce_app/core/resources/values_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/core/widget/main_text_field.dart';
import 'package:e_commerce_app/domain/di/di.dart';
import 'package:e_commerce_app/features/auth/presentation/login/cubit/login_states.dart';
import 'package:e_commerce_app/features/auth/presentation/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: 'Error',
              posActionName: 'ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'ok');
        }
      },
      child: Scaffold(
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
                      controller: viewModel.emailController,
                      textInputType: TextInputType.emailAddress,
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
                      controller: viewModel.passwordController,
                      textInputType: TextInputType.text,
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
                              color: ColorManager.primary,
                              fontSize: AppSize.s18),
                          onTap: () {
                            viewModel.login();
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, Routes.mainRoute, (route) => false);
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
          )),
    );
  }
}

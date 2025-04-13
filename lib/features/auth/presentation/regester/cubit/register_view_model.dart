import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/auth/presentation/regester/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController(text:'Ahmed');
  var emailController = TextEditingController(text: 'ahmedali777@gmail.com' );
  var phoneController = TextEditingController(text:'01212121212' );
  var passwordController = TextEditingController(text:'123456789' );
  var rePasswordController = TextEditingController(text: '123456789' );

  //todo : hold data handel logic
  void register() async{
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(nameController.text, emailController.text, passwordController.text, rePasswordController.text, phoneController.text);
    either.fold((error){
       emit(RegisterErrorState(failures: error));
    }, (response){
        emit(RegisterSuccessState(responseEntity: response));
    });
  }
}

import 'package:chat_app_fb/pages/sign_in/controller.dart';
import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:get/get.dart';

class SignInBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SignInController>(()=>SignInController());
  }

}
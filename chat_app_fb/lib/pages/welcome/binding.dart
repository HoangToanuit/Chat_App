import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:get/get.dart';

class WelcomeBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut<WelcomeController>(()=>WelcomeController());
  }

}
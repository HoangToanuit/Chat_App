import 'package:chat_app_fb/pages/contact/controller.dart';
import 'package:chat_app_fb/pages/sign_in/controller.dart';
import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:get/get.dart';

class ContactBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ContactController>(()=>ContactController());
  }

}
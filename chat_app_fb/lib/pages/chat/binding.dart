import 'package:chat_app_fb/pages/application/controller.dart';
import 'package:chat_app_fb/pages/chat/controller.dart';
import 'package:chat_app_fb/pages/sign_in/controller.dart';
import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:get/get.dart';

import '../contact/controller.dart';

class ChatBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ChatController>(()=>ChatController());

  }

}
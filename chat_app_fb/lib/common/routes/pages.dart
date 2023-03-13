import 'package:chat_app_fb/common/middlewares/router_welcome.dart';
import 'package:chat_app_fb/common/routes/names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../pages/application/binding.dart';
import '../../pages/application/view.dart';
import '../../pages/chat/binding.dart';
import '../../pages/chat/view.dart';
import '../../pages/contact/binding.dart';
import '../../pages/contact/view.dart';
import '../../pages/sign_in/binding.dart';
import '../../pages/sign_in/view.dart';
import '../../pages/welcome/index.dart';

class AppPages{

  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();

  static List<String> history =[];

  static final List<GetPage> routes =[

GetPage(
  name: AppRoutes.INITIAL, 
  page: ()=> const WelcomePage(),
  binding: WelcomeBindings(),
  middlewares: [
    RouteWelcomeMiddleware(priority: 1)
  ]
  ),
GetPage(
  name:AppRoutes.SIGN_IN,
  page: ()=> const SignInPage(),
  binding: SignInBindings(),
  ),
GetPage(
  name: AppRoutes.Application,
  page: ()=> const ApplicationPage(),
  binding: ApplicationBindings(),
  ),
GetPage(
  name: AppRoutes.Contact,
  page: ()=> const ContactPage(),
  binding: ContactBindings(),
  ),
GetPage(
  name: AppRoutes.Chat, 
  page: ()=> const ChatPage(),
  binding: ChatBindings(),
  )
  ];
  
}
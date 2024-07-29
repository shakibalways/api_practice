 import 'package:api_call/controller/api_call/mobile_model_list.dart';
import 'package:api_call/view/screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
       home: HomePage(),
     );
   }
 }




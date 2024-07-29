import 'dart:developer';

import 'package:api_call/controller/api_call/mobile_model_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {

  await MobileModel.MobileList();
  const CircularProgressIndicator();

  }, child: const Text("Button")),
      ),
    );
  }
}

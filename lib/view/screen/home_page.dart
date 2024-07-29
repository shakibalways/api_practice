import 'dart:developer';

import 'package:api_call/controller/api_call/mobile_model_list.dart';
import 'package:api_call/model/phone_item_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PhoneItemModel>> futureMobileList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMobileList = ApiService.mobileList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<PhoneItemModel>>(
            future: futureMobileList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Show loading indicator
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Handle errors
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('No data available')); // Handle empty data
              }
              var data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    log("${data[index].data.runtimeType}");
                    return Card(
                      child: Column(
                        children: [
                          Text('Name: ${data[index].id}'),
                          Text('Name: ${data[index].name}'),
                          Text('Name: ${data[index].data?.color}'),
                          Text('Name: ${data[index].data?.capacity}'),
                        ],
                      ),
                    );
                  });
            }));
  }
}
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Future<List<PhoneItemModel>> futureMobileList;
//
//   @override
//   void initState() {
//     super.initState();
//     futureMobileList = ApiService.mobileList();  // Initialize future
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mobile Phones"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<PhoneItemModel>>(
//         future: futureMobileList,  // Use the initialized future
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());  // Show loading indicator
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));  // Handle errors
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data available'));  // Handle empty data
//           }
//
//           // Data is available
//           final mobileList = snapshot.data!;
//
//           return ListView.builder(
//             itemCount: mobileList.length,
//             itemBuilder: (context, index) {
//               final phoneItem = mobileList[index];
//               return Card(
//                 margin: const EdgeInsets.all(8.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('ID: ${phoneItem.id}', style: TextStyle(fontWeight: FontWeight.bold)),
//                       Text('Name: ${phoneItem.name}'),
//                       Text('Color: ${phoneItem.data?.color ?? 'N/A'}'),  // Use null-aware operator
//                       Text('Capacity: ${phoneItem.data?.capacity ?? 'N/A'}'),  // Use null-aware operator
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

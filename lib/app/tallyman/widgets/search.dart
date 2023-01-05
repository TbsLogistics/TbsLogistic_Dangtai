// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
// import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final textController = TextEditingController();
//   var controller = Get.put(TallymanController());
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TallymanController>(
//       init: TallymanController(),
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//           title: const Text("Tìm kiếm danh sách"),
//         ),
//         body: FutureBuilder(
//             future: controller.getListCarDook(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var items = snapshot.data as List<ListTrackingModel>;
//                 return Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                       child: TextField(
//                         controller: textController,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search),
//                           hintText: "Book title",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide(color: Colors.white),
//                           ),
//                         ),
//                         onChanged: (String query) {
//                           final suggestions = items.where((item) {
//                             final bookTitle = item.taixeRe!.tenTaixe;
//                             final input = query.toLowerCase();

//                             return bookTitle!.contains(input);
//                           }).toList();
//                           // print(suggestions);
//                           setState(() {
//                             items = suggestions;
//                           });
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount: items.length,
//                           itemBuilder: (context, index) {
//                             // final book = items[index];
//                             var item = items[index];
//                             return ListTile(
//                               title: Text(item.taixeRe!.tenTaixe.toString()),
//                             );
//                           }),
//                     ),
//                   ],
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.orangeAccent,
//                 ),
//               );
//             }),
//       ),
//     );
//   }

//   // void searchBook(String query) {
//   //   final suggestions = items.where((book) {
//   //     final bookTitle = book.title.toLowerCase();
//   //     final input = query.toLowerCase();
//   //     return bookTitle.contains(input);
//   //   }).toList();
//   //   setState(() {
//   //     books = suggestions;
//   //   });
//   // }
// }

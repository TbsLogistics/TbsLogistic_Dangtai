// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
// import 'package:tbs_logistics_dangtai/app/tallyman/view/tallyman_screen.dart';
// import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
// import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
// import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

// class TallymanPage extends StatefulWidget {
//   const TallymanPage({super.key});

//   @override
//   State<TallymanPage> createState() => _TallymanPageState();
// }

// class _TallymanPageState extends State<TallymanPage> {
//   final String routes = "TALLYMAN_PAGE";
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GetBuilder<TallymanController>(
//       init: TallymanController(),
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Tbs Logistics",
//             style: CustomTextStyle.tilteAppbar,
//           ),
//           centerTitle: true,
//           backgroundColor: CustomColor.backgroundAppbar,
//         ),
//         body: const TallymanScreen(),
//         drawer: Drawer(
//           child: _drawer(controller, size),
//         ),
//       ),
//     );
//   }

//   Widget _drawer(TallymanController controller, Size size) {
//     return Container(
//       decoration: const BoxDecoration(gradient: CustomColor.gradient),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           FutureBuilder(
//             future: controller.getUser(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 var items = snapshot.data;
//                 // print(items);
//                 return SizedBox(
//                   height: size.height * 0.3,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(left: 10),
//                         height: size.height * 0.1,
//                         width: size.width,
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           children: [
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Họ và tên : ${items!["tenNV"]}",
//                                 style: const TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Số điện thoại : ${items["soDienThoai"]}",
//                                 style: const TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Chức vụ : ${items["usernameAccount"]}",
//                                 style: const TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               return Container();
//             },
//           ),
//           ListTile(
//             onTap: () {
//               SharePerApi().postLogout();
//             },
//             leading: const Icon(Icons.logout_rounded),
//             title: const Text(
//               "Đăng xuất",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

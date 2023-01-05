import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/widget/sercurity/custom_list_title_registed.dart';

class SearchTallymanInDock extends SearchDelegate {
  var controller = Get.put(TallymanController());
  @override
  ThemeData appBarTheme(BuildContext context) {
    // ignore: unnecessary_null_comparison
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    // ignore: unnecessary_null_comparison
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        // ignore: deprecated_member_use
        brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : CustomColor.backgroundAppbar,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        // textTheme: theme.textTheme.bodyLarge,
      ),
      hintColor: Colors.white,
      focusColor: Colors.white,
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.4, 0.7],
        ),
      ),
      child: FutureBuilder(
        future: controller.searchTracking1(query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data as List<ListTrackingModel>;
            return ListView.builder(
              // controller: _scrollBottomBarController,
              itemCount: items.length,
              itemBuilder: ((context, index) {
                return CustomListTitleRegisted(
                  stt: "${index + 1}",
                  name: "${items[index].taixeRe!.tenTaixe}",
                  phone: "${items[index].taixeRe!.cCCD}",
                  warehome: "${items[index].phieuvao!.kho}",
                  itemstype: "${items[index].loaihang!.tenLoaiHang}",
                  onTap: () {},
                );
              }),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent.withOpacity(0.4),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.4, 0.7],
        ),
      ),
      child: FutureBuilder(
        future: controller.searchTracking(query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data as List<ListTrackingModel>;
            return ListView.builder(
              // controller: _scrollBottomBarController,
              itemCount: items.length,
              itemBuilder: ((context, index) {
                return CustomListTitleRegisted(
                  onTap: () {},
                  stt: "${index + 1}",
                  name: "${items[index].taixeRe!.tenTaixe}",
                  phone: "${items[index].taixeRe!.cCCD}",
                  warehome: "${items[index].phieuvao!.kho}",
                  itemstype: "${items[index].loaihang!.tenLoaiHang}",
                );
              }),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent.withOpacity(0.4),
            ),
          );
        }),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomSearchDelegate extends SearchDelegate {
//   // Demo list to show querying
//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];

//   // first overwrite to
//   // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }

//   // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }

//   // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   // last overwrite to show the
//   // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }

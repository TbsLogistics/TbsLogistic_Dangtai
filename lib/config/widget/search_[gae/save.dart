// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// class SearchGo extends StatefulWidget {
//   const SearchGo({super.key});

//   @override
//   State<SearchGo> createState() => _SearchGoState();
// }

// class _SearchGoState extends State<SearchGo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                 height: 100,
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: TypeAheadField(
//                       textFieldConfiguration: TextFieldConfiguration(
//                           autofocus: true,
//                           style: DefaultTextStyle.of(context)
//                               .style
//                               .copyWith(fontStyle: FontStyle.italic),
//                           decoration:
//                               InputDecoration(border: OutlineInputBorder())),
//                       suggestionsCallback: (query) async {
//                         // return await controller.getData(query);
//                       },
//                       itemBuilder: (context, suggestion) {
//                         return ListTile(
//                           leading: Icon(Icons.shopping_cart),
//                           title: Text("${suggestion.tenTaixe}"),
//                           // subtitle: Text('\$${suggestion['price']}'),
//                         );
//                       },
//                       onSuggestionSelected: (suggestion) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             // builder: (context) => LoginScreen()));
//                       },
//                     )),
//                   ],
//                 ),
//               ),
//   }
// }
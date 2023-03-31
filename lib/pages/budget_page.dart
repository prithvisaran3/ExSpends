// import 'package:budget_tracker_ui/json/budget_json.dart';
// import 'package:budget_tracker_ui/json/day_month.dart';
// import 'package:budget_tracker_ui/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
//
// class BudgetPage extends StatefulWidget {
//   @override
//   _BudgetPageState createState() => _BudgetPageState();
// }
//
// class _BudgetPageState extends State<BudgetPage> {
//   int activeDay = 3;
//   var isSelectYear = "2018";
//   var isSelectMonth = "Jan";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       body: getBody(),
//     );
//   }
//
//   Widget getBody() {
//     var size = MediaQuery.of(context).size;
//
//     return Stack(
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.27),
//                 child: Container(
//                   color: background,
//                   child: Column(
//                     children: [
//
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Column(
//                             children: List.generate(budget_json.length, (index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(bottom: 20),
//                                 child: Container(
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                       color: black,
//                                       borderRadius: BorderRadius.circular(12),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: grey.withOpacity(0.01),
//                                           spreadRadius: 10,
//                                           blurRadius: 3,
//                                           // changes position of shadow
//                                         ),
//                                       ]),
//                                   child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 25, right: 25, bottom: 25, top: 25),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           budget_json[index]['name'],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 13,
//                                               color: Color(0xff67727d).withOpacity(0.9)),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Text(
//                                                   budget_json[index]['price'],
//                                                   style: TextStyle(
//                                                       fontWeight: FontWeight.bold,
//                                                       fontSize: 20,
//                                                       color: white
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 8,
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top: 3),
//                                                   child: Text(
//                                                     budget_json[index]['label_percentage'],
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.w500,
//                                                         fontSize: 13,
//                                                         color:
//                                                         primary),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 3),
//                                               child: Text(
//                                                 "\$5000.00",
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 13,
//                                                   color: Color(0xff67727d),),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                         Stack(
//                                           children: [
//                                             Container(
//                                               width: (size.width - 40),
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(5),
//                                                   color: Color(0xff67727d).withOpacity(0.4)),
//                                             ),
//                                             Container(
//                                               width: (size.width - 40) *
//                                                   budget_json[index]['percentage'],
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(5),
//                                                   color: primary),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             })),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(color: black, boxShadow: [
//                 BoxShadow(
//                   color: grey.withOpacity(0.01),
//                   spreadRadius: 10,
//                   blurRadius: 3,
//                   // changes position of shadow
//                 ),
//               ]),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 50, right: 20, left: 20, bottom: 25),
//                 child: Column(
//                   children: [
//                     Text(
//                       "BUDGET",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: primary),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       child: ListView.builder(
//                         itemCount: 12,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 activeDay = index;
//                                 isSelectMonth = months[index]['day'];
//                               });
//                             },
//                             child: Container(
//                               width:
//                               (MediaQuery.of(context).size.width - 40) / 6,
//                               child: Column(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         isSelectYear = months[index]['label'];
//                                         print(
//                                             "Selected Year is : ${isSelectYear} Selected Month is : ${isSelectMonth}");
//                                       });
//                                     },
//                                     child: Text(
//                                       months[index]['label'],
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           color: isSelectYear ==
//                                               months[index]['label']
//                                               ? primary
//                                               : white),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         color: activeDay == index
//                                             ? primary
//                                             : white.withOpacity(0.05),
//                                         borderRadius: BorderRadius.circular(5),
//                                         border: Border.all(
//                                             color: activeDay == index
//                                                 ? primary
//                                                 : white.withOpacity(0.3))),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 12,
//                                           right: 12,
//                                           top: 7,
//                                           bottom: 7),
//                                       child: Text(
//                                         months[index]['day'],
//                                         style: TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w600,
//                                             color: activeDay == index
//                                                 ? black
//                                                 : white),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//       ],
//     );
//   }
// }

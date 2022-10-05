// import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:booking_app/core/utils/local/cache_helper.dart';
//
// class BookingItem extends StatelessWidget {
//   const BookingItem({
//     Key? key,
//     required this.cardColor,
//     required this.color,
//     required this.list,
//   }) : super(key: key);
//
//   final Color cardColor;
//   final Color color;
//   final List list;
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = AppCubit.get(context);
//     return ConditionalBuilder(
//
//       condition: list.isNotEmpty,
//       builder:  (context) =>ListView.separated(
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 130,
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//               color: cardColor,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 1,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Stack(fit: StackFit.expand, children: [
//               Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child: Container(
//                   clipBehavior: Clip.hardEdge,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Image.network(
//                       'http://api.mahmoudtaha.com/images/${list[index].hotel!.hotelImages![0].image!}',
//                       width: 170,
//                       height: 130,
//                       fit: BoxFit.cover),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional.topEnd,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     left: 180,
//                     top: 10,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         list[index].hotel!.name!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: color,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.place_outlined,
//                             color: Colors.grey,
//                           ),
//                           Text(
//                             list[index]
//                                 .hotel!
//                                 .address!,
//
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children:  [
//                           Icon(
//                             Icons.star,
//                             color: Color(0xffFFD700),
//                           ),
//                           Text(
//                             '${list[index].hotel!.rate}',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text.rich(
//                         TextSpan(
//                             text:
//                             ' ${list[index].hotel!.price}',
//                             style: TextStyle(
//                               color: Colors.blueAccent,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             children: const <InlineSpan>[
//                               TextSpan(
//                                 text: '/night',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional.topEnd,
//                 child: Column(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           cubit.updateBooking(
//                               type: 'completed',
//                               bookingId:list[index]
//                                   .id!, token: CacheHelper.getData(key: 'toKen'));
//                         },
//                         icon: const Icon(
//                           FontAwesomeIcons.bookmark,
//                           color: Colors.grey,
//                           size: 20,
//                         )),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     IconButton(
//                         onPressed: () {
//                          cubit.updateBooking(
//                               type: 'cancelled',
//                               bookingId: list[index]
//                                   .id!, token: CacheHelper.getData(key: 'toKen'));
//                         },
//                         icon: const Icon(
//                           FontAwesomeIcons.trashCan,
//                           color: Colors.grey,
//                           size: 20,
//                         )),
//                   ],
//                 ),
//               ),
//             ]),
//           );
//         },
//         separatorBuilder: (context, index) => const SizedBox(
//           height: 20,
//         ),
//         itemCount: list.length,
//       ),
//       fallback: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//
//     );
//   }
// }
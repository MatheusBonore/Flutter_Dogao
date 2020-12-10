// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'package:storage_path/storage_path.dart';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dogao/data/data.dart';

// import 'package:flutter_dogao/models/models.dart';

// import 'package:flutter_dogao/config/palette.dart';

// import 'package:flutter_dogao/screens/screens.dart';

// import 'package:flutter_dogao/widgtes/widgtes.dart';

// class ViewPostScreen extends StatelessWidget {
//   final User currentUser;
//   final Post post;

//   const ViewPostScreen({
//     Key key,
//     @required this.currentUser,
//     @required this.post,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.scaffold,
//       bottomNavigationBar: Transform.translate(
//         offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           child: TextField(
//             maxLines: null,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide(color: Colors.white70),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide(color: Colors.white70),
//               ),
//               contentPadding: const EdgeInsets.all(1.0),
//               hintText: 'Escreva um comentário...',
//               // prefixIcon: Container(
//               //   margin: const EdgeInsets.only(left: 1.0),
//               //   child: ProfileAvatar(
//               //     imageUrl: currentUser.image,
//               //   ),
//               // ),
//               suffixIcon: Container(
//                 margin: const EdgeInsets.only(right: 1.0),
//                 width: 60.0,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
//                     content: const Text('Postar comentario'),
//                   )),
//                   child: Icon(
//                     Icons.send,
//                     size: 25.0,
//                     color: Palette.dogaoRed,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => Navigator.pop(context),
//             ),
//             centerTitle: false,
//             titleSpacing: -5,
//             title: null,
//             // title: PostTop(post: post),
//           ),
//           // SliverToBoxAdapter(
//           //   child: PostImage(post: post, isView: true),
//           // ),
//         ],
//       ),
//     );
//   }
// }

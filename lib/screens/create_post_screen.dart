import 'package:flutter/material.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/widgtes/widgtes.dart';

class CreatePostScreen extends StatelessWidget {
  final List<String> categorias = ['Achado', 'Encontrado', 'Perdido'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: false,
            titleSpacing: 10,
            title: Text(
              "Criar publicação",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                onPressed: () {},
                child: Text(
                  "Publicar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.8,
                    color: Colors.black54,
                  ),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ProfileAvatar(
                    imageUrl: currentUser.imageUrl,
                    isActive: currentUser.online,
                  ),
                ),
                title: Text(
                  currentUser.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Padding(
                padding: MediaQuery.of(context).padding,
                child: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _SimpleMenuDemo extends StatefulWidget {
//   const _SimpleMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

//   final void Function(String value) showInSnackBar;

//   @override
//   _SimpleMenuDemoState createState() => _SimpleMenuDemoState();
// }

// class _SimpleMenuDemoState extends State<_SimpleMenuDemo> {
//   SimpleValue _simpleValue;

//   void showAndSetMenuSelection(BuildContext context, SimpleValue value) {
//     setState(() {
//       _simpleValue = value;
//     });
//     widget.showInSnackBar(
//       GalleryLocalizations.of(context)
//           .demoMenuSelected(simpleValueToString(context, value)),
//     );
//   }

//   String simpleValueToString(BuildContext context, SimpleValue value) => {
//         SimpleValue.one: GalleryLocalizations.of(context).demoMenuItemValueOne,
//         SimpleValue.two: GalleryLocalizations.of(context).demoMenuItemValueTwo,
//         SimpleValue.three:
//             GalleryLocalizations.of(context).demoMenuItemValueThree,
//       }[value];

//   @override
//   void initState() {
//     super.initState();
//     _simpleValue = SimpleValue.two;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<SimpleValue>(
//       padding: EdgeInsets.zero,
//       initialValue: _simpleValue,
//       onSelected: (value) => showAndSetMenuSelection(context, value),
//       child: ListTile(
//         title: Text(
//             GalleryLocalizations.of(context).demoMenuAnItemWithASimpleMenu),
//         subtitle: Text(simpleValueToString(context, _simpleValue)),
//       ),
//       itemBuilder: (context) => <PopupMenuItem<SimpleValue>>[
//         PopupMenuItem<SimpleValue>(
//           value: SimpleValue.one,
//           child: Text(simpleValueToString(
//             context,
//             SimpleValue.one,
//           )),
//         ),
//         PopupMenuItem<SimpleValue>(
//           value: SimpleValue.two,
//           child: Text(simpleValueToString(
//             context,
//             SimpleValue.two,
//           )),
//         ),
//         PopupMenuItem<SimpleValue>(
//           value: SimpleValue.three,
//           child: Text(simpleValueToString(
//             context,
//             SimpleValue.three,
//           )),
//         ),
//       ],
//     );
//   }
// }

// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:flutter_dogao/screens/screens.dart';
// ignore: unused_import
import 'package:flutter_dogao/config/palette.dart';
// ignore: unused_import
import 'package:flutter_dogao/data/data.dart';
// ignore: unused_import
import 'package:flutter_dogao/models/models.dart';
// ignore: unused_import
import 'package:flutter_dogao/widgtes/widgtes.dart';

// ignore: unused_import
import 'package:flutter_svg/svg.dart';
// ignore: unused_import
// import 'package:storage_path/storage_path.dart';

class MenuScreen extends StatefulWidget {
  final Data data;

  const MenuScreen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'Menu',
              style: const TextStyle(
                color: Palette.dogaoDark,
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            elevation: 0.0,
            backgroundColor: Palette.scaffold,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Palette.dogaoDark,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Card(
                    elevation: 0.0,
                    margin: const EdgeInsets.all(4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ProfileAvatar(
                            radius: 25.0,
                            name: widget.data.config.currentUser.name,
                            imageUrl: widget.data.config.currentUser.image,
                          ),
                        ),
                        title: Text(
                          '${widget.data.config.currentUser.name} ${widget.data.config.currentUser.lastName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text('Veja seu perfil'),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    margin: const EdgeInsets.all(4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: expansionTileItens(
                      icon: Icons.help_center_rounded,
                      title: 'Dar feedback',
                      subtitle: 'Ajude-nos a melhorar o ${Palette.name}',
                      children: [
                        listTileItem(
                          icon: Icons.help_center_rounded,
                          title: 'Ajude-nos a melhorar o ${Palette.name}',
                          subtitle:
                              'Dê feedback sobre sua experiência no ${Palette.name}',
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    margin: const EdgeInsets.all(4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: expansionTileItens(
                              icon: Icons.settings,
                              title: 'Configurações',
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: listTileItem(
                                    icon: Icons.settings,
                                    title: 'Configurações',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: listTileItem(
                                    icon: Icons.format_list_bulleted_outlined,
                                    title: 'Registro de Atividade',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: expansionTileItens(
                              icon: Icons.help,
                              title: 'Ajuda e suporte',
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: listTileItem(
                                    icon: Icons.help,
                                    title: 'Central de ajuda',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: listTileItem(
                                    icon: Icons.chat_bubble,
                                    title: 'Comunidade de ajuda',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (widget.data.config.getOutUser() != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(
                                        data: widget.data,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: listTileItem(
                                icon: Icons.exit_to_app,
                                title: 'Sair',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expansionTileItens({
    @required IconData icon,
    @required String title,
    String subtitle,
    List<Widget> children,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: circleAvatarTile(icon: icon),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        children: children,
      ),
    );
  }

  ListTile listTileItem({
    @required IconData icon,
    @required String title,
    String subtitle,
    List<Widget> children,
  }) {
    return ListTile(
      minVerticalPadding: 0,
      leading: circleAvatarTile(
        icon: icon,
        color: Palette.dogaoDark,
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }

  CircleAvatar circleAvatarTile({IconData icon, Color color}) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.grey[200],
      child: Icon(
        icon,
        color: color != null ? color : null,
        size: 30.0,
      ),
    );
  }
}

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

class CategoryListScreen extends StatelessWidget {
  final Species specie;

  const CategoryListScreen({
    Key key,
    @required this.specie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            titleSpacing: -5,
            title: Text(
              Species.hamster == specie
                  ? 'Hamsters'
                  : Species.cat == specie
                      ? 'Gatos'
                      : Species.bunny == specie
                          ? 'Coelhos'
                          : 'Cachorros',
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetFilter(name: 'Doação', selected: false),
                      PetFilter(name: 'Encontrado', selected: true),
                      PetFilter(name: 'Perdido', selected: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PetFilter extends StatelessWidget {
  final String name;
  final bool selected;

  const PetFilter({
    Key key,
    @required this.name,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Palette.dogaoRed : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1.0,
          color: selected ? Colors.transparent : Colors.grey[300],
        ),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Palette.dogaoRed,
            ),
          ),
          selected
              ? Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

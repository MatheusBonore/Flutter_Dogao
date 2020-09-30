import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_dogao/config/palette.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 25.0),
          ),
          SliverToBoxAdapter(
            child: SearchContainer(),
          ),
          SliverToBoxAdapter(
            child: CategoriesContainer(),
          ),
        ],
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Pesquisar pet',
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(
            right: 30,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0, left: 24.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.0, left: 24.0),
            child: Icon(
              Icons.filter_list,
              color: Colors.grey,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesContainer extends StatefulWidget {
  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  final List<List> animalTypes = [
    ['Gatos', FontAwesomeIcons.cat],
    ['Cachorros', FontAwesomeIcons.dog],
    ['Passaros', FontAwesomeIcons.crow],
    ['Peixes', FontAwesomeIcons.fish],
    ['Peixes', FontAwesomeIcons.fish],
    ['Peixes', FontAwesomeIcons.fish],
  ];

  int selectedAnimal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: animalTypes.length,
          itemBuilder: (context, index) {
            final List animal = animalTypes[index];
            return Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: index == animalTypes.length - 1 ? 16.0 : 0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnimal = index;
                      });
                    },
                    child: Material(
                      color: selectedAnimal == index
                          ? Palette.dogaoRed
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          animal[1],
                          size: 30.0,
                          color: selectedAnimal == index
                              ? Colors.white
                              : Colors.black26,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    animal[0],
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 40.0, bottom: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Procurar seu proximo \nmelhor Amigo',
                          style: TextStyle(
                            color: Palette.dogaoDark,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SearchContainer(),
                        ),
                      ],
                    ),
                  ),
                  CategoriesContainer(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doação',
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    width: 200.0,
                    margin: EdgeInsets.only(
                      right: index != null ? 16 : 0,
                      left: index == 0 ? 16 : 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Hero(
                                tag: index,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(pets[0].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 30.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   decoration: BoxDecoration(
                              //     color: Palette.dogaoDoacao.withOpacity(0.5),
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(50),
                              //     ),
                              //   ),
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: 20.0,
                              //     vertical: 4,
                              //   ),
                              //   child: Text(
                              //     'Doação',
                              //     style: TextStyle(
                              //       color: Palette.dogaoDoacao,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 12.0,
                              //     ),
                              //   ),
                              // ),
                              Text(
                                pets[0].name,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey[600],
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Marília',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        fillColor: Colors.grey[100],
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
  ];

  int selectedAnimal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 110.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: animalTypes.length,
          itemBuilder: (context, index) {
            final List animal = animalTypes[index];
            return Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: index == animalTypes.length - 1 ? 15.0 : 18,
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
                          : Colors.grey[100],
                      // elevation: selectedAnimal == index ? 8.0 : 0.0,
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
                  SizedBox(height: 10.0),
                  Text(
                    animal[0],
                    style: TextStyle(
                      color: Colors.black54,
                      // fontSize: 15.0,
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

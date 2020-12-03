import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_dogao/config/palette.dart';

import 'package:flutter_dogao/data/data.dart';

import 'package:flutter_dogao/models/models.dart';

import 'package:flutter_dogao/screens/screens.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 45.0,
                  ),
                  Text(
                    'Dogão',
                    style: const TextStyle(
                      color: Palette.dogaoDark,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: false,
            floating: false,
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(top: 80),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Encontre Seu",
                          style: TextStyle(
                            color: Palette.dogaoDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Adorável animal de estimação",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Pesquisar",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(right: 30),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 24),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[500],
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        CategoryHeader(text: "Categoria Animal de Estimação"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PetCategory(
                          specie: Species.hamster,
                          total: posts
                              .where((p) => p.pet.specie == Species.hamster)
                              .length,
                        ),
                        PetCategory(
                          specie: Species.cat,
                          total: posts
                              .where((p) => p.pet.specie == Species.cat)
                              .length,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PetCategory(
                        specie: Species.bunny,
                        total: posts
                            .where((p) => p.pet.specie == Species.bunny)
                            .length,
                      ),
                      PetCategory(
                        specie: Species.dog,
                        total: posts
                            .where((p) => p.pet.specie == Species.dog)
                            .length,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryHeader(text: "Animal de Estimação mais Novo"),
                ),
                CarouselSlider(
                  height: 400,
                  enableInfiniteScroll: false,
                  items: posts.map((p) {
                    return PetContainer(post: p);
                  }).toList(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryHeader(text: "Animais para Doação"),
                ),
                CarouselSlider(
                  height: 400,
                  enableInfiniteScroll: false,
                  items: posts
                      .where((p) => p.pet.category == Category.donation)
                      .map((p) {
                    return PetContainer(post: p);
                  }).toList(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryHeader(text: "Animais Encontrado"),
                ),
                CarouselSlider(
                  height: 400,
                  enableInfiniteScroll: false,
                  items: posts
                      .where((p) => p.pet.category == Category.find)
                      .map((p) {
                    return PetContainer(post: p);
                  }).toList(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryHeader(text: "Animais Perdidos"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CarouselSlider(
                    height: 400,
                    enableInfiniteScroll: false,
                    items: posts
                        .where((p) => p.pet.category == Category.lost)
                        .map((p) {
                      return PetContainer(post: p);
                    }).toList(),
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

class PetContainer extends StatelessWidget {
  final Post post;

  const PetContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewPetScreen(
                currentUser: currentUser,
                post: post,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: DateTime.now(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.pet.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: post.pet.category == Category.find
                          ? Palette.dogaoAchados
                          : post.pet.category == Category.donation
                              ? Palette.dogaoDoacao
                              : Palette.dogaoRed,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      post.pet.category == Category.find
                          ? "Encontrado"
                          : post.pet.category == Category.donation
                              ? "Doação"
                              : "Perdido",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    post.pet.name,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 18.0,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        post.pet.location,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetCategory extends StatelessWidget {
  final Species specie;
  final int total;

  const PetCategory({
    Key key,
    @required this.specie,
    @required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Palette.dogaoRed,
              Palette.dogaoPink,
            ],
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryListScreen(
                  specie: specie,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Species.hamster == specie
                          ? 'Hamsters'
                          : Species.cat == specie
                              ? 'Gatos'
                              : Species.bunny == specie
                                  ? 'Coelhos'
                                  : 'Cachorros',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total de " + total.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  final String text;

  const CategoryHeader({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
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
        ],
      ),
    );
  }
}

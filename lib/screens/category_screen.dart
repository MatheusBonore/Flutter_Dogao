import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dogao/config/palette.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.sort,
          color: Colors.grey[800],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Find Your",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Text(
                "Lovely pet anywhere",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(right: 30),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 24),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pet Category",
                    style: TextStyle(
                      fontSize: 18,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(
                        "Hamsters",
                        "https://github.com/gerfagerfa/pet_finder/blob/master/assets/images/hamster.png?raw=true",
                        "56",
                        Colors.orange[200],
                      ),
                      buildPetCategory(
                        "Cats",
                        "https://github.com/gerfagerfa/pet_finder/blob/master/assets/images/cat.png?raw=true",
                        "210",
                        Colors.blue[200],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(
                        "Bunny",
                        "https://github.com/gerfagerfa/pet_finder/blob/master/assets/images/bunny.png?raw=true",
                        "90",
                        Colors.green[200],
                      ),
                      buildPetCategory(
                        "Dog",
                        "https://github.com/gerfagerfa/pet_finder/blob/master/assets/images/dog.png?raw=true",
                        "340",
                        Colors.red[200],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Newest Pet",
                    style: TextStyle(
                      fontSize: 18.0,
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
            Container(
              height: 280.0,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  buildPet(
                    0,
                    "https://static.poder360.com.br/2020/04/GATO-CORONAVIRUS.jpg",
                    true,
                    "Adoption",
                    "Abyssinian Cats",
                    "California",
                    "2.5",
                  ),
                  buildPet(
                    1,
                    "https://www.petz.com.br/blog/wp-content/uploads/2020/06/animais-com-sindrome-de-down.jpg",
                    false,
                    "Disappear",
                    "Burm\és",
                    "Chicago",
                    "1.2",
                  ),
                  buildPet(
                    2,
                    "https://conteudo.imguol.com.br/c/entretenimento/47/2020/04/02/gato-gato-fofo-gato-filhote-1585841507191_v2_450x337.jpg",
                    true,
                    "Disappear",
                    "Ragdoll",
                    "Miami",
                    "1.2",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPet(int index, String foto, bool favorito, String condicao,
      String nome, String local, String distancia) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        border: Border.all(
          color: Colors.grey[200],
          width: 1.0,
        ),
      ),
      width: 220.0,
      margin: EdgeInsets.only(
        right: index != null ? 16.0 : 0,
        left: index == 0 ? 16.0 : 0,
        bottom: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: foto,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(foto),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: favorito ? Colors.red[400] : Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 16.0,
                        color: favorito ? Colors.white : Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: condicao == "Adoption"
                        ? Colors.orange[100]
                        : condicao == "Disappear"
                            ? Colors.red[100]
                            : Colors.blue[100],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    condicao,
                    style: TextStyle(
                      color: condicao == "Adoption"
                          ? Colors.orange
                          : condicao == "Disappear" ? Colors.red : Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  nome,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18.0,
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
                      local,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "(" + distancia + ")",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPetCategory(
      String categoria, String foto, String total, Color color) {
    return Expanded(
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[200],
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 56.0,
              width: 56.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.5),
              ),
              child: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CachedNetworkImage(
                    imageUrl: foto,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categoria,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total of " + total,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

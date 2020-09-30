import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  final List<List> categories = const [
    [Palette.dogaoComunidade, 'Todos'],
    [Palette.dogaoAchados, 'Doação'],
    [Palette.dogaoDoacao, 'Perdido'],
    [Palette.dogaoPerdidos, 'Encontrado'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: [
            Container(
              color: categories[selectedIndex][0],
              child: Column(
                children: [
                  CategoryHeader(),
                  CategorySearch(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
                    height: 30.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectedIndex = index;
                            })
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 20.0,
                              right: index == categories.length - 1 ? 20.0 : 0,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? Colors.white.withOpacity(0.4)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              categories[index][1],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: ListTile(
        title: Text(
          'Encontrar seu proximo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        subtitle: Text(
          'melhor Amigo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Notificar'),
          )),
        ),
      ),
    );
  }
}

class CategorySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Pesquisar',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

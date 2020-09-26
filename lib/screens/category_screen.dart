import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.dogaoAchados,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text(
                  'Buscar Pet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 15.0),
            sliver: SliverToBoxAdapter(
              child: Teste(),
            ),
          ),
        ],
      ),
    );
  }
}

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 835.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }
}

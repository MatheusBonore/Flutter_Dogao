import 'package:flutter/material.dart';

import 'package:flutter_dogao/config/palette.dart';

class CategoryListScreen extends StatelessWidget {
  final String category;

  const CategoryListScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
    );
  }
}

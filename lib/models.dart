import 'package:flutter/material.dart';

class GridItem {
  final String text;
  final Color color;
  final String imagePath;
  final List<GridItem> subItems;

  GridItem({
    required this.text,
    required this.color,
    this.subItems = const [],
    required this.imagePath,
  });
}

class DetailItem {
  final String text;
  final Color color;
  final String imagePath;

  DetailItem({
    required this.text,
    required this.color,
    required this.imagePath,
  });
}

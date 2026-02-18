import 'package:flutter/material.dart';

class CategoryItemsModel {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryItemsModel(this.title, this.imagePath, this.onTap);
}

class CategoryModel{
  final String title;
  final String image;
  final String section;

  CategoryModel({
    required this.title,
    required this.image,
    required this.section,
  });
}
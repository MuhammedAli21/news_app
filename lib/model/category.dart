import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class Category{
  String id;
  String imagePath;
  String title;
  Color color;

  Category({required this.id , required this.imagePath, required this.title , required this.color});

  static List<Category> getCategories(){
    return[
    Category(
      id: 'sports',
      imagePath: 'assets/images/sports.png',
      title: 'Sports',
      color: AppColors.redColor),
    Category(
      id: 'general',
      imagePath: 'assets/images/Politics.png',
      title: 'General',
      color: AppColors.darkBlueColor),
    Category(
      id: 'health',
      imagePath: 'assets/images/health.png',
      title: 'Health',
      color: AppColors.pinkColor),
    Category(
      id: 'business',
      imagePath: 'assets/images/bussines.png',
      title: 'Business',
      color: AppColors.brownColor),
    Category(
      id: 'entertainment',
      imagePath: 'assets/images/environment.png',
      title: 'Entertainment',
      color: AppColors.blueColor),
    Category(
      id: 'science',
      imagePath: 'assets/images/science.png',
      title: 'Science',
      color: AppColors.yellowColor),
  ];
}
}
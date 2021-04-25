import 'package:flutter/material.dart';
import 'package:news_app/model/model_category.dart';

List<CategoryModel> getModel() {
  List<CategoryModel> category = new List<CategoryModel>();
//first item
  CategoryModel model = new CategoryModel();
  model.categoryName = "Business";
  model.imageUrl =
      "https://images.unsplash.com/photo-1425421669292-0c3da3b8f529?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80";
  category.add(model);
//second item
  model = new CategoryModel();
  model.categoryName = "Entertainment";
  model.imageUrl =
      "https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80";
  category.add(model);
//third item
  model = new CategoryModel();
  model.categoryName = "Business";
  model.imageUrl =
      "https://images.unsplash.com/photo-1572356722857-1fa4d525766e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80";
  category.add(model);

  model = new CategoryModel();
  model.categoryName = "Business";
  model.imageUrl =
      "https://images.unsplash.com/photo-1425421669292-0c3da3b8f529?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80";
  category.add(model);

  return category;
}

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../views/detail_view_page.dart';

class NavigationController {
  void openDetailPage(BuildContext context, ItemModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailViewPage(item: item),
      ),
    );
  }
}
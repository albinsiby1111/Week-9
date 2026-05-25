import 'package:flutter/material.dart';
import '../controllers/navigation_controller.dart';
import '../models/item_model.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  final NavigationController controller = NavigationController();

  final List<ItemModel> items = [
    ItemModel(
      title: "Laptop",
      description: "A powerful device for coding and productivity.",
    ),
    ItemModel(
      title: "Phone",
      description: "A smart device used for communication.",
    ),
    ItemModel(
      title: "Headphones",
      description: "Used for listening to music clearly.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(items[index].title),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                controller.openDetailPage(
                  context,
                  items[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
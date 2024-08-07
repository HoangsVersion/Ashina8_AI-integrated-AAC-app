import 'package:flutter/material.dart';
import 'models.dart';

class ItemDetailsPage extends StatelessWidget {
  final GridItem gridItem;
  final Function(String) onSubItemTap;

  ItemDetailsPage({required this.gridItem, required this.onSubItemTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gridItem.text),
        backgroundColor: gridItem.color,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: gridItem.subItems.length,
        itemBuilder: (context, index) {
          var subItem = gridItem.subItems[index];
          return GestureDetector(
            onTap: () {
              onSubItemTap(subItem.text);
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: subItem.color,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        subItem.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    subItem.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

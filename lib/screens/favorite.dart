import 'package:bubble_tea_shop/models/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

   static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.items.length,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (context, index) => FavoriteItem(itemNo: value.items[index]),
          );
        },
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.itemNo});

  final int itemNo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
      ),
      title: Text(
        'Item $itemNo',
        key: Key('favorite_key_$itemNo'),
      ),
      trailing: IconButton(
        key: Key('remove_icon_$itemNo'),
        icon: const Icon(Icons.close),
        onPressed: (){
          Provider.of<Favorites>(context, listen: false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('removed from favorites'),
              duration: Duration(seconds: 1),
            ),
          );
        }, 
      ),
    );
  }
}

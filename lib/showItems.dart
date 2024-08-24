import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShowItems extends StatelessWidget {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sneex'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/add'); // Navigate to Add Item screen
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushReplacementNamed('/login'); // Navigate to Login screen
              } catch (e) {
                print('Error logging out: $e');
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Failed to logout')));
              }
            },
          ),
        ],
      ),
      body: ItemGrid(),
    );
  }
}

class ItemGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('items').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            var data = docs[index].data() as Map<String, dynamic>;
            return ItemTile(
              itemId: docs[index].id,
              name: data['name'],
              price: data['price'].toString(),
              imgUrl: data['img'],
              brand: data['desc'], // Assuming 'desc' is used for brand
            );
          },
        );
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  final String itemId;
  final String name;
  final String price;
  final String imgUrl;
  final String brand;

  ItemTile({
    required this.itemId,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              brand,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$$price',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/update', arguments: itemId);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('items')
                            .doc(itemId)
                            .delete();
                      } catch (e) {
                        print('Error deleting item: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to delete item')));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

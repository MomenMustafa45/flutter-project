import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _descController = TextEditingController();

  Future<void> _addItem() async {
    try {
      await FirebaseFirestore.instance.collection('items').add({
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'img': _imgUrlController.text,
        'desc': _descController.text,
      });
      Navigator.of(context).pop();
    } catch (e) {
      print('Error adding item: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add item')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imgUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}

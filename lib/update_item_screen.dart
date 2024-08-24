import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateItemScreen extends StatefulWidget {
  final String itemId;
  final String name;
  final double price;
  final String imgUrl;
  final String desc;

  UpdateItemScreen({
    required this.itemId,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.desc,
  });

  @override
  _UpdateItemScreenState createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _priceController.text = widget.price.toString();
    _imgUrlController.text = widget.imgUrl;
    _descController.text = widget.desc;
  }

  Future<void> _updateItem() async {
    try {
      await FirebaseFirestore.instance
          .collection('items')
          .doc(widget.itemId)
          .update({
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'img': _imgUrlController.text,
        'desc': _descController.text,
      });
      Navigator.of(context).pop();
    } catch (e) {
      print('Error updating item: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update item')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Item')),
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
              onPressed: _updateItem,
              child: Text('Update Item'),
            ),
          ],
        ),
      ),
    );
  }
}

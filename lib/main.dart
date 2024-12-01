import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClothingListScreen(),
    );
  }
}

class Clothing {
  final String name;
  final String image;
  final String description;
  final double price;

  Clothing({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

class ClothingListScreen extends StatelessWidget {
  final List<Clothing> clothingItems = [
    Clothing(
      name: 'T-Shirt',
      image: 'assets/tshirt.png',
      description: 'A comfortable cotton t-shirt.',
      price: 19.99,
    ),
    Clothing(
      name: 'Bluse',
      image: 'assets/blouse.png',
      description: 'A stylish bluse for formal occasions.',
      price: 29.99,
    ),
    Clothing(
      name: 'Short Pants',
      image: 'assets/shortpants.png',
      description: 'Perfect for summer, lightweight and breathable.',
      price: 15.99,
    ),
    Clothing(
      name: 'Long Pants',
      image: 'assets/longpants.png',
      description: 'Comfortable and warm for the colder days.',
      price: 35.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211220'), // Change this to your student index number
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          return ClothingCard(
            clothing: clothingItems[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClothingDetailScreen(
                    clothing: clothingItems[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ClothingCard extends StatelessWidget {
  final Clothing clothing;
  final VoidCallback onTap;

  const ClothingCard({required this.clothing, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.asset(clothing.image, width: 50, height: 50),
        title: Text(clothing.name),
        subtitle: Text(clothing.description),
        trailing: Text('\$${clothing.price}'),
        onTap: onTap,
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final Clothing clothing;

  const ClothingDetailScreen({required this.clothing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothing.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(clothing.image, width: 150, height: 150),
            SizedBox(height: 20),
            Text(
              clothing.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              clothing.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '\$${clothing.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const ProductsApp());
}

enum Product {
  dart(
    title: 'Dart',
    description: 'the object oriented language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/ex3/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProductsPage(),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [
            ProductCard(product: Product.dart),
            SizedBox(height: 10),
            ProductCard(product: Product.flutter),
            SizedBox(height: 10),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, height: 72),
            Text(product.title, style: const TextStyle(fontSize: 24)),
            Text(product.description, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

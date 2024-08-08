import 'package:flutter/material.dart';


class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Monitor Asus 165hz', price: 229.99, imageUrl: 'asset/Monitor.jpeg'),
    Product(name: 'Intel Core i9 13900k', price: 650.99, imageUrl: 'asset/procesador.jpeg'),
    Product(name: 'NVIDI RTX 4060', price: 620.99, imageUrl: 'asset/TarjetaGrafica.png'),
    Product(name: 'Teclado Gamer', price: 69.99, imageUrl: 'asset/teclado.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aquí puedes decidir si permitir o no el retroceso.
        // Retornar 'true' permite el retroceso, retornar 'false' lo bloquea.
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nuestros Productos'),
          automaticallyImplyLeading: false, // Esto oculta el botón de retroceso en la AppBar
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            childAspectRatio: 3 / 4, // Proporción de aspecto de los elementos
            crossAxisSpacing: 10, // Espaciado entre columnas
            mainAxisSpacing: 10, // Espaciado entre filas
          ),
          itemCount: products.length,
          itemBuilder: (ctx, i) => ProductItem(
            name: products[i].name,
            price: products[i].price,
            imageUrl: products[i].imageUrl,
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductItem extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  ProductItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

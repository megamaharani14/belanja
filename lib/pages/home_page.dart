import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sugar',
        price: 5000,
        imageUrl: 'https://cdn11.bigcommerce.com/s-dis4vxtxtc/images/stencil/1280x1280/products/2277/4025/image_1531__32719.1567255004.jpg',
        stock: 20,
        rating: 4.5,
      ),
      Item(
        name: 'Salt',
        price: 2000,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/45/Table_salt_fine_grain_V1.jpg',
        stock: 500,
        rating: 5.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom
          childAspectRatio: 0.7, // Rasio lebar terhadap tinggi
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Hero(
              tag: item.name, // Tag yang unik untuk animasi Hero
              child: Card(
                child: Column(
                  children: [
                    Expanded( // Menggunakan Expanded agar gambar mengambil ruang yang tepat
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Memberikan padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4), // Jarak antara nama dan harga
                          Text('Rp ${item.price}', style: TextStyle(color: Colors.green)),
                          SizedBox(height: 4), // Jarak antara harga dan stok
                          Text('Stock: ${item.stock}'),
                          SizedBox(height: 4), // Jarak antara stok dan rating
                          Text('Rating: ${item.rating}', style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Tambahkan footer jika perlu
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text('Nama: Mega Maharani, NIM: 362358302010'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WineHomePage(),
    );
  }
}

class WineHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Donnerville Drive', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {},
                ),
                Positioned(
                  right: 6,
                  top: 3,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text('12', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Icon(Icons.mic, color: Colors.black),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Shop wines by',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildChip('Type', isSelected: true),
                _buildChip('Style'),
                _buildChip('Countries'),
                _buildChip('Grape'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildWineTypeCard('Red wines', 123),
                SizedBox(width: 16),
                _buildWineTypeCard('White wines', 123),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Wine',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildWineItem(
              'Ocean Blueprint Reserva tinto Reserva',
              'Red wine',
              'France',
              '23,256,696',
              true,
            'https://plus.unsplash.com/premium_photo-1676590905512-13824f60092a?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
             _buildWineItem(
              '2021 Pure Chablis Passy Le Clou',
              'White wine',
              'France',
              '23,256,696',
              false,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlkEp-RNkoTQyMXIZ_lQFUp-boJ1A1aSCP9Q&s'),
          _buildWineItem(
              'Philippe Fontaine Champagne Brut Rosé de Saignée, NV',
              'Sparkling wine',
              'France',
              '23,256,696',
              true,
              'https://www.virginwines.co.uk/hub/wp-content/uploads/2022/08/Bottle-of-English-sparkling-wine-next-to-a-glass-of-English-sparkling-wine-on-a-table-in-front-of-a-window.jpg'),
          _buildWineItem(
              '2021 Gérard s Song Rosé',
              'Rosé wine',
              'France',
              '23,256,696',
              true,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEPEo2AzkLHy-iUYOmTJJ1n81CQ1DIKD-rzQ&s'),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? Colors.pink : Colors.grey[200],
      ),
    );
  }

  Widget _buildWineTypeCard(String title, int count) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('$count', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wine_bar, size: 50, color: title.contains('Red') ? Colors.red : Colors.yellow[700]),
                SizedBox(height: 8),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWineItem(String name, String type, String country, String price, bool isAvailable, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wine Image
                Container(
                  width: 60,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),

                // Wine Details Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Availability indicator
                      Text(
                        isAvailable ? 'Available' : 'Unavailable',
                        style: TextStyle(
                          color: isAvailable ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),

                      Text(
                        '$type\n$country',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Price and Favorite Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favorite Icon
                Icon(Icons.favorite_border, color: Colors.black45),
                // Price Tag
                Text(
                  '₩ $price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

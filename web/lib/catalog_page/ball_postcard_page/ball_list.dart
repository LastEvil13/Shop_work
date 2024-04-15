import 'package:flutter/material.dart';
import 'package:flutter_application_main/buy_page/buy_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart cart = Cart();

  MyApp() {
    WidgetsFlutterBinding.ensureInitialized();
    Supabase.initialize(
      url: 'https://jyptxdavpujfsmogxdij.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp5cHR4ZGF2cHVqZnNtb2d4ZGlqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwOTYzMTI4OSwiZXhwIjoyMDI1MjA3Mjg5fQ.aeHO9vC36qesQwGqsKMCCKsiXBEzQGEAvbkjQOxEaTY',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AirballListPage(cart: cart),
    );
  }
}

class AirballListPage extends StatefulWidget {
  final Cart cart;

  AirballListPage({required this.cart});

  @override
  _AirballListPageState createState() => _AirballListPageState();
}

class _AirballListPageState extends State<AirballListPage> {
  late Future<List<Map<String, dynamic>>> _AirballsFuture;

  @override
  void initState() {
    super.initState();
    _AirballsFuture = Supabase.instance.client.from('Airball').select(); // Make sure to call `.execute()` at the end to execute the query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _AirballsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data'));
            } else {
              final airballs = snapshot.data!;
              return ListView.builder(
                itemCount: airballs.length,
                itemBuilder: (context, index) {
                  final airball = airballs[index];
                  return ListTile(
                    leading: Image.network(airball['Image']),
                    title: Text(airball['Title']),
                    subtitle: Text('${airball['Cost']} RUB'),
                  );
                },
              );
            }
          }
          // It's a good practice to handle all possible states, even if unlikely.
          return Center(child: Text('Something went wrong.'));
        },
      ),
    );
  }
}

class AirballDetailPage extends StatelessWidget {
  final Map<String, dynamic> airballs;
  final Cart cart;
  final Function(Map<String, dynamic>) onAddToCart;

  AirballDetailPage({required this.airballs, required this.cart, required this.onAddToCart });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(airballs['Title'], style: TextStyle(fontSize: 30),)),
      body: ListView(
        children: [
          Image.network(airballs['Image']),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${airballs['Cost']} руб.', style: TextStyle(fontSize: 30)),
                Text(airballs['Description'], style: TextStyle(fontSize: 20)),
                //остальные поля цветов для отображения
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                 onAddToCart({
                 'Title': airballs['Title'],
                'Cost': airballs['Cost'],
                 });
              },
              child: Text('Добавить в корзину', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

}
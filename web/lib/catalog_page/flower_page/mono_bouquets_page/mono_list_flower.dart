import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    WidgetsFlutterBinding.ensureInitialized();
    Supabase.initialize(
     url: 'https://jyptxdavpujfsmogxdij.supabase.co',
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp5cHR4ZGF2cHVqZnNtb2d4ZGlqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwOTYzMTI4OSwiZXhwIjoyMDI1MjA3Mjg5fQ.aeHO9vC36qesQwGqsKMCCKsiXBEzQGEAvbkjQOxEaTY',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин цветов',
      home: FlowerListPage(),
    );
  }
}

class FlowerListPage extends StatefulWidget {
  @override
  _FlowerListPageState createState() => _FlowerListPageState();
}

class _FlowerListPageState extends State<FlowerListPage> {
  late Future<List<Map<String, dynamic>>> _flowersFuture;

  @override
  void initState() {
    super.initState();
    _flowersFuture = Supabase.instance.client.from('Flowers').select().eq('TypeFlowers', '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _flowersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Нет данных'));
            } else {
              final flowers = snapshot.data!;
              return ListView.builder(
                itemCount: flowers.length,
                itemBuilder: (context, index) {
                  final flower = flowers[index];
                  return ListTile(
                    leading: Image.network(flower['ImageFlowers']),
                    title: Text(flower['TitleFlowers']),
                    subtitle: Text('${flower['CostFlowers']} руб.'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlowerDetailPage(flower: flower),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}

class FlowerDetailPage extends StatelessWidget {
  final Map<String, dynamic> flower;

  FlowerDetailPage({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(flower['TitleFlowers'], style: TextStyle(fontSize: 30),)),
      body: ListView(
        children: [
          Image.network(flower['ImageFlowers']),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${flower['CostFlowers']} руб.', style: TextStyle(fontSize: 30)),
                Text(flower['СompositionFlowers'], style: TextStyle(fontSize: 20))
                //остальные поля цветов для отображения
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                // Добавить цветы в корзину
              },
              child: Text('Добавить в корзину', style: TextStyle(fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}
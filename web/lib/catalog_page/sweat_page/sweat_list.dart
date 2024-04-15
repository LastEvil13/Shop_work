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
      home: SweatListPage(),
    );
  }
}

class SweatListPage extends StatefulWidget {
  @override
  _SweatListPageState createState() => _SweatListPageState();
}

class _SweatListPageState extends State<SweatListPage> {
  late Future<List<Map<String, dynamic>>> _SweatsFuture;

  @override
  void initState() {
    super.initState();
    _SweatsFuture = Supabase.instance.client.from('Sweat').select();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _SweatsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Нет данных'));
            } else {
              final Sweat = snapshot.data!;
              return ListView.builder(
                itemCount: Sweat.length,
                itemBuilder: (context, index) {
                  final sweats = Sweat[index];
                  return ListTile(
                    leading: Image.network(sweats['Image']),
                    title: Text(sweats['Title']),
                    subtitle: Text('${sweats['Cost']} руб.'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SweatDetailPage(sweats: sweats),
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

class SweatDetailPage extends StatelessWidget {
  final Map<String, dynamic> sweats;

  SweatDetailPage({required this.sweats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sweats['Title'], style: TextStyle(fontSize: 30),)),
      body: ListView(
        children: [
          Image.network(sweats['Image']),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${sweats['Cost']} руб.', style: TextStyle(fontSize: 30)),
                Text(sweats['Description'], style: TextStyle(fontSize: 20))
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
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
      home: GiftboxListPage(),
    );
  }
}

class GiftboxListPage extends StatefulWidget {
  @override
  _GiftboxListPageState createState() => _GiftboxListPageState();
}

class _GiftboxListPageState extends State<GiftboxListPage> {
  late Future<List<Map<String, dynamic>>> _giftboxsFuture;

  @override
  void initState() {
    super.initState();
    _giftboxsFuture = Supabase.instance.client.from('GiftBox').select();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _giftboxsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Нет данных'));
            } else {
              final giftboxs = snapshot.data!;
              return ListView.builder(
                itemCount: giftboxs.length,
                itemBuilder: (context, index) {
                  final giftbox = giftboxs[index];
                  return ListTile(
                    leading: Image.network(giftbox['Image']),
                    title: Text(giftbox['Title']),
                    subtitle: Text('${giftbox['Cost']} руб.'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GiftboxDetailPage(giftboxs: giftbox),
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

class GiftboxDetailPage extends StatelessWidget {
  final Map<String, dynamic> giftboxs;

  GiftboxDetailPage({required this.giftboxs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(giftboxs['Title'], style: TextStyle(fontSize: 30),)),
      body: ListView(
        children: [
          Image.network(giftboxs['Image']),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${giftboxs['Cost']} руб.', style: TextStyle(fontSize: 30)),
                Text(giftboxs['Description'], style: TextStyle(fontSize: 20))
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
import 'package:shop/services/remote_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Products>> products;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Lista produktów'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Products>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(snapshot.data![index].id.toString()),
                        title: Text(snapshot.data![index].nazwa.toString()),
                        subtitle:
                            Text(snapshot.data![index].kategoria.toString()),
                        trailing: Text(
                            snapshot.data![index].cena.toString() + ' PLN'),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    ));
  }
}

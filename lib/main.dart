import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sapmobile/model/test.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List data;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override

  void initState() {
    // TODO: implement initState
    htest dx = new htest();
    dx.getData().then((value) {
      setState(() {
        // print(value["Data"][0]);
        data = value["Data"];
      });
    });
    print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                htest dx = new htest();
                dx.exec().then((value) {
                  if(value["Success"].toString() != "true"){
                    _showMyDialog(value["Message"].toString(),"Gagal");
                  }
                  else{
                    _showMyDialog( value["Message"].toString(),"Berhasil");
                  }
                });
              },
              child: Text("Coba edit bussisies partner (Klik di sini)")
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.4,
              child: _itemData(data),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _itemData(List lst){
    return ListView.builder(
      itemCount: lst == null ? 0 : lst.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(lst[index]['KodeCustomer']),
          subtitle: Text(lst[index]["NamaCustomer"]),
          trailing: Text(lst[index]["Plafon"].toString()),
        );
      }
    );
  }

  Future<void> _showMyDialog(String message, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}

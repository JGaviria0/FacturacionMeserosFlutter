import 'dart:typed_data';

import 'package:facturacion_mesero/pages/printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import './pages/example.dart';
import './pages/form.dart';
import './appState.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("Bill");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 0, 8, 90)),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Historial Facturación'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80.copyWith(width: 100, marginLeft: 2),
        orientation: pw.PageOrientation.landscape,
        build: (pw.Context context) {
          return pw.Text(
            'Testing',
            style: const pw.TextStyle(fontSize: 1),
          );
        },
      ),
    );

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(doc: doc),
        ));
  }

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> choose = [GeneratorPage(), MyForm(), ToPrint()];
    Widget page = choose[selectedIndex];
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              minWidth: 70,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.document_scanner,
                    size: 40,
                  ),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.document_scanner,
                    size: 40,
                  ),
                  label: Text('Printer'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: Text(widget.title),
    //   ),
    //   body: ListView(
    //     children: [
    //       ListTile(
    //           title: Text('12405'),
    //           subtitle: Text('Tarjeta'),
    //           leading: Icon(Icons.attach_money),
    //           trailing: Text('1')),
    //     ],
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}

class PreviewScreen extends StatelessWidget {
  final pw.Document doc;
  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: const Text("Preview"),
      ),
      body: PdfPreview(
        build: (format) => doc.save(),
        allowSharing: true,
        allowPrinting: true,
        canChangeOrientation: true,
        initialPageFormat: PdfPageFormat.roll80,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import './example.dart';
import '../appState.dart';
// ignore: library_prefixes
import '../constants/bill.dart' as CONSTANTS;

class ToPrint extends StatelessWidget {
  const ToPrint({super.key});

  @override
  Widget build(BuildContext context) {
    void _incrementCounter() {
      final doc = pw.Document();

      const textstyle = const pw.TextStyle(fontSize: 4.6);
      double marging = 10;

      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.roll80.copyWith(width: 100, marginLeft: 2),
          // pageFormat: PdfPageFormat.roll80,
          margin: pw.EdgeInsets.fromLTRB(marging, marging, marging, marging),
          build: (pw.Context context) {
            return pw.Center(
                child: pw.Column(children: [
              pw.Text(CONSTANTS.bill["name"]!, style: textstyle),
              pw.Text(CONSTANTS.bill["description"]!, style: textstyle),
              pw.Text(CONSTANTS.bill["NIT"]!, style: textstyle),
              pw.Text(CONSTANTS.bill["location"]!,
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  style: textstyle),
              pw.Row(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Text(CONSTANTS.bill["city"]!, style: textstyle),
                  pw.SizedBox(width: 2),
                  pw.Text(CONSTANTS.bill["state"]!, style: textstyle),
                ],
              ),
              pw.SizedBox(
                height: 5,
              ),
              pw.Text(
                CONSTANTS.bill["disclaimer"]!,
                style: textstyle,
                textAlign: pw.TextAlign.center,
                softWrap: true,
              ),
              pw.Text(
                CONSTANTS.bill["DIAN"]!,
                style: textstyle,
                textAlign: pw.TextAlign.left,
                softWrap: true,
              ),
              pw.SizedBox(height: 5),
              pw.Column(
                children: [
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["number"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('LGW12345', style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["date"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('28-09-2023', style: textstyle),
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Text(CONSTANTS.bill["client"]!,
                        style: textstyle, textAlign: pw.TextAlign.left),
                  ]),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["clientCC"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('1004995317', style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["clientName"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('Jhon Alex Gaviria', style: textstyle),
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Column(children: [
                      pw.Text(CONSTANTS.bill["payDescription"]!,
                          style: textstyle),
                      pw.Text(CONSTANTS.bill["productDescription"]!,
                          style: textstyle),
                    ]),
                    pw.Spacer(),
                    pw.Column(children: [
                      pw.Text(CONSTANTS.bill["payCant"]!, style: textstyle),
                      pw.Text("1", style: textstyle),
                    ]),
                    pw.Spacer(),
                    pw.Column(children: [
                      pw.Text(CONSTANTS.bill["payPrice"]!, style: textstyle),
                      pw.Text("180000", style: textstyle),
                    ]),
                    pw.Spacer(),
                    pw.Column(children: [
                      pw.Text(CONSTANTS.bill["payTotal"]!, style: textstyle),
                      pw.Text("180000", style: textstyle),
                    ]),
                  ]),
                  // pw.Table(children: [
                  //   pw.TableRow(children: [
                  //     pw.Text(CONSTANTS.bill["payDescription"]!,
                  //         style: textstyle),
                  //     pw.Text(CONSTANTS.bill["payCant"]!, style: textstyle),
                  //     pw.Text('${CONSTANTS.bill["payPrice"]!}',
                  //         style: textstyle),
                  //     pw.Spacer(),
                  //     pw.Text(CONSTANTS.bill["payTotal"]!, style: textstyle),
                  //   ]),
                  //   pw.TableRow(children: [
                  //     pw.Container(
                  //       margin: const pw.EdgeInsets.symmetric(vertical: 1),
                  //       color: PdfColor.fromHex('#7a7473'),
                  //       height: 0,
                  //     ),
                  //     pw.Container(
                  //       margin: const pw.EdgeInsets.symmetric(vertical: 1),
                  //       color: PdfColor.fromHex('#7a7473'),
                  //       height: 0,
                  //     ),
                  //     pw.Container(
                  //       margin: const pw.EdgeInsets.symmetric(vertical: 1),
                  //       color: PdfColor.fromHex('#7a7473'),
                  //       height: 0,
                  //     ),
                  //     pw.Container(
                  //       margin: const pw.EdgeInsets.symmetric(vertical: 1),
                  //       color: PdfColor.fromHex('#7a7473'),
                  //       height: 0,
                  //     ),
                  //     pw.Container(
                  //         margin: const pw.EdgeInsets.symmetric(vertical: 1),
                  //         color: PdfColor.fromHex('#7a7473'),
                  //         height: 0),
                  //   ]),
                  //   pw.TableRow(children: [
                  //     pw.Text(CONSTANTS.bill["productDescription"]!,
                  //         style: textstyle),
                  //     pw.Text('1', style: textstyle),
                  //     pw.Text('120000', style: textstyle),
                  //     pw.Spacer(),
                  //     pw.Text('120000', style: textstyle),
                  //   ])
                  // ]),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    margin: const pw.EdgeInsets.symmetric(vertical: 1),
                    color: const PdfColor.fromInt(0xff000000),
                    height: 0,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["total"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('180.000', style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["baseTax"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('180.000', style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["tax"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('180.000', style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["tax"]!, style: textstyle),
                      pw.Spacer(),
                      pw.Text('180.000', style: textstyle),
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["printingBy"]!, style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["printingByName"]!,
                          style: textstyle),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(CONSTANTS.bill["web"]!,
                          style: pw.TextStyle(
                              fontSize: 5, fontItalic: pw.Font.timesBold())),
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Text(CONSTANTS.bill["electronicBill"]!, style: textstyle),
                ],
              ),
              // )
            ]));
          },
        ),
      );

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewScreen(doc: doc),
          ));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Factura'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Printer(),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Imprimir',
          child: const Icon(Icons.print),
        ),
      ),
    );
  }
}

class Printer extends StatefulWidget {
  @override
  _ToPrintState createState() => _ToPrintState();
}

class _ToPrintState extends State<Printer> {
  @override
  Widget build(BuildContext context) {
    print(CONSTANTS.bill);
    String name = CONSTANTS.bill["name"]!;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text('${CONSTANTS.bill["name"]}'),
                  Text('${CONSTANTS.bill["description"]}'),
                  Text('${CONSTANTS.bill["NIT"]}'),
                  Text(
                    '${CONSTANTS.bill["location"]}',
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${CONSTANTS.bill["city"]}'),
                      const SizedBox(width: 7),
                      Text('${CONSTANTS.bill["state"]}'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${CONSTANTS.bill["disclaimer"]}',
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  Text(
                    '${CONSTANTS.bill["DIAN"]}',
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["number"]}'),
                      const SizedBox(width: 7),
                      const Text('AXB 12345'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["date"]}'),
                      const SizedBox(width: 7),
                      const Text('28-09-2023'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["client"]}'),
                      const SizedBox(width: 7),
                      const Text('1004995317\n Jhon Alex Gaviria'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DataTable(
                    columnSpacing: 30,
                    horizontalMargin: 0,
                    dataRowHeight: 20,
                    headingRowHeight: 20,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            CONSTANTS.bill["payDescription"]!,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            CONSTANTS.bill["payCant"]!,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            CONSTANTS.bill["payPrice"]!,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            CONSTANTS.bill["payTotal"]!,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(CONSTANTS.bill["productDescription"]!)),
                          DataCell(Text(CONSTANTS.bill["cantvalue"]!)),
                          const DataCell(Text('180.000')),
                          const DataCell(Text('180.000')),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["total"]}'),
                      const Spacer(),
                      const Text('180.000'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["baseTax"]}'),
                      const Spacer(),
                      const Text('180.000'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["tax"]}'),
                      const Spacer(),
                      const Text('180.000'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${CONSTANTS.bill["tax"]}'),
                      const Spacer(),
                      const Text('180.000'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(CONSTANTS.bill["printingBy"]!),
                    ],
                  ),
                  Row(
                    children: [
                      Text(CONSTANTS.bill["printingByName"]!),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        CONSTANTS.bill["web"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(CONSTANTS.bill["electronicBill"]!),
                ],
              ))
        ]),
      ),
    );
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
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        initialPageFormat: PdfPageFormat.roll80,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}

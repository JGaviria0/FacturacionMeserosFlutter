import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './example.dart';
import '../appState.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario de Pago'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: MyForm2(),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

class MyForm2 extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm2> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  bool pagoConTarjeta = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cedulaController,
                  decoration: const InputDecoration(labelText: 'Cédula'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese cédula';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: precioController,
                  decoration: const InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese el precio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Text('Método de pago:'),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: pagoConTarjeta,
                        onChanged: (value) {
                          setState(() {
                            pagoConTarjeta = false;
                          });
                        },
                      ),
                      const Text('Efectivo'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: pagoConTarjeta,
                        onChanged: (value) {
                          setState(() {
                            pagoConTarjeta = true;
                          });
                        },
                      ),
                      const Text('Tarjeta'),
                    ],
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DateTime now = DateTime.now();
                      var info = {
                        "date": '${now.day}-${now.month}-${now.year}',
                        "name": nombreController.text,
                        "CC": cedulaController.text,
                        "value": int.parse(precioController.text),
                        "payWithCreditCard": pagoConTarjeta,
                        "baseTax": 0,
                        "tax": 0,
                      };

                      print(info);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeneratorPage(),
                        ),
                      );
                    }
                  },
                  child: const Text('Enviar'),
                )
              ],
            ),
          ))
    ]));
  }
}

void saveBill() {}

import 'dart:math';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:projeto_imc/widgets/btn.dart';
import 'package:projeto_imc/widgets/imc_gauge.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => ValueNotifierPageState();
}

class ValueNotifierPageState extends State<ValueNotifierPage> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  var imc = ValueNotifier(0.0);
  var formKey = GlobalKey<FormState>();

  calcularIMC() async {
    if (formKey.currentState!.validate()) {
      imc.value = 0;

      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        double formatPeso = double.parse(peso.text.replaceAll(',', '.'));
        double formatAltura = double.parse(altura.text.replaceAll(',', '.'));
        imc.value = formatPeso / pow(formatAltura, 2);
      });
    }
  }

  @override
  void dispose() {
    peso.dispose();
    altura.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: imc,
                  builder: (context, value, child) {
                    return ImcGauge(imc: imc.value);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: peso,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // prefixIcon: const Icon(Icons.balance),
                    labelText: 'Peso',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: altura,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // prefixIcon: const Icon(Icons.height_outlined),
                    labelText: 'Altura',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Btn(
                  callback: () => calcularIMC(),
                  text: 'Calcular IMC',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:projeto_imc/controllers/imc_bloc_controller.dart';
import 'package:projeto_imc/controllers/imc_state.dart';
import 'package:projeto_imc/widgets/btn.dart';
import 'package:projeto_imc/widgets/imc_gauge.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({super.key});

  @override
  State<BlocPage> createState() => BlocPageState();
}

class BlocPageState extends State<BlocPage> {
  var controller = ImcBlocController();

  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void enviarForm() {
    if (formKey.currentState!.validate()) {
      double formatPeso = double.parse(peso.text.replaceAll(',', '.'));
      double formatAltura = double.parse(altura.text.replaceAll(',', '.'));

      controller.calcularIMC(formatAltura, formatPeso);
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
        title: const Text('Bloc'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                StreamBuilder(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    return ImcGauge(imc: snapshot.data?.imc ?? 0);
                  },
                ),
                StreamBuilder(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    final dataValue = snapshot.data;

                    if (dataValue is ImcStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (dataValue is ImcStateError) {
                      return Text(dataValue.msg);
                    }
                    return const SizedBox.shrink();
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
                  callback: () => enviarForm(),
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

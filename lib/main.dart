import 'package:flutter/material.dart';
import 'dart:math' as math;

// Ponto de entrada do aplicativo Flutter
void main() {
  runApp(const MainApp());
}

// App principal que configura MaterialApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp fornece tema e navegação básica para o app
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //remover o selo DEBUG
      home: const TelaSoma(), // Tela inicial do app
    );
  }
}

//----------TELA SOMA-----------

// Tela que precisa manter estado (valores dos inputs e resultado)
class TelaSoma extends StatefulWidget {
  const TelaSoma({super.key});

  @override
  State<TelaSoma> createState() => _TelaSomaState();
}

// Estado da TelaSoma: é aqui que guardamos os controllers e o resultado
class _TelaSomaState extends State<TelaSoma> {
  // CRIAÇÃO DAS INPUTS
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  // Variável que armazena o resultado
  double total = 0;
   double montante = 0;
   double lucro = 0;
   double meta = 0;
   double perfil = 0;
double juros = 0;
double valorinicial = 0;
double meses = 0;


  // -------- FUNÇÕES --------

  // Função chamada ao pressionar o botão 'Somar'
  void somar() {
    double juros = pow(valorinicial, 3);
    double montante = valorinicial * (1 + juros )^meses;
    double investido = valorinicial + (juros * meses);

    setState(() {
      total = n1 + n2;
    });
    ResultadoMenorQueZero();
    mostrartoast("Total investido: $total");
  }

  void subtrair() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

setState(() {
      montante = n1 + n2 ;
    });
    ResultadoMenorQueZero();
    mostrartoast("Montante final: $montante");
  }

  // Multiplicar
  void multiplicar() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      lucro = n1 * n2;
    });
    ResultadoMenorQueZero();
  }

  // Dividir
  void dividir() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      if (n2 == 0) {
        meta = double.nan;
      }
    });
    ResultadoMenorQueZero();
  }

void ResultadoMenorQueZero(){
  if (resultado < 0) {
    mostrarAlerta("ATENÇÃO! RESULTADO MENOR QUE ZERO! DESEJA CONTINUAR?");
  }
}

void mostrartoast(String mensagem){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensagem),
      duration: const Duration(seconds: 3),
    ),
  );
}
String minhaVariavelGlobal='';
void mostrarToast(String mensagem){
  ScaffoldMessenger.of(context).showSnackBar(
 SnackBar(
  content: Text(mensagem),
  duration: const Duration(seconds: 3),
 ),
 );
}

void mostrarAlerta(String mensagem){
  showDialog( 
    context: context,
    builder: (context){
      return AlertDialog(
        title: const Text("Atenção"),
        content: Text(mensagem),
        actions: [
        TextButton(
         onPressed: (){
          Navigator.pop(context);
         },
         child: const Text("Cancelar"),
        ),
        TextButton(
         onPressed: (){
          Navigator.pop(context);
         },
         child: const Text("Limpar Tudo"),
        )
        ],
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Somar Números'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numero1Controller,
              decoration: const InputDecoration(
                labelText: 'Valor inicial',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
                        TextField(
              controller: numero2Controller,
              decoration: const InputDecoration(
                labelText: 'Aporte mensal',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: numero3Controller,
              decoration: const InputDecoration(
                labelText: 'Taxa de Juros(%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

                        TextField(
              controller: numero4Controller,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Meses',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

                        TextField(
              controller: numero5Controller,
              decoration: const InputDecoration(
                labelText: 'Meta Financeira',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // -------- BOTÕES LADO A LADO --------
            // -------- BOTÕES EM 2 LINHAS --------
            // -------- BOTÕES EM 2 LINHAS --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: somar,
                  icon: const Icon(Icons.add),
                  label: const Text('Calcular'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: subtrair,
                  icon: const Icon(Icons.post_add),
                  label: const Text('Carregar Exemplo'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: multiplicar,
                  icon: const Icon(Icons.close),
                  label: const Text('Multiplicar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: dividir,
                  icon: const Icon( Icons.horizontal_rule),
                  label: const Text('Dividir'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              'Montante final: $montante', montante
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

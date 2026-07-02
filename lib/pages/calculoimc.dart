import 'package:flutter/material.dart';

class CalculoIMC extends StatefulWidget{
  const CalculoIMC({super.key});

  @override
  State<StatefulWidget> createState() => _CalculoIMC();
}

class _CalculoIMC extends State<CalculoIMC>{
  final TextEditingController peso = TextEditingController();
  final TextEditingController altura = TextEditingController();

  bool _estaVisivel = false;
  String resultado = 'Aguardando valores...';
  String classificacao = '';

  void _calcularIMC(){
    double? pesoConvertido = double.tryParse(peso.text.replaceAll(',', '.'));
    double? alturaConvertida = double.tryParse(altura.text.replaceAll(',', '.'));

    if (pesoConvertido == null || alturaConvertida == null){
      setState(() {
        resultado = 'Por favor, preencha todos os campos!';
        classificacao = "";
        _estaVisivel = true;
      });
      return;
    }

    double imc = pesoConvertido / (alturaConvertida * alturaConvertida);
    String imcFormatado = imc.toStringAsFixed(2);

    if (imc < 19.5){
      classificacao = 'Abaixo do peso';
    } else if (imc < 25){
      classificacao = 'Peso normal';
    } else if (imc < 30){
      classificacao = 'Sobrepeso';
    } else {
      classificacao = 'Obesidade';
    }

    setState(() {
      resultado = '$imcFormatado';
      classificacao = classificacao;
      _estaVisivel = true;
    });

  }

  void _limparCampos() {
    setState(() {
      peso.clear();
      altura.clear();
      _estaVisivel = false;
      resultado = 'Aguardando valores...';
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de IMC"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const Icon(
                Icons.monitor_weight,
                size: 100,
                color: Colors.teal,
              ),

              const SizedBox(height:16),

              const Text(
                'Informe seu peso e a sua altura para calcular o IMC.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: peso,
                keyboardType: TextInputType.number,
                onChanged: (_){
                  setState(() {
                  });
                },

                decoration: InputDecoration(
                  focusColor: Colors.teal,
                  hoverColor: Colors.teal,

                  labelText: 'Peso em kg',
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelStyle: const TextStyle(color: Colors.teal),

                  prefixIcon: const Icon(Icons.fitness_center_rounded),

                  prefixIconColor: WidgetStateColor.resolveWith((states){
                    if(states.contains(WidgetState.focused)){
                      return Colors.teal;
                    }
                    return Colors.grey;
                  }),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.teal, width: 2.5),
                  ),

                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  )
                ),
              ),

              const SizedBox (height:25),

              TextField(
                controller: altura,
                keyboardType: TextInputType.number,
                onChanged: (_){
                  setState(() {
                  });
                },

                decoration: InputDecoration(
                    focusColor: Colors.teal,
                    hoverColor: Colors.teal,

                    labelText: 'Altura em metros',
                    labelStyle: const TextStyle(color: Colors.grey),
                    floatingLabelStyle: const TextStyle(color: Colors.teal),

                    prefixIcon: const Icon(Icons.height),

                    prefixIconColor: WidgetStateColor.resolveWith((states){
                      if(states.contains(WidgetState.focused)){
                        return Colors.teal;
                      }
                      return Colors.grey;
                    }),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.teal, width: 2.5),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    )
                ),
              ),

              const SizedBox (height:20),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _calcularIMC,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                  child: Text(
                    'Calcular IMC',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              const SizedBox (height:15),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _limparCampos,
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.teal, width: 1.5),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: Text(
                    'Limpar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              const SizedBox (height:25),

              if (_estaVisivel)

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.teal.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.teal,
                        width: 1),
                  ),

                  child: Column(
                    children: [
                      const Text(
                        'Seu IMC e classificação:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        resultado,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        classificacao,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )
                      )
                    ],
                  ),
                ),
            ],
          ),
        )
      )
    );
  }
}
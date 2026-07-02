import 'package:flutter/material.dart';

class OperacoesMatematicas extends StatefulWidget {
  const OperacoesMatematicas({super.key});

  @override
  State<StatefulWidget> createState() => _OperacoesMatematicas();
}

class _OperacoesMatematicas extends State<OperacoesMatematicas>{
  final TextEditingController numero1 = TextEditingController();
  final TextEditingController numero2 = TextEditingController();

  String resultado = '...';

  void _limparCampos(){
    setState(() {
      numero1.clear();
      numero2.clear();
      resultado = '...';
    });
  }

  void calcular(String operacao){
    double? numero1conv = double.tryParse(numero1.text);
    double? numero2conv = double.tryParse(numero2.text);

    if (numero1conv == null || numero2conv == null){
      setState(() {
        resultado = 'Digite dois números válidos.';
      });
      return;
    }

    double calculo;

    if (operacao == 'soma'){
      calculo = numero1conv + numero2conv;

      setState(() {
        resultado = 'Resultado: $calculo';
      });
    }

    else if (operacao == 'subtracao'){
      calculo = numero1conv - numero2conv;

      setState(() {
        resultado = 'Resultado: $calculo';
      });
    }

    else if (operacao == 'multiplicacao'){
      calculo = numero1conv * numero2conv;

      setState(() {
        resultado = 'Resultado: $calculo';
      });
    }

    else if (operacao == 'divisao'){

      if (numero2conv == 0){
        setState(() {
          resultado = 'Não é possível dividir por 0';
        });
    } else {
        calculo = numero1conv / numero2conv;

        setState(() {
          resultado = 'Resultado: $calculo';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operações Matemáticas"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const Icon(
                Icons.functions,
                size: 100,
                color: Colors.teal,
              ),

              const SizedBox(height: 16),

              const Text(
                'Informe dois números e escolha uma operação matemática.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: numero1,
                keyboardType: TextInputType.number,
                onChanged: (_){
                   setState(() {
                   });
                },

                decoration: InputDecoration(
                  focusColor: Colors.teal,
                  hoverColor: Colors.teal,

                  labelText: 'Selecione o primeiro número',
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelStyle: const TextStyle(color: Colors.teal),

                  prefixIcon: const Icon(Icons.looks_one_outlined),

                  prefixIconColor: WidgetStateColor.resolveWith((states) { //Monitor de eventos, que observa a situação do campo de texto
                    if (states.contains(WidgetState.focused)) { //Simples If e Else, verifica se a caixa ESTÁ selecionada
                      return Colors.teal; // Cor quando selecionado
                    }
                    return Colors.grey; // Cor padrão quando inativo
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

              const SizedBox(height: 25),

              TextField(
                controller: numero2,
                keyboardType: TextInputType.number,
                onChanged: (_){
                  setState(() {
                  });
                },

                decoration: InputDecoration(
                    focusColor: Colors.teal,
                    hoverColor: Colors.teal,

                    labelText: 'Selecione o segundo número',
                    labelStyle: const TextStyle(color: Colors.grey),
                    floatingLabelStyle: const TextStyle(color: Colors.teal),

                    prefixIcon: const Icon(Icons.looks_two_outlined),

                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.focused)) {
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

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calcular('soma');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 3,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                        Icons.add,
                        size: 50),
                  ),

                  const SizedBox(width: 40),

                  ElevatedButton(
                    onPressed: () {
                      calcular('subtracao');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 3,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 50
                    ),
                  )
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calcular('multiplicacao');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 3,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                        Icons.close,
                        size: 50),
                  ),

                  const SizedBox(width: 40),

                  ElevatedButton(
                    onPressed: () {
                      calcular('divisao');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 3,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                        Icons.percent,
                        size: 50
                    ),
                  )
                ],
              ),

            Expanded(
                child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            border: Border.all(
                              color: Colors.teal,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(resultado),
                     )
                    ),

                      const SizedBox(width: 20),

                      SizedBox(
                        height: 50,

                        child: ElevatedButton.icon(
                          onPressed: _limparCampos,
                          icon: const Icon(Icons.delete_outline_rounded, size: 30),
                          label: const Text(
                            'Limpar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.teal,
                            foregroundColor: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                  ]
                ),
              )
            ]
          )
        )
      )
    );
  }
}

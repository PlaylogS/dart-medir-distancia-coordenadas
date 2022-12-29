
import 'package:medir_distancia/medir_distancia.dart';

// Origen: https://www.deformasymapas.com/blog/post/2/
// Obtiene la distancia y el angulo (acimut) entre dos puntos de
// coordenadas geograficas P1 a P2

main(List<String> args){

  if (args[0].contains('h')) {
    print('HELP: RUN WITH ARGUMENTS {Latitud1} {Longitud1} {Latitud2} {Longitud2}');
    return;
  }
  double valor1 = double.parse(args[0]);
  double valor2 = double.parse(args[1]);
  double valor3 = double.parse(args[2]);
  double valor4 = double.parse(args[3]);

  print (medirDistancia(valor1, valor2, valor3, valor4));
}
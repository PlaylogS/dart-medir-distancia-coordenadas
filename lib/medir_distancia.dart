import 'dart:math';


medirDistancia(double lat1, double lon1, double lat2, double lon2) {

    const double valorRadian = 57.2958;
    double azimut;

    final double latCentro = 36.72314062143207;
    final double lonCentro = -4.442376451996535;
    final double radioPerimetro = 200;


    // Valor absoluto y conversión a radianes
    final double lat1Rad = lat1.abs()      * (pi / 180);
    final double lat2Rad = lat2.abs()      * (pi / 180);
    final double lon1Rad = lon1.abs()      * (pi / 180);
    final double lon2Rad = lon2.abs()      * (pi / 180);
    final double latCRad = latCentro.abs() * (pi / 180);
    final double lonCRad = lonCentro.abs() * (pi / 180);
  
    // Si las latitudes y longitudes son iguales se encuentran en el mismo sitio geografico
    if (lat1Rad == lat2Rad && lon1Rad == lon2Rad) return 0;

    //  Calculo de la distancia P1 a P2
    var a = sin(lat1Rad) * sin(lat2Rad);
    var b = cos(lat1Rad) * cos(lat2Rad) * cos(lon2Rad - lon1Rad);
    var D = acos(a + b);  
    var d = 111180 * (D * valorRadian);

    // Calculo de la distancia de P1 al centro
    var a1 = sin(lat1Rad) * sin(latCRad);
    var b1 = cos(lat1Rad) * cos(latCRad) * cos(lonCRad - lon1Rad);
    var D1 = acos(a1 + b1);
    var d1 = 111180 * (D1 * valorRadian);

    //  Calculo del angulo del P1 al P2
    var angN = sin(lat2Rad) - cos(D) * sin(lat1Rad);
    var angD = sin(D) * cos(lat1Rad);

    try {
        azimut = acos((angN / angD));
    } catch (e) {
        azimut = 0.0;
    }

    //  Ajuste del angulo de conformidad con la condicion sin(lon2-lon1)
    if (sin(lon2Rad - lon1Rad) < 0) {
        azimut = 360.0 - (azimut * valorRadian);
    } else {
        azimut = azimut * valorRadian;
    }

    if(d1 > radioPerimetro){
      print('La coordenada 1 está fuera del perímetro de $radioPerimetro mtrs');
    } else {
      print('La coordenada 1 está dentro del perímetro de $radioPerimetro mtrs');
    }

    // Devuelve la distancia y el ángulo
    return 'Distancia: ${d.toStringAsFixed(4)} mtrs.\nAngulo   : ${azimut.toStringAsFixed(1)} grados'; 
}
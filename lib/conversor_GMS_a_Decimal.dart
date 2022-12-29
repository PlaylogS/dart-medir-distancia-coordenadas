dms2dec(int grad, int min, int seg){
    //convierte coordenadas de grados minutos a segundos a decimal
    final double dec;
  
    if (grad > 0){
      dec = grad + min/60.0 + seg/3600.0;
    } else {
        dec = grad - min/60.0 - seg/3600.0;
    }
    return dec;
 }

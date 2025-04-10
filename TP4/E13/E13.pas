
Program E13;
Procedure horaFinal(horas,minutos,segundos:word;segun2:word;Var horaF,minutoF,segundosF:word);

Begin
   // Sumamos los segundos iniciales con los transcurridos

   segundosF := segundos+segun2;
   minutoF := minutos;
   horaF := horas;
   // Ajuste de segundos a minutos

   minutoF := minutoF+(segundosF Div 60);
   segundosF := segundosF Mod 60;
   // Ajuste de minutos a horas
   horaF := horaF +(minutoF Div 60);
   minutoF := minutoF Mod 60;
   horaF := horaF Mod 24;

End;

Var 
   horas,horaf,minuto,minutof,segundos,segundosF:  word;
   segun2:  word;
Begin
   WriteLn('ingrese la hora inicial hora/minuto/segundo');

   ReadLn(horas,minuto,segundos);
   WriteLn('ingrese la cantidad de segundos a aniadir');
   ReadLn(segun2);
   horaFinal(horas,minuto,segundos,segun2,horaf,minutof,segundosF);
   WriteLn('la hora final es :',horaf,':',minutof,':',segundosF);

End.

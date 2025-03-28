
Program E16;

Const 
   lt =  5;

Var 
   N,i,j,viajes:  byte;
   patente,maxpatente:  string[10];
   litros:  real;
   maxlitros,minlitros:  real;
   km:  real;
   sum,minsum:  real;

Begin
   maxlitros := 0;
   minsum := 999999;
   WriteLn('ingrese la cantidad de vehiculos');
   ReadLn(N);
   For i:= 1 To N Do
      Begin
         sum := 0;
         WriteLn('ingrese la patente del vehiculo ',i);
         ReadLn(patente);
         WriteLn('ingrese la cantidad de viajes q realizo el vehiculo',i);
         ReadLn(viajes);
         For j:=1 To viajes Do
            Begin
               WriteLn('ingrese la cantidad de kms recorridos en el viaje ',j);
               ReadLn(km);
               sum := sum+km;
            End;
         litros := sum*lt;

         If minsum>sum Then
            Begin
               minsum := sum;
               minlitros := litros
            End;


         If litros>maxlitros Then
            Begin
               maxlitros := litros;
               maxpatente := patente;
            End;
         WriteLn('vehiculo',1,' Patente: ',patente,' Consumo:',litros:8:2,
                 ' lt/km');
      End;
   WriteLn('la patente del vehiculo que mas litros consumio fue ',maxpatente);
   WriteLn(





'el total de litros consumidos por el vehiculo que menos kilometros recorrio fue:'
           ,minlitros:8:2);
   ReadLn()
End.

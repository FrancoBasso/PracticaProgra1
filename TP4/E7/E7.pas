
Program E7;
Function impuesto(impt:real;tipo:char):  real;
Begin
   If tipo='S' Then
      impuesto := impt*0.21

   Else
      If tipo='N' Then
         impuesto := impt*0.31;
End;

Var 
   nombre,nommax:  string[10];
   tipo:  char;
   importe:  real;
   importetotal,impmin:  real;
   i,n:  byte;
Begin
   impmin := 99999999;
   WriteLn('ingrese la cantidad de meses regitrados');
   ReadLn(N);
   Repeat
      WriteLn('ingrese el nombre del comercio');
      ReadLn(nombre);
      WriteLn('ingrese si es responsable inscripto');
      ReadLn(tipo);
      tipo := upcase(tipo);
      For i:=1 To N Do
         Begin
            WriteLn('ingrese el importe faturado en el mes ',i);
            ReadLn(importe);
            importetotal := importetotal+importe;
         End;
      If importetotal<impmin Then
         Begin
            impmin := importetotal;
            nommax := nombre;
         End;

      If tipo='S' Then

         WriteLn(nombre,' responsable inscripto pago de iva : $ ',impuesto(importetotal,tipo):  8:  2)

                                                                                                    Else
                                                                                                       Begin
                                                                                                          WriteLn(nombre
                                                                                                                  ,
                                                                         ' no es responsable inscripto pago de iva : $ '
                                                                                                                  ,
                                                                                                                impuesto
                                                                                                                  (
                                                                                                            importetotal
                                                                                                                  ,tipo)
                                                                                                          :  8:  2);


                                                                                                       End;

   Until nombre='****';

   WriteLn('el comercio que menos facturo fue ',nommax);
End.

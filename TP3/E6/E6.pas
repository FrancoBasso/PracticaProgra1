
Program E6;

Var 
   movimiento:  char;
   monto:  real;
   Saldo:  real;
   cont:  byte;
Begin
   WriteLn('ingrese el saldo disponible');
   ReadLn(saldo);
   WriteLn('ingrese el tipo de movimiento D/R/F');
   ReadLn(movimiento);
   cont := 0;
   While upcase(movimiento)<>'F' Do
      Begin
         WriteLn('ingrese el monto');
         ReadLn(monto);
         If upcase(movimiento)='D' Then
            Saldo := saldo+monto
         Else
            If upcase(movimiento)='R' Then
               Saldo := Saldo-monto;
         If Saldo<=0 Then
            cont := cont+1;

         WriteLn('ingrese el tipo de movimiento D/R/F');
         ReadLn(movimiento);


      End;
   WriteLn('el saldo final fue de ',Saldo:8:2);
   WriteLn('la cantidad de veces que la cuenta se quedo sin saldo fue de :',cont
           ,'veces.');
End.

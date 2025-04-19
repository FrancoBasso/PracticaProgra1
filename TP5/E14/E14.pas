
Program E14;

Const 
   maxE =  50;

Type 
   st7 =  string[7];
   TVP =  array[1..maxE] Of st7;
   TVR =  array[1..maxE] Of real;
Procedure Leearchivo(Var Vpatente:TVP;Var Vrec:TVR;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e14.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         N := N+1;
         ReadLn(arch,Vpatente[N],Vrec[N]);
      End;
   Close(arch);
End;
Function promedio (Vrec:TVR;N:byte):  real;

Var 
   i:  Byte;
   suma:  real;
Begin
   suma := 0;
   For i:=1 To N Do
      suma := suma+Vrec[i];
   promedio := suma/N;
End;
Procedure recX(Vpatente:TVP;Vrec:TVR;N:byte;X:real);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Begin
         If Vrec[i]>X Then
            WriteLn(Vpatente[i]);

      End;
End;
Function pateneteMenos(Vpatente:TVP;Vrec:TVR;N:byte):  st7;

Var 
   i:  byte;
   min:  real;
   pos:  byte;
Begin
   min := Vrec[1];
   pos := 1;
   For i:=1 To N Do
      If Vrec[i]<min Then
         Begin
            min := Vrec[i];
            pos := i;
         End;
   pateneteMenos := Vpatente[pos];
End;

Var 
   Vpatente:  TVP;
   Vrec:  TVR;
   X:  real;
   N:  byte;
Begin
   Leearchivo(Vpatente,Vrec,N);
   WriteLn('el promedio recaudado por auto es',promedio(Vrec,N):  8:  2);
   WriteLn('ingrese el valor de X');

   ReadLn(X);
   recX(Vpatente,Vrec,N,X);
   WriteLn('la patente que menos recaudo fue: ',pateneteMenos(Vpatente,Vrec,N));


End.

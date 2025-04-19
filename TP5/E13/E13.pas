
Program E13;

Const 
   MaxE =  50;
   moto =  1500;
   auto =  3000;
   camion =  4700;
   colectivo =  3900;

Type 
   TVC =  array[1..MaxE] Of word;
   TVA =  array[1..MaxE] Of real;

Procedure inicia(Var vcont:TVC;Var Vacum:TVA;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Begin
         Vcont[i] := 0;
         Vacum[i] := 0;

      End;
End;
Procedure Leearchivo(Var Vcont:TVC;Var Vacum:TVA);

Var 
   hora:  byte;
   pos:  byte;
   tipo:  byte;
   extra:  real;
   arch:  text;
Begin
   Assign(arch,'tp5e13.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         readln(arch,pos,tipo,hora);
         If hora In [10..18] Then
            extra := 1.10
         Else
            extra := 1;
         Vcont[pos] := Vcont[pos]+1;

         Case tipo Of 
            1,3:  Vacum[pos] := Vacum[pos]+ auto*extra;
            2:  Vacum[pos] := Vacum[pos]+ moto*extra;
            4:  Vacum[pos] := Vacum[pos]+ camion*extra;
            5:  Vacum[pos] := Vacum[pos]+ colectivo*extra;
         End;




      End;
   Close(arch);
End;
Procedure cuantos(Vcont:TVC;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Begin
         WriteLn('la cabina  ',i,' atendio a ',Vcont[i],' vehiculos');
      End;
End;
Function maximo(Vacum:TVA;N:Byte):  byte;

Var 
   i:  byte;
   pos:  Byte;
   max:  real;
Begin
   max := Vacum[1];
   pos := 1;
   For i:=2 To N Do
      If Vacum[i]>max Then
         Begin
            max := Vacum[i];
            pos := i;
         End;
   maximo := pos;
End;

Var 
   Vcont:  TVC;
   Vacum:  TVA;
   N:  byte;

Begin
   WriteLn('ingrese la cantidad de cabinas');
   ReadLn(N);
   inicia(Vcont,Vacum,N);
   Leearchivo(Vcont,Vacum);
   cuantos(Vcont,N);
   WriteLn('la cabina que mas recaudo fue: ',maximo(Vacum,N));

End.

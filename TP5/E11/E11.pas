
Program E11;

Const 
   maxE =  50;
   N =  10;
   VN:  array[1..10] Of string[10] =  ('Juan','pablo','Pedro','Jesus','javier','alejandro','tomas','lucia','magali',
                                       'delfina');
   VL1:  array[1..10] Of real =  (80.2,120.3,100.1,90.45,200.3,124.1,60.6,200.5,30.2,250.5);
   VL2:  array[1..10] Of real =  (100,130.3,80.1,190.45,100.3,127.1,70.6,203.5,60.2,252.5);


Type 
   st10 =  string[10];
   TVN =  array[1..maxE] Of st10;
   TVL =  array [1..maxE] Of real;
Function cuantos (N:byte):  byte;

Var 
   i:  Byte;
   cont:  byte;
Begin

   cont := 0;
   For i:= 1 To N Do

      If Vl2[i]>VL1[i] Then
         cont := cont+1;
   cuantos := cont;

End;
Function mejorMarca(N:byte):  st10;

Var 
   i:  byte;
   nom:  st10;
   max:  real;
Begin
   max := VL1[1];
   If vl2[1]>max Then
      max := vl2[1];
   nom := VN[1];
   For i:=2 To N Do
      Begin
         If Vl1[i]>Vl2[2] Then
            If vl1[i]>max Then
               Begin
                  max := vl1[i];
                  nom := vn[i]
               End
         Else
            If vl2[i]>max Then
               Begin
                  max := vl2[i];
                  nom := vn[i];
               End
         Else
            If vl1[i]=vl2[i] Then
               If vl1[i]>max Then
                  Begin
                     max := vl1[i];
                     nom := vn[i]
                  End

      End;
   mejorMarca := nom;
End;
Procedure marca(nombre:st10;N:byte);

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (nombre<>VN[i]) Do
      i := i+1;
   If i<=N Then
      Begin
         WriteLn('1era marca',Vl1[i]:8:2);
         WriteLn('2da marca ',vl2[i]:8:2);
      End
   Else
      WriteLn('el nombre ingresado no esta en la lista de participantes');
End;
Procedure generarOtro(N:byte;X:real;Var M:byte;Var Vnombre:TVN);

Var 
   i:  byte;
Begin
   M := 0;
   For i:=1 To N Do
      Begin
         If (Vl1[i]>X) Or (Vl2[i]>X) Then
            Begin
               M := M+1;
               Vnombre[m] := VN[i];
            End;

      End;

End;
Procedure mostrar(vec:TVN;N:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      WriteLn(vec[i]);

End;

Var 
   Vnombre:  TVN;
   M:  byte;
   nombre:  ST10;
   X:  real;
Begin
   WriteLn('la cantidad de competidores que superaron el lanzamiento 1 con el 2do fue de ',cuantos(N));
   WriteLn('el atleta que registro la mejor marca fue de :',mejorMarca(N));
   WriteLn('ingrese el nombre de un atleta que desea saber la mejor marca');
   ReadLn(nombre);
   marca(nombre,N);
   WriteLn('ingrese eun valor X a superar');
   ReadLn(X);
   WriteLn('los competidres son');

   WriteLn('aquellos que pasaron a la semifinal fueron:');
   generarOtro(N,X,M,Vnombre);
   mostrar(Vnombre,M);
End.

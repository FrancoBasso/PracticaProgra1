
Program E5;

Const 
   maxE =  50;
   Vec:  array [1..10] Of integer =  (15,23,45,75,22,89,100,223,78,90);

Type 
   TV =  array[1..10] Of integer;
Function suma(V:TV;N:byte):  Integer;
Begin
   If N=0 Then
      suma := 0
   Else
      suma := Vec[N]+suma(V,N-1);
End;
Procedure mostrarinverso(V:TV;N:byte);
Begin
   Write(V[N]:5);
   If N>1 Then
      mostrarinverso(V,N-1);
End;
Procedure mostrar (V:TV;N:byte);
Begin
   If N>1 Then
      mostrar(V,N-1);
   Write(V[N]:5);
End;
Function maximo(V:TV;N:byte):  Integer;
Begin
   If N=1 Then
      maximo := V[N]
   Else
      If V[N]>maximo(V,N-1) Then
         maximo := V[N]
   Else
      maximo := maximo(V,N-1)
End;

Var 
   N:  byte;

Begin
   WriteLn('ingrese el largo del vector');
   ReadLn(N);
   WriteLn('la suma de todos sus elementos es:',suma(vec,N));

   mostrar(vec,N);

   WriteLn();
   mostrarinverso(vec,N);
   WriteLn();
   WriteLn('el maximo elemento es ',maximo(vec,N));
   WriteLn('el promedio es :',suma(Vec,N)/N:  8:  2);
End.

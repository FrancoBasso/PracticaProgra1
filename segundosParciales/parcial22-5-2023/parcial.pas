
Program parcial;

Const 
   maxE =  50;
   N =  5;  { niveles }
   M =  3;  { plazas }

Type 
   Treg =  Record
      nivel:  byte;
      totAutos:  byte;
      Tprom:  real;
   End;
   TMA =  array[1..maxe,1..maxe] Of Byte;
   TMH =  array[1..maxe,1..maxe] Of real;
   TR =  array[1..maxE] Of Treg;
Procedure CargarMatrices(Var A: TMA; Var H: TMH);
Begin
  { MatAutos }
   A[1,1] := 4;
   A[1,2] := 5;
   A[1,3] := 15;
   A[2,1] := 0;
   A[2,2] := 0;
   A[2,3] := 3;
   A[3,1] := 10;
   A[3,2] := 3;
   A[3,3] := 9;
   A[4,1] := 1;
   A[4,2] := 0;
   A[4,3] := 9;
   A[5,1] := 2;
   A[5,2] := 1;
   A[5,3] := 3;

  { MatHoras }
   H[1,1] := 9.5;
   H[1,2] := 15;
   H[1,3] := 20;
   H[2,1] := 6;
   H[2,2] := 0;
   H[2,3] := 24;
   H[3,1] := 15.3;
   H[3,2] := 10.5;
   H[3,3] := 9;
   H[4,1] := 12;
   H[4,2] := 11;
   H[4,3] := 14;
   H[5,1] := 4;
   H[5,2] := 1;
   H[5,3] := 6.5;
End;
Procedure MostrarMatrices(matA: TMA; matH: TMH);

Var 
   i, j:  integer;
Begin
   writeln('Matriz MatAutos:');
   For i := 1 To N Do
      Begin
         For j := 1 To M Do
            write(matA[i,j]:4);
         writeln;
      End;

   writeln;
   writeln('Matriz MatHoras:');
   For i := 1 To N Do
      Begin
         For j := 1 To M Do
            write(matH[i,j]:6:1);
         writeln;
      End;
End;

Procedure generarOtro(Var Vniveles:TR;Var L:byte;matA:TMA;matH:TMH;N,M:byte);

Var 
   i,j:  byte;
   totAutos:  Byte;
   tothoras:  real;
Begin
   L := 0;
   For i:=1 To N Do
      Begin
         j := 1;
         totAutos := 0;
         tothoras := 0;
         While (j<=N) And (matA[i,j]<>0) Do
            Begin
               totAutos := totAutos + matA[i,j];
               tothoras := tothoras + matH[i,j];
               j := j+1;

            End;

         If j>M Then
            Begin
               L := L+1;
               Vniveles[L].nivel := i;
               Vniveles[l].totAutos := totAutos;
               Vniveles[L].Tprom := tothoras/totAutos;
            End;
      End;
End;
Procedure mostrar(Vniveles:TR;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do

      WriteLn('para el nivel ',Vniveles[i].nivel,' hay ',Vniveles[i].totAutos,'Autos con un promedio de',Vniveles[i].
              Tprom:5:2,' por auto');

End;
Function cumple(matA:TMA;N,m,X:byte):  Boolean;
Begin
   If M=0 Then
      cumple := False
   Else
      If matA[N,m]>X Then
         cumple := True
   Else
      cumple := cumple(matA,N,M-1,X);
End;

Function cuantosNiveles(matA:TMA;N,M:byte;X:byte):  byte;
Begin
   If N=0 Then
      cuantosNiveles := 0
   Else
      If cumple(matA,N,M,X) Then
         cuantosNiveles := 1 + cuantosNiveles(matA,N-1,M,X)
   Else
      cuantosNiveles := cuantosNiveles(matA,N-1,M,X);
End;


Var 
   matA:  TMA;
   matH:  TMH;
   Vniveles:  TR;
   X,L:  byte;
Begin
   CargarMatrices(MatA, MatH);
   MostrarMatrices(MatA, MatH);

   generarOtro(Vniveles,l,matA,matH,N,M);
   mostrar(Vniveles,L);
   WriteLn('ingrese el valor de X');
   ReadLn(X);
   WriteLn('la cantidad de niveles que tienen una plaza superior al valor X fue de :',cuantosNiveles(matA,N,M,X));

End.

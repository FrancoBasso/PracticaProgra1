
Program ER;

Const 
   maxE =  50;
   N =  4;

Type 
   TM =  array[1..N, 1..N] Of integer;

Procedure CargarMatrizPrueba(Var M: TM);
Begin
   M[1,1] :=  0;
   M[1,2] :=  5;
   M[1,3] :=  2;
   M[1,4] :=  7;
   M[2,1] :=  5;
   M[2,2] :=  0;
   M[2,3] :=  8;
   M[2,4] := 10;
   M[3,1] :=  3;
   M[3,2] :=  8;
   M[3,3] :=  0;
   M[3,4] :=  6;
   M[4,1] :=  7;
   M[4,2] :=  4;
   M[4,3] :=  6;
   M[4,4] :=  0;
End;

Procedure MostrarMatriz(M: TM);

Var 
   i, j:  integer;
Begin
   writeln('Matriz de prueba:');
   For i := 1 To N Do
      Begin
         For j := 1 To N Do
            write(M[i, j]:5);
         writeln;
      End;
End;







Function suma(mat:TM;i,j,N:byte):  integer;
Begin
   If i=0 Then
      suma := 0
   Else
      If j>i Then
         Begin
            If (mat[i,j]>0) And (mat[i,j]=mat[j,i]) Then
               suma := mat[i,j]+ suma(mat,i,j-1,N)
            Else
               suma := suma(mat,i,j-1,N);
         End
   Else
      suma := suma(mat,i-1,N,N);
End;

Var 
   mat:  TM;

Begin
   Randomize;
   CargarMatrizPrueba(mat);
   MostrarMatriz(mat);


   WriteLn(suma(mat,N,N,N));
End.

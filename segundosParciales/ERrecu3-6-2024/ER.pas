
Program ER;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of word;
Procedure CargarMatrizCuadradaAleatoria(Var Mat: TM; Var N: byte);

Var 
   i, j:  byte;
Begin
   Randomize;
   N := Random(5) + 2;
   // N entre 2 y 6
   writeln('Generando matriz cuadrada aleatoria de ', N, 'x', N);
   For i := 1 To N Do
      For j := 1 To N Do
         Mat[i, j] := Random(100) + 1;
   // Valores positivos entre 1 y 100
End;
Procedure MostrarMatriz(Mat: TM; N: byte);

Var 
   i, j:  byte;
Begin
   writeln('Matriz generada:');
   For i := 1 To N Do
      Begin
         For j := 1 To N Do
            write(Mat[i, j]:5);
         writeln;
      End;
End;
Function suma(mat:TM;i,j,N:byte):  Integer;
Begin
   If i=0 Then
      suma := 0
   Else
      If i<>j Then
         suma := mat[i,j] + suma(mat,i,j-1,N)


   Else
      suma := suma(mat,i-1,N,N);
End;
Function cumple(mat:TM;i,j:byte;promedio:real):  boolean;
Begin
   If i=0 Then
      cumple := false
   Else
      If mat[i,j]>promedio Then
         cumple := true
   Else
      cumple := cumple(mat,i-1,j,promedio);
End;
Function cuenta(mat:TM;i,j:byte;promedio:real):  byte;
Begin
   If j=0 Then
      cuenta := 0
   Else
      If cumple(mat,i,j,promedio) Then
         cuenta := 1 + cuenta(mat,i,j-1,promedio)
   Else
      cuenta := cuenta(mat,i,j-1,promedio);
End;

Var 
   mat:  TM;
   N:  byte;
   promedio:  real;
   sumar:  integer;
Begin
   CargarMatrizCuadradaAleatoria(mat,N);
   MostrarMatriz(mat,N);
   sumar := suma(mat,N,N,N);
   WriteLn(sumar);
   promedio := sumar/((N*(N-1))/2);
   WriteLn('la cantidad de columnas con algun elemento mayor a ',promedio:5:2,' es ',cuenta(mat,N,N,promedio));
End.

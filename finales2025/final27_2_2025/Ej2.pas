
Program Ej2;

Const 
   maxE =  50;

Type 
   Tmat =  array[1..maxE,1..maxE] Of real;
   TV =  array[1..maxE] Of real;
Procedure cargarDatosAuto(Var A: Tmat; Var Vec: TV; Var N, M: byte);

Var 
   i, j:  byte;
Begin
   Randomize;
   N := 4 + Random(3);
   // Genera entre 4 y 6 filas
   M := 3 + Random(3);
   // Genera entre 3 y 5 columnas

   writeln('Matriz A de ', N, ' filas y ', M, ' columnas:');
   For i := 1 To N Do
      Begin
         For j := 1 To M Do
            Begin
               A[i, j] := Random(41) + 10;
               // valores reales entre 10 y 50
               Write(A[i, j]:6:1, ' ');
            End;
         Writeln;
      End;

   writeln(#10, 'Vector de comparación (', M, ' elementos):');
   For j := 1 To M Do
      Begin
         Vec[j] := Random(41) + 10;
         // valores reales entre 10 y 50
         Write('Vec[', j, '] = ', Vec[j]:6:1, #10);
      End;
End;


Function cantidadColumnas(A:Tmat;i,j,N:byte;suma:real;cant:byte;Vec:TV):  byte;
Begin
   If j=0 Then
      cantidadColumnas := 0
   Else
      If i=0 Then
         Begin
            If (cant>0) And ((suma/cant)>Vec[j]) Then
               cantidadColumnas := 1 + cantidadColumnas(A,N,j-1,N,0,0,Vec)
            Else
               cantidadColumnas :=    cantidadColumnas(A,N,j-1,N,0,0,Vec)
         End
   Else
      If (i Mod 2 =0) Then
         cantidadColumnas := cantidadColumnas(A,i-2,j,N,suma + A[i,j],cant+1,vec)
   Else
      cantidadColumnas := cantidadColumnas(A,i-1,j,N,suma,cant,vec);


End;

Var 
   a:  Tmat;
   Vec:  TV;
   M,N:  byte;
Begin
   cargarDatosAuto(A,vec,N,M);
   WriteLn('la cantidad de columnas que su promedio es mayor es de :', cantidadColumnas(A,N,M,N,0,0,vec));

End.

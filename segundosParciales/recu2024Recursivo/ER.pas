

Program ER;

Type 
   tm =  array[1..100,1..100] Of word;

Procedure CrearYMostrarMatriz(Var matriz: tm; n, m: Integer);

Var 
   i, j:  Integer;
Begin
   Randomize;
   // Inicializa el generador de números aleatorios
   writeln('Matriz de ', n, 'x', m, ' con valores aleatorios:');
   For i := 1 To n Do
      Begin
         For j := 1 To m Do
            Begin
               matriz[i][j] := Random(100);
               // Números aleatorios del 0 al 99
               write(matriz[i][j]:4);
            End;
         writeln;
      End;
End;

Function mayorxfila(mat:tm;i,j:byte):  word;

Var 
   aux:  word;
Begin
   If j=0 Then
      mayorxfila := 0
   Else
      Begin
         If j Mod 2<>0 Then
            mayorxfila := mayorxfila(mat,i,j-1)
                          //si no es una columna par avanza sin mas
         Else
            Begin
               aux := mayorxfila(mat,i,j-2);
               // si es una columna par con el valor que va a ser comparado avanza de a 2
               If (aux<mat[i,j]) And (odd(mat[i,j])) Then
                  mayorxfila := mat[i,j]
                                //si cumple la condicion le da ese lugar a lo que hay en la matriz en ese momento
               Else
                  mayorxfila := aux;
               // sino cumple ,se queda con el valor de aux 
            End;
      End;
End;

Function filamayor(mat:tm;i,j:byte;maxact:word):  byte;

Var 
   aux,probmax:  word;
Begin
   If i=0 Then
      filamayor := 0
   Else
      Begin
         probmax := mayorxfila(mat,i,j);
         If probmax>maxact Then
            Begin
               aux := filamayor(mat,i-1,j,probmax);
               If aux=0 Then
                  filamayor := i
               Else
                  filamayor := aux
            End
         Else
            filamayor := filamayor(mat,i-1,j,maxact);
      End;
End;

Var 
   mat:  tm;
   n,m:  byte;
Begin
   n := 3;
   m := 5;
   CrearYMostrarMatriz(mat,n,m);
   WriteLn('El maximo impar en posiciones pares de la fila 1 es: ',mayorxfila(mat,1,m));
   writeln('La fila es ',filamayor(mat,n,m,0));
   readln;
End.

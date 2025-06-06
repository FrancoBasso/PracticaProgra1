
Program ER;

Const 
   maxE =  50;

Type 
   Treg =  Record
      posi,posj:  byte;
   End;
   TM =  array[1..maxE,1..maxE] Of integer;
   TV =  array[1..maxE] Of Treg;
Procedure CargarMatrizAleatoria(Var Mat: TM; Var N, M: byte);

Var 
   i, j:  byte;
Begin
   Randomize;
   // Inicializa la semilla de números aleatorios

   N := Random(5) + 2;
   // Entre 2 y 6 filas
   M := Random(5) + 2;
   // Entre 2 y 6 columnas

   writeln('Generando matriz aleatoria de ', N, 'x', M);

   For i := 1 To N Do
      For j := 1 To M Do
         Mat[i, j] := Random(101) - 50;
   // Números entre -50 y +50
End;

Procedure minfila(mat:TM;N,M:byte;Var suma:integer;Var posj:byte);
Begin
   If M=1 Then
      Begin
         posj := 1;
         suma := mat[N,M];
      End
   Else
      minfila(mat,N,M-1,suma,posj);
   suma := suma + mat[M,M];
   If mat[N,M]<mat[N,posj] Then
      posj := M;
End;
Procedure generar(mat:TM;N,M:byte;Var Vgen:TV;Var L:byte);

Var 
   suma:  integer;
   posj:  byte;
Begin
   If N=0 Then
      L := 0
   Else
      Begin
         generar(mat,N-1,M,Vgen,L);
         minfila(mat,N,M,suma,posj);
         If suma>0 Then
            Begin
               L := L+1;
               Vgen[L].posi := N;
               Vgen[L].posj := posj;
            End;
      End;

End;
Procedure MostrarMatriz(Mat: TM; N, M: byte);

Var 
   i, j:  byte;
Begin
   writeln('Matriz generada:');
   For i := 1 To N Do
      Begin
         For j := 1 To M Do
            write(Mat[i, j]:5);
         writeln;
      End;
End;
Procedure MostrarResultado(Vgen: TV; L: byte);

Var 
   i:  byte;
Begin
   writeln('Posiciones del mínimo de cada fila con suma positiva:');
   For i := 1 To L Do
      writeln('Fila: ', Vgen[i].posi, ' - Posición mínima (columna): ', Vgen[i].posj);
End;


Var 
   Mat:  TM;
   Vgen:  TV;
   N, M, L:  byte;

Begin
   CargarMatrizAleatoria(Mat, N, M);
   MostrarMatriz(Mat, N, M);

   generar(Mat, N, M, Vgen, L);
   MostrarResultado(Vgen, L);
End.

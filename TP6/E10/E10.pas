
Program E10;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of real;
   Tfunc =  Function (mat:TM;index,N:byte):  real;
Function PromedioFila(Mat: TM; fila, N: Byte):  Real;

Var 
   i:  Byte;
   suma:  Real;
Begin
   suma := 0;
   For i := 1 To N Do
      suma := suma + Mat[fila, i];
   PromedioFila := suma / N;
End;

Function PromedioColumna(Mat: TM; col, N: Byte):  Real;

Var 
   i:  Byte;
   suma:  Real;
Begin
   suma := 0;
   For i := 1 To N Do
      suma := suma + Mat[i, col];
   PromedioColumna := suma / N;
End;
Procedure Maximo(Mat: TM; N: Byte; Func: TFunc; Var maxk: Byte);

Var 
   max, prom:  Real;
   k:  Byte;
Begin
   max := Func(Mat, 1, N);
   maxk := 1;
   For k := 2 To N Do
      Begin
         prom := Func(Mat, k, N);
         If max < prom Then
            Begin
               max := prom;
               maxk := k;
            End;
      End;
End;

Var 
   Mat:  TM;
   N,i,j, filaMax, colMax:  Byte;

Begin


   Write('Ingrese la dimensión de la matriz (N x N): ');
   ReadLn(N);

   // Cargar matriz
   For i := 1 To N Do
      For j := 1 To N Do
         Begin
            Write('Mat[', i, ',', j, ']: ');
            Read(Mat[i, j]);
         End;

   // Calcular fila de mayor promedio
   Maximo(Mat, N, @PromedioFila, filaMax);
   WriteLn('La fila con mayor promedio es la: ', filaMax);

   // Calcular columna de mayor promedio
   Maximo(Mat, N, @PromedioColumna, colMax);
   WriteLn('La columna con mayor promedio es la: ', colMax);

   ReadLn;
End.

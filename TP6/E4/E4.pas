
Program E4;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of integer;
Procedure incializa (Var mat:TM);

Var 
   i,j:  byte;
Begin
   For i := 1 To maxE Do
      For j := 1 To maxE Do
         mat[i, j] := 0;

End;
Procedure Leearch(Var mat:TM;Var N,M:byte);

Var 
   arch:  text;
   fila,col:  byte;
Begin
   Assign(arch,'datos.txt');
   Reset(arch);
   N := 0;
   M := 0;

   While Not eof(arch) Do
      Begin
         ReadLn(arch,fila,col,mat[fila,col]);
         If N<fila Then
            N := fila;
         If col>M Then
            M := col;

      End;
   Close(arch);

End;
Procedure mostrarMatriz(mat:TM;N,Y:byte);

Var 
   i,j:  byte;
Begin
   For i:= 1 To N Do
      Begin
         For j:= 1 To y Do
            Write(mat[i,j]:5);
         Writeln();
      End;
End;
Function triangularinferior(mat:TM;N,M:byte):  Boolean;
//recorre por columna

Var 
   i,j:  byte;
   valid:  Boolean;
Begin
   j := 2;
   valid := true;
   While (j<=M) And valid Do
      Begin
         i := 1;
         While (i<=j-1) And (mat[i,j]=0) Do
            i := i+1;
         If (i>j-1) Then
            j := j+1
         Else
            valid := false;
      End;
   triangularinferior := valid;

End;


Var 
   mat:  TM;
   N,M:  byte;
Begin
   incializa(mat);
   Leearch(mat,N,M);

   mostrarMatriz(mat,N,M);
   If N=M Then
      Begin
         If triangularInferior(mat,N,M) Then
            WriteLn('la matriz es triangular inferior')
         Else
            WriteLn('la matriz no es triangular inferior')
      End
   Else
      WriteLn('la matriz no es cuadrada');


End.

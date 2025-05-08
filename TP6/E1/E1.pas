
Program E1;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of Integer;
   TV =  array[1..maxE] Of integer;
Procedure Leearch(Var mat:TM;Var N,M:byte);

Var 
   arch:  text;
   i,j:  byte;
Begin
   Assign(arch,'elementos.txt');
   Reset(arch);
   ReadLn(arch,N,M);
   For i:=1 To N Do
      Begin
         For j:=1 To M Do
            read(arch,mat[i,j]);
         ReadLn(arch);
      End;
   Close(arch);
End;
Procedure maxFila(mat:TM;Var vec:TV;N,M:byte);

Var 
   max:  integer;
   i,j:  byte;
Begin
   For i:= 1 To N Do
      Begin
         max := mat[i,1];
         For j:= 2 To M Do
            If mat[i,j]>max Then
               max := mat[i,j];
         vec[i] := max;
      End;
End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i := 1 To N Do
      Write(vec[i]:5);
End;
Procedure sumaImpares(mat:TM;N,M:byte;Var Vec2:TV;Var L:byte);

Var 
   suma:  integer;
   i,j:  byte;
Begin
   L := 0;
   For j:= 1 To M Do
      Begin
         suma := 0;
         For i:= 1 To N Do
            If odd(mat[i,j]) Then
               suma := suma+mat[i,j];
         If suma>0 Then
            Begin
               L := L+1;
               vec2[L] := suma;
            End;

      End;
End;
Function promColumn(mat:TM;N,X:byte):  real;

Var 
   i:  byte;
   suma:  integer;
Begin
   suma := 0;
   For i:= 1 To N Do
      suma := suma + mat[i,X];
   promColumn := suma/N;

End;

Var 
   mat:  TM;
   vec,vec2:  TV;
   N,M,L,X:  byte;

Begin
   Leearch(mat,N,M);
   maxFila(mat,vec,N,M);

   mostrar(vec,N);
   WriteLn();

   sumaImpares(mat,N,M,vec2,L);
   WriteLn();

   mostrar(vec2,L);
   WriteLn('ingrese una columna');
   readln(X);
   WriteLn('el promedio de la columna es ',promColumn(mat,N,X):  8:  2);
End.

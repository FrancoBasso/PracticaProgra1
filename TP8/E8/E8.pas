
Program E8;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of integer;
   TV =  array[1..maxE] Of integer;
Procedure LeeMatriz(Var mat:TM;N:byte);

Var 
   arch:  text;
   i,j:  byte;
Begin
   Assign(arch,'matriz.txt');
   Reset(arch);
   For i:= 1 To N Do
      Begin
         For j:= 1 To N Do
            Read(arch,mat[i,j]);
         ReadLn(arch);
      End;
   Close(arch);
End;



Function maximo(mat:TM;filaF,j:byte):  integer;
Begin
   If J=1 Then
      maximo := mat[filaF,j]
   Else
      Begin
         If mat[filaF,j]>maximo(mat,filaF,j-1) Then
            maximo := mat[filaF,j]
         Else
            maximo := maximo(mat,filaF,j-1);
      End;

End;
Procedure maximmoporfila(mat:TM;N,M:byte;Var Vec:TV);
Begin

   If N>0 Then
      maximmoporfila(mat,N-1,M,Vec);
   Vec[N] := maximo(mat,N,M);

End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Writeln(vec[i]:5);
End;

Var 
   mat:  TM;
   N:  byte;
   vec:  TV;
Begin
   WriteLn('ingrese el tanio de la matriz');
   ReadLn(N);
   LeeMatriz(mat,N);
   maximmoporfila(mat,N,N,vec);
   mostrar(vec,N);

End.

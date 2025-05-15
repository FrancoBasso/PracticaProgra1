
Program E7;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of integer;
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
Function minimo(mat:TM;i,j,N:byte):  integer;
Begin
   If (i=1) And (j=1) Then
      minimo := mat[i,j]
   Else
      If j>=1 Then
         Begin
            If mat[i,j]<minimo(mat,i,j-1,N) Then
               minimo := mat[i,j]
            Else
               minimo := minimo(mat,i,j-1,N);
         End
   Else
      minimo := minimo(mat,i-1,N,N);

End;

Var 
   mat:  TM;
   N:  byte;
Begin
   WriteLn('ingrese el tamanio de la matriz');
   ReadLn(N);
   LeeMatriz(mat,N);
   WriteLn('el minimo elemento es: ',minimo(mat,N,N,N));
End.

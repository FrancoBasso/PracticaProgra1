
Program E17;

Const 
   maxE =  50;

Type 
   st30 =  string[30];
   TV =  array[1..maxE] Of st30;
Procedure insertaord(Var vec:TV;Var N:byte;apellido:st30);

Var 
   j:  byte;
Begin
   j := N;
   While (j>=1) And (vec[j]>apellido) Do
      Begin
         vec[j+1] := vec[J];
         j := j-1;
      End;
   Vec[j+1] := apellido;
   N := N+1;
End;
Procedure LeeArchivo(Var vec:TV; Var N:byte);

Var 
   arch:  text;
   apllnom:  st30;
   num:  integer;
   aux:  char;
Begin
   Assign(arch,'tp5e17.txt');
   Reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         ReadLn(arch,num,aux,apllnom);
         If apllnom[1] In ['A'..'F'] Then
            insertaord(vec,N,apllnom);
      End;
End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      WriteLn(vec[i]);
End;

Var 
   vec:  TV;
   N:  byte;
Begin
   LeeArchivo(vec,N);
   mostrar(vec,N);
End.

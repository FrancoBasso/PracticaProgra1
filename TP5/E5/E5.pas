
Program E5;

Const 
   maxE =  50;

Type 
   TV =  array[1..maxE] Of integer;

Procedure Leevector(Var vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e5.txt');
   Reset(arch);
   While Not eof(arch)   Do
      Begin
         N := N+1;
         read(arch,vec[N]);
      End;
   Close(arch);
End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Write(vec[i]:5);
End;
Function maximo(vec:TV;N:byte):  integer;

Var 
   i:  byte;
   max:  Integer;
Begin
   max := vec[1];
   For i:= 2 To N Do
      If vec[i]>max Then
         max := vec[i];
   maximo := max;
End;
Procedure divisor(vec:TV;N:byte;Var V:TV;Var M:byte);

Var 
   i:  byte;
   max:  Integer;
Begin
   max := maximo(vec,N);
   M := 0;
   For i:=1 To N Do
      Begin
         If ((max Mod vec[i])=0)And (vec[i]<>max) Then
            Begin
               M := M+1;
               V[M] := vec[i];

            End;
      End;
End;
Function promedio (V:TV;M:byte):  real;

Var 
   i:  byte;
   sum:  integer;
Begin
   sum := 0;
   For i:= 1 To M Do
      sum := sum+V[i];
   promedio := sum/M;
End;

Var 
   vec,V:  TV;
   N,M:  byte;

Begin
   Leevector(vec,N);
   divisor(vec,N,V,M);
   mostrar(vec,N);
   WriteLN();

   mostrar(V,M);
   WriteLn();
   WriteLn('el promedio de deivisores es: ',promedio(V,M):  8:  2);
End.


Program E9;
Procedure suma_producto(N1,D1,N2,D2:integer);

Var 
   NR,DR:  integer;

Begin
   DR := D1*D2;
   NR := (N1*D2)+(N2*D1);
   WriteLn('suma: ',NR,'/',DR);
   NR := N1*N2;
   WriteLn('producto: ',NR,'/',DR);
End;

Var 
   arch:  text;
   N1,N2,D1,D2:  integer;
Begin
   Assign(arch,'tp4e9.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch,N1,D1,N2,D2);
         suma_producto(n1,D1,N2,D2);
      End;
   Close(arch);
   ReadLn()
End.

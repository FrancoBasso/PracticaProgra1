
Program E2;

Const 
   maxE =  50;

Type 
   TV =  array[1..maxE] Of integer;
Procedure Leevector(Var vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e2.txt');
   Reset(arch);
   While Not eof(arch)   Do
      Begin
         N := N+1;
         read(arch,vec[N]);
      End;
End;

Procedure imparesPares(vec:tv;N:byte; Var V,W:TV;Var L,M:byte);

Var 
   i:  byte;
Begin
   L := 0;
   M := L;
   For i:= 1 To N Do
      Begin
         If odd(vec[i]) Then
            Begin
               L := L+1;
               V[l] := vec[i];
            End
         Else
            Begin
               M := M+1;
               W[M] := vec[i];
            End;

      End;

End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Write(vec[i]:5);
End;

Var 
   vec,V,W:  TV;
   N,L,M:  byte;

Begin
   Leevector(vec,N);
   imparesPares(vec,N,V,W,L,M);
   WriteLn('impares');
   mostrar(V,L);
   WriteLn();
   WriteLn('pares');
   mostrar(W,M);

End.

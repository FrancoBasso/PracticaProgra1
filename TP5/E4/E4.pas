
Program E4;

Const 
   maxE =  50;

Type 
   TV =  array[1..maxE] Of integer;

Procedure Leevector(Var vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e4.txt');
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

Procedure compactar(vec:TV;N:byte;Var V:TV;Var M:byte);

Var 
   i:  byte;
Begin
   M := 0;
   For i:= 1 To N Do

      If vec[i]<>0 Then
         Begin
            M := M+1;
            V[M] := vec[i];

         End;

End;

Var 
   vec,V:  tv;
   N,M:  byte;

Begin

   Leevector(vec,N);
   mostrar(vec,N);
   WriteLn();
   compactar(vec,N,V,M);
   mostrar(V,M);

End.

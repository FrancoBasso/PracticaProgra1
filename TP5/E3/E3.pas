
Program E3;

Const 
   maxE =  50;

Type 
   TV =  array [1..50] Of integer;
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
   Close(arch);
End;
Procedure cambiar(Var vec:TV;N,K:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do

      If vec[i]=k Then
         vec[i] := 0;

End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Write(vec[i]:5);
End;

Var 
   vec:  TV;
   N,k:  byte;


Begin
   Leevector(vec,N);
   WriteLn('ingrese un valor k');
   ReadLn(k);
   cambiar(vec,N,K);
   mostrar(vec,N);
End.


Program E9;

Const 
   maxE =  50;

Type 
   TV =  array [1..maxE] Of integer;

Procedure leearchivo(Var A:TV;Var N:byte);

Var 
   arch:  text;
   num:  integer;
Begin
   Assign(arch,'tp5e9.txt');
   Reset(arch);
   Read(arch,num);
   N := 1;
   A[N] := num;
   While Not eof(arch) Do
      Begin
         Read(arch,num);
         If num>A[N] Then
            Begin
               N := N+1;
               A[N] := num;
            End;

      End;
   Close(arch);
End;
Procedure simetria (A:tv;N:byte;Var B:TV);

Var 
   i,j:  byte;

Begin
   i := 1;
   j := N;
   While (i<=N) And (j>=1) Do
      Begin
         If Not (A[i] Mod A[j]=0) Then
            Begin
               B[j] := 0;
               B[I] := 0;
            End

         Else
            Begin
               B[j] := A[J];
               B[i] := A[I];
            End;
         j := j-1;
         i := i+1;
      End;
End;
Procedure mostrar(A:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      write(A[i]:5)
End;

Var 
   A,B:  TV;
   N:  byte;
Begin
   leearchivo(A,N);
   simetria(A,N,B);
   mostrar(A,N);
   WriteLn();
   mostrar(B,N);

End.

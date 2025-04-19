
Program E8;

Const 
   maxE =  50;
   V:  array [1..10] Of byte =  (2,2,3,3,3,3,7,9,9,9);

Type 
   TV =  array[1..maxE] Of byte;


Procedure ocurrencias(Var W:TV;Var N:byte);

Var 
   i:  byte;
   num:  byte;
Begin
   num := v[1];
   N := 1;
   W[N] := 1;
   For i:= 2 To 10 Do
      Begin
         If num=v[i] Then

            w[N] := W[N]+1
         Else
            If num<v[i] Then
               Begin
                  num := v[i];
                  n := n+1;
                  W[n] := 1;
               End


      End;
End;
Procedure mostrar(w:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      write(W[i]:5)
End;

Var 
   W:  TV;
   N:  byte;
Begin
   ocurrencias(W,N);
   mostrar(W,N)
End.


Program parcial;

Var 
   N:  LongInt;
   i:  LongInt;
   R:  byte;
Begin
   WriteLn('ingrese el valor del numero mayor que 1');
   ReadLn(N);
   WriteLn(trunc(Sqrt(n)));
   i := 2;
   While ((i>=2) And (i<=trunc(Sqrt(n)))) And (N Mod i<>0) Do
      i := i+1;
   If (N Mod i<>0) Then
      WriteLn(0)
   Else
      WriteLn(i);

End.

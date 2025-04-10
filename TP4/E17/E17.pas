
Program E17;
Function primos(N:integer):  boolean;

Var 
   i:  integer;

Begin

   If N<=1 Then
      primos := false

   Else
      Begin
         i := 2;
         While (i<=(N Div 2)) And (N Mod i <>0) Do
            i := i+1;
         If N Mod i=0 Then
            primos := false
         Else
            primos := true;
      End;

End;

Var 
   N:  integer;

Begin
   WriteLn('ingrese un numero');
   ReadLn(N);
   If primos(N) Then
      WriteLn('es un numero primo')
   Else
      WriteLn('no es un numero primo');
   ReadLn();
End.

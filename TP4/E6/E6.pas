
Program E6;
Function aleatorio(A,B:Integer):  integer;

Var 
   num:  integer;
Begin
   Randomize;
   aleatorio := Random(B-A + 1)+A;
End;

Var 
   A,B:  word;
Begin
   Repeat
      WriteLn('ingrese un rango para generar un numero aleatorio(A y B)');
      ReadLn(A,B);
      If A>B Then
         WriteLn('ingrese un rango correcto');
   Until A<B;
   If A<B Then
      WriteLn(aleatorio(A,B));

End.


Program E18;

Function MCD(N,M:integer):  integer;

Var 
   resto:  integer;

Begin

   Repeat
      resto := N Mod M;
      If resto=0 Then
         resto := M;
      N := M;
      M := resto;

   Until ((M<>0)And (n Mod m =0)  ) Or (M=0);
   MCD := resto;
End;

Var 
   N,M:  Integer;
Begin
   WriteLn('ingrese un 2 numeros para allar el maximo comun Divisor');
   ReadLn(N,M);
   WriteLn('el MCD es:',MCD(N,M));
End.

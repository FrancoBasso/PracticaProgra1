
Program E19;

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
   N,M:  integer;
   maximo:  integer;
Begin
   WriteLn('ingrese el numerador y el denomidandor');
   ReadLn(N,M);
   maximo := MCD(N,M);
   WriteLn('la fraccion simplificadad es:',N Div maximo,'/',M Div maximo);
End.

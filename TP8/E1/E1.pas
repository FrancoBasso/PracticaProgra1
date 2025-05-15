
Program E1;
Function potencia (X,N:integer):  real;
Begin
   If N=0 Then
      potencia := 1
   Else
      If n>0 Then
         potencia := X*potencia(X,N-1)
   Else
      potencia := 1/ potencia(X,-N);
End;

Var 
   N:  Integer;
   X:  Integer;
Begin
   WriteLn('ingrese el numero para calcular la potencia y su exponencial');
   ReadLn(X,N);
   WriteLn(potencia(X,N):  8:  2);
End.


Program E2;
Function imparpar(N:Integer):  integer;
Begin
   If N=0 Then
      imparpar := 1
   Else
      If odd(N) Then
         imparpar := imparpar(N-1)
   Else
      imparpar := 1 + imparpar(N-1);
End;

Var 
   N:  byte;
Begin
   WriteLn('ingrese el numero');
   ReadLn(N);
   WriteLn(imparpar(N):  5);

End.

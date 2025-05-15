
Program E9;
Function creciente(N:integer):  Boolean;
Begin
   If N<10 Then
      creciente := true
   Else
      Begin
         If (N Mod 10)<((N Div 10) Mod 10) Then
            creciente := false
         Else
            creciente := creciente(N Div 10);
      End;


End;

Var 
   N:  integer;
Begin
   WriteLn('ingrese el numero');
   ReadLn(N);
   If creciente(N) Then
      WriteLn('el numero dado es de orden creciente')
   Else
      Writeln('el numero dado no es de orden creciente');
End.

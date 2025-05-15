
Program E3;

Function confuso(a,b:integer):  integer;
Begin
   If (b = 0) Then
      confuso := 0
   Else
      If (b Mod 2 = 0) Then
         confuso := confuso(a+a, b Div 2)
   Else
      confuso := confuso(a+a, b Div 2) + a;
End;

Var 
   a,b:  Integer;
Begin
   WriteLn('ingrese a y b');
   ReadLn(a,b);
   WriteLn(confuso(a,b));
End.

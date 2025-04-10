
Program E16;
Function capicua(N:String):  boolean;

Begin
   If N[1]=N[Length(N)] Then
      capicua := true

   Else
      capicua := false;
End;

Var 
   N:  string;
Begin
   WriteLn('ingrese un numero');
   ReadLn(N);
   If capicua(N) Then
      WriteLn('el numero es capicua')
   Else
      WriteLn('el numero no es capicua');
   ReadLn();

End.

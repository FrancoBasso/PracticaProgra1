
Program E4;

Procedure alrevez (i:byte;palabra:String);
Begin
   Write(palabra[i]);
   If i>1 Then
      alrevez(i-1,palabra);
End;
Function alrevez2(i: Byte; palabra: String):  String;
Begin
   If i = 0 Then
      alrevez2 := ''
   Else
      alrevez2 := palabra[i] + alrevez2(i - 1, palabra);
End;

Var 
   palabra:  String;

Begin
   WriteLn('ingrese una palabra');
   ReadLn(palabra);
   WriteLn('palabra invertida:');
   alrevez(Length(palabra),palabra);
   WriteLn();
   WriteLn(alrevez2(Length(palabra),palabra));
End.

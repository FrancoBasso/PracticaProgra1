
Program E5;

Var 
   K,Q:  integer;

   i:  integer;
Begin
   WriteLn('ingrese el valor Q');
   ReadLn(Q);
   WriteLn('ingrese el valor k');
   ReadLn(K);
   For i := 1 To Q Do
      Begin
         If (i Mod k)=0 Then
            WriteLn(i);
      End;
   ReadLn()
End.

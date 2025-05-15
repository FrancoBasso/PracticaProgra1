
Program E11;
Procedure mediaPiramide(c,a,p,f:byte);
Begin

   If A<=f Then
      Begin
         Write(p:4);

         If p>C Then
            mediaPiramide(c,a,p-1,f)
         Else
            Begin
               WriteLn();
               mediaPiramide(c,a+1,A+1,f);
            End;

      End;

End;

Var 
   N:  byte;
Begin
   WriteLn('ingrese un numero');
   ReadLn(N);
   mediaPiramide(1,1,1,N);
End.

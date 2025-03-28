
Program E10;

Var 
   arch:  text;
   num1,num2:  integer;
   cont:  byte;
Begin
   cont := 0;
   assign(arch,'E10datos.txt');
   reset(arch);
   read(arch,num1);
   While Not eof(arch) Do
      Begin
         cont := cont+1;

         Read(arch,num2);
         If num1=num2 Then
            Begin

               num1 := num2;

            End
         Else
            If num1<num2 Then
               Begin
                  WriteLn('numero      Frecuencia');
                  WriteLn(num1,'      ',cont);
                  cont := 0;
                  num1 := num2;
               End;

      End;
   WriteLn('numero      Frecuencia');
   WriteLn(num1,'      ',cont+1);

   Close(arch);
   readln()
End.


Program E24;

Var 
   archENT,archSAL:  text;
   car1,car2,c:  char;

Begin
   Assign(archENT,'datosent.txt');
   reset(archENT);
   Assign(archSAL,'datosSal.txt');
   Rewrite(archSAL);
   Read(archENT,car1);
   While car1<>'.' Do
      Begin
         read(archENT,car2);
         If (car1 In ['a'..'z']) And (car2 In ['0'..'9']) Then
            Begin
               For c:='1' To car2 Do



                  Write(archSAL,car1);
               Read(archENT,car2);
            End
         Else
            Write(archSAL,car1);
         car1 := car2;

      End;
   Close(archENT);
   Close(archSAL);
   Reset(archSAL);
   While Not Eof(archSAL) Do
      Begin


         read(archSAL,car1);
         Write(car1);
      End;
   Close(archSAL);
   ReadLn()
End.

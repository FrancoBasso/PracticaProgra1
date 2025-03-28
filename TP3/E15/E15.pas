
Program E15;

Var 
   car:  char;
   arch:  text;
   X:  char;
   cont:  byte;
Begin
   WriteLn('ingrese la letra del principio de las palabras');
   ReadLn(X);
   X := upcase(X);
   cont := 0;
   assign(arch,'datos15a.txt');
   reset(arch);
   Repeat
      read(arch,car);
      WriteLn(car);

      If car=X Then
         cont := cont+1;

      While (car<>' ') And (car<>'.') Do
         Begin
            read(arch,car);
            WriteLn(car)
         End;

   Until car='.';
   Close(arch);
   WriteLn('la cantidad de palabras iniciadas con la letra ',X,' es de :',cont);
   ReadLn()
End.

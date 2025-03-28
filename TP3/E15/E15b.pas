
Program E15b;

Var 
   car:  char;
   X:  Char;
   cont:  byte;
   si:  boolean;
   arch:  text;

Begin
   cont := 0;
   WriteLn('ingrese la letra');
   ReadLn(X);
   Assign(arch,'datos15a.txt');
   reset(arch);
   Repeat
      si := false;
      Read(arch,car);

      While (car<>' ')And (car<>'.') Do
         Begin
            If (car=X) Or (car=upcase(X)) Then
               si :=  true;
            read(arch,car);
         End;
      If si Then
         cont := cont+1;

   Until car='.';
   Close(arch);
   WriteLn('la cantidad de palabras con la letra ',X,' es de : ',cont);
   ReadLn()
End.


Program E22;

Var 
   car:  Char;
   capi:  char;
   contCua,contV,maxvocales:  byte;
   palabra,palabramax:  string;
   arch:  text;
Begin
   contCua := 0;
   maxvocales := 0;
   Assign(arch,'datos22.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         contv := 0;
         palabra := '';
         read(arch,car);
         capi := car;
         While (car<>' ') And (car<>'.')  Do
            Begin
               Case car Of 
                  'a','e','i','o','u':  contV := contV + 1;
                  'A','E','I','O','U':  contV := contV + 1;

               End;
               palabra := palabra+car;
               Read(arch,car);


            End;
         If capi=car Then
            contCua := contCua+1;

         If contV>maxvocales Then
            Begin
               maxvocales := contV;
               palabramax := palabra;
            End;

      End;
   Close(arch);
   WriteLn('la palabra con la mayor cantidad de vocales fue: ',palabramax);
   WriteLn('la cantidad de palabras capicua fue de:',contCua);
   ReadLn()
End.

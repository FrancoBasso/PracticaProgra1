
Program E23;

Var 
   contL,contD,contC,cont,maxcaracter,contI:  byte;
   mayus,minus:  Boolean;
   arch:  text;
   valida:  Boolean;
   invalida:  String;
   car:  char;
Begin
   maxcaracter := 0;
   contI := 0;
   cont := 0;
   minus := false;
   mayus := false;

   Assign(arch,'datos23.txt');
   Reset(arch);
   While Not eof (arch) Do
      Begin
         valida := true;

         contL := 0;
         contD := 0;
         invalida := '';
         read(arch,car);
         While (car<>' ') And (Not Eof(arch)) Do
            Begin
               contl := contl +1;
               Case car Of 
                  'a'..'z':  minus := true;
                  'A'..'Z':  mayus := true;
                  '0'..'9':  contD := contD+1;

                  Else
                     valida := False;
               End;
               invalida := invalida + car;
               Read(arch,car);
            End;
         cont := cont+1;
         If valida Then
            Begin
               If minus And mayus And (contD=4) And (contl>=8) Then
                  Begin
                     valida := valida;

                  End
               Else
                  Begin
                     contI := contI+1;

                     If Length(invalida)>maxcaracter Then
                        maxcaracter := Length(invalida);



                  End;


            End
         Else

            Begin
               contI := contI+1;

               If Length(invalida)>maxcaracter Then
                  maxcaracter := Length(invalida);



            End;


      End;
   WriteLn(cont);
   WriteLn(contI);
   WriteLn('el porcentaje de contrseñas invalidas es del ',contI*100/cont:8:2,
           '%');
   WriteLn(' la longitud de la contrasenia invalida mas larga es de ',
           maxcaracter);
End.

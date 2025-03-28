
Program E7;

Var 
   nombre:  string[10];
   nota1,nota2,nota3:  real;
   cont,contA:  byte;
Begin
   cont := 0;
   contA := 0;
   WriteLn('ingrese el nombre del alumno ');
   ReadLn(nombre);
   While nombre<>'***' Do
      Begin
         cont := cont+1;
         WriteLn('ingres la nota 1,2 y 3');
         ReadLn(nota1,nota2,nota3);
         If ((nota1+nota2+nota3)/3)>=4 Then
            Begin
               WriteLn(Nombre,' : Aprobado');
               contA := contA + 1;
            End

         Else
            WriteLn(Nombre,' : Desaprobado');
         WriteLn('ingrese el nombre del alumno ');
         ReadLn(nombre);

      End;
   WriteLn('el porcventaje de aprobados fue de',100*contA/cont:8:2,' %');
   ReadLn()
End.


Program E5;

Type 
   TR =  Record
      matricula:  LongInt;
      NM,NF,NQ:  Real;
   End;
   TR2 =  Record
      matricula:  LongInt;
      inscFis,inscquim:  byte;
   End;
   TarAlum =  file Of TR;
   TarINS =  file Of TR2;
Procedure listadoInscriptos(Var arA:TarAlum;Var arins:TarINS);

Var 
   R1:  TR;
   R2:  TR2;
Begin
   Reset(arA);
   Reset(arins);
   Read(arA,R1);
   Read(arins,R2);
   While (Not eof(arA)) And (Not eof(arins)) Do
      Begin
         If (R2.inscFis=1) And (R2.inscquim=1) Then
            Begin
               If ((R1.NM<4) Or (R2.NF<4)) And (NQ<4) Then
                  WriteLn('la matricula',R1.matricula,'no cumple con ningun requsito de inscripcion')
               Else
                  If (NQ<4) And ((R1.NM>=4) And (R2.NF>=4)) Then
                     WriteLn('la matricula :',R1.matricula,'no aprobo quimica 1')
               Else
                  WriteLn('la matricula:',R1.matricula,' no cumple con los requisitos de fisica 2')
            End
         Else
            Begin
               If (R2.inscFis=1) And ((R1.NM<4) Or (R2.NF<4)) Then
                  WriteLn('la matricula:',R1.matricula,' no cumple con los requisitos de fisica 2');
               If (R2.inscquim=1) And  (NQ<4) Then
                  WriteLn('la matricula :',R1.matricula,'no aprobo quimica 1')

            End;
         Read(arA,R1);
         Read(arins,R2);
      End;
End;

Var 
   arA:  TarAlum;
   arins:  TarINS;

Begin
   Assign(arA,'ALUMNOS.DAT');
   Assign(arins,'INSCRIPTOS.DAT');
   listadoInscriptos(arA,arins);

End.

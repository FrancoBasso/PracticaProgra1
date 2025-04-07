
Program E8;
Function descuento(dia:byte;tipo:char;monto:integer):  real;
Begin
   Case tipo Of 
      'O':
            Begin
               If ((dia=10) Or (dia=20) Or (dia=30)) And (monto=300) Then
                  Begin

                     descuento := monto*0.05;
                  End;

            End;
      'C':
            Begin
               If dia> 15 Then
                  Begin

                     descuento := monto*0.10;
                  End;

            End;

      'S':
            Begin
               If dia <= 15 Then
                  Begin

                     descuento := monto*0.15;
                  End;

            End;
   End;
End;

Var 
   cod:  string[4];
   S,O,C:  Boolean;
   tipo,aux:  char;

   monto:  integer;
   cont:  byte;
   acumD,acum:  real;
   N,i,dia:  byte;
   arch:  Text;
Begin
   Assign(arch,'tp4e8.txt');
   Reset(arch);
   ReadLn(arch,N);
   cont := 0;




   For i:=1 To N Do
      Begin
         While Not eof(arch) Do
            Begin
               ReadLn(arch,cod);
               ReadLn(arch,tipo,dia,monto);
               S := false;
               C := False;
               O := False;
               acum := 0;
               acumD := 0;
               tipo := upcase(tipo);
               While ( Tipo<>'F') And (Not Eof(arch)) Do
                  Begin
                     Case tipo Of 
                        'O':
                              Begin
                                 If ((dia=10) Or (dia=20) Or (dia=30)) And (monto=300) Then
                                    Begin

                                       O := true;
                                    End;

                              End;
                        'C':
                              Begin
                                 If dia> 15 Then
                                    Begin

                                       C := true;
                                    End;

                              End;

                        'S':
                              Begin
                                 If dia <= 15 Then
                                    Begin

                                       S := true;
                                    End;

                              End;
                     End;
                     acumD := acumD+descuento(dia,tipo,monto);

                     acum := acum+monto;

                     ReadLn(arch,tipo,dia,monto);

                  End;
               If O And S And c Then
                  cont := cont+1
               Else
                  If (Not O) And (Not S) And (Not C) Then

                     WriteLn('el cliente ',cod,' no obtuvo ningun descuento , su monto total es',acum:8:2);
               WriteLn('el cliente ahorro :',acumD:8:2);
            End;
      End;

   Close(arch);
   WriteLn('la cantida de clientes que obtuvieron descuentos en los 3 rubros fueron :',cont);
End.

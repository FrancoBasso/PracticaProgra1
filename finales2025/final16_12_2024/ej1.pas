
Program ej1;

Type 
   St20 =  string[20];
   TRE =  Record
      nroE:  integer;
      direccion:  st20;
      cantdep:  byte;
      fondoReserva:  real;
      gastosOctubre:  real;
   End;
   TRO =  Record
      nroE:  integer;
      nrodepto:  byte;
      valor:  real;
      tipo:  char;
   End;
   Tedif =  file Of TRE;
   Toctubre =  file Of TRO;
Procedure listadoActualizacion(Var arEdif:Tedif;Var arOct:Toctubre;X,Y:integer);

Var 
   RE,RA:  TRE;
   edfAct:  Integer;
   dptoAct:  byte;
   cantdeptAct:  byte;
   dirAct:  st20;
   fondoAct:  real;
   RO:  TRO;
   artemp:  Tedif;
   totalRecaudado,recdepto:  real;
   totalGastos,deudadpto:  real;

Begin
   Assign(artemp,'temporario.dat');
   Rewrite(artemp);
   Reset(arEdif);
   Reset(arOct);
   Read(arEdif,RE);
   Read(arOct,RO);
   While Not Eof(arEdif) Or Not Eof(arOct) Do
      Begin
         If RE.nroE=RO.nroE Then
            Begin
               totalRecaudado := 0;
               totalGastos := 0;
               edfAct := RE.nroE;
               dirAct := RE.direccion;
               fondoAct := RE.fondoReserva;
               cantdeptAct := RE.cantdep;

               If ((edfAct=X) Or (edfAct=y))  Then
                  Begin
                     WriteLn('edificio :',edfAct,'direccion :',RE.direccion);
                  End;

               While edfAct=RO.nroE Do
                  Begin
                     If RO.nrodepto In [1..50] Then
                        Begin
                           recdepto := 0;
                           deudadpto := 0;
                           dptoAct := RO.nrodepto;
                           While (edfAct =  RO.nroE) And (dptoAct=RO.nrodepto) Do
                              Begin
                                 If RO.tipo='E' Then
                                    deudadpto := deudadpto + RO.valor
                                 Else
                                    If RO.tipo='P' Then
                                       recdepto := recdepto + RO.valor;
                                 Read(arOct,RO);
                              End;
                           totalRecaudado := totalRecaudado + recdepto;
                           totalGastos := totalGastos +deudadpto;
                           If ((edfAct=X) Or (edfAct=y)) And (recdepto<deudadpto) Then
                              Begin
                                 WriteLn('depto       valor deuda octubre');
                                 WriteLn(dptoAct,'     ',(deudadpto-recdepto):  8:  2);
                              End;
                        End

                     Else
                        Read(arOct,RO);
                  End;
               If ((edfAct=X) Or (edfAct=y)) Then
                  If totalRecaudado>=totalGastos Then
                     writeln('Todos los deptos. pagaron el total de sus expensas en octubre: S')
               Else
                  writeln('Todos los deptos. pagaron el total de sus expensas en octubre: N');

               RA.nroE := edfAct;
               RA.direccion := dirAct;
               RA.gastosOctubre := totalGastos;
               RA.cantdep := cantdeptAct;
               RA.fondoReserva := fondoAct + (totalrecaudado-totalGastos);
               Write(artemp,RA);
               Read(arEdif,RE);

            End
         Else
            If RE.nroE<RO.nroE Then
               Begin
                  Write(artemp,RE);
                  Read(arEdif,RE);
               End
         Else
            Read(arOct,RO);

      End;
   Close(arEdif);
   Close(arOct);
   Close(artemp);
   Erase(arEdif);

   Rename(artemp,'edificio.dat');


End;

Var 
   arEdif:  Tedif;
   arOct:  Toctubre;
   X,Y:  integer;
Begin
   Assign(arEdif,'edificio.dat');
   Assign(arOct,'octubre.dat');
   WriteLn('introduzca los dos edificios a listar');
   Readln(X,Y);
   listadoActualizacion(arEdif,arOct,X,Y);
End.

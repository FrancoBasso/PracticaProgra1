
Program programcreador;

Type 
   st20 =  string[20];
   TRB =  Record
      nombrebodega:  st20;
      variedad:  word;
      zona:  0..99;
      comerc:  char;
      // '1' = granel, '2' = fraccionado
      cantidad:  real;
   End;

   TRH =  Record
      nombrebodega:  st20;
      cantLitros:  real;
      cantgranel:  word;
   End;

   Tbodega =  file Of TRB;
   Thistoria =  file Of TRH;

Var 
   fBodegas:  Tbodega;
   fHistorial:  Thistoria;
   rBod:  TRB;
   rHis:  TRH;
   i:  integer;

Procedure CrearBodegas;
Begin
   Assign(fBodegas, 'bodegas.dat');
   Rewrite(fBodegas);

   // Bodegas con variedad de casos
   rBod.nombrebodega := 'BODEGA01';
   rBod.variedad := 100;
   rBod.zona := 1;
   rBod.comerc := '1';
   rBod.cantidad := 500.0;
   Write(fBodegas, rBod);
   rBod.comerc := '2';
   rBod.cantidad := 200.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA02';
   rBod.variedad := 200;
   rBod.zona := 3;
   rBod.comerc := '1';
   rBod.cantidad := 800.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA03';
   rBod.variedad := 300;
   rBod.zona := 5;
   rBod.comerc := '2';
   rBod.cantidad := 600.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA04';
   rBod.variedad := 400;
   rBod.zona := 2;
   rBod.comerc := '2';
   rBod.cantidad := 700.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA05';
   rBod.variedad := 500;
   rBod.zona := 4;
   rBod.comerc := '1';
   rBod.cantidad := 1000.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA06';
   rBod.variedad := 600;
   rBod.zona := 4;
   rBod.comerc := '2';
   rBod.cantidad := 900.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA07';
   rBod.variedad := 100;
   rBod.zona := 1;
   rBod.comerc := '2';
   rBod.cantidad := 300.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA08';
   rBod.variedad := 700;
   rBod.zona := 2;
   rBod.comerc := '1';
   rBod.cantidad := 400.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA09';
   rBod.variedad := 800;
   rBod.zona := 8;
   rBod.comerc := '2';
   rBod.cantidad := 100.0;
   Write(fBodegas, rBod);

   rBod.nombrebodega := 'BODEGA10';
   rBod.variedad := 900;
   rBod.zona := 0;
   rBod.comerc := '1';
   rBod.cantidad := 600.0;
   Write(fBodegas, rBod);

   // Valor centinela
   rBod.nombrebodega := 'ZZZZZZZZZZZZZZZZZZZZ';
   rBod.variedad := 0;
   rBod.zona := 0;
   rBod.comerc := '1';
   rBod.cantidad := 0.0;
   Write(fBodegas, rBod);

   Close(fBodegas);
End;

Procedure CrearHistorial;
Begin
   Assign(fHistorial, 'historia.dat');
   Rewrite(fHistorial);

   // Bodegas ya existentes con valores históricos
   rHis.nombrebodega := 'BODEGA01';
   rHis.cantLitros := 2000.0;
   rHis.cantgranel := 500;
   Write(fHistorial, rHis);
   rHis.nombrebodega := 'BODEGA02';
   rHis.cantLitros := 1500.0;
   rHis.cantgranel := 0;
   Write(fHistorial, rHis);
   rHis.nombrebodega := 'BODEGA03';
   rHis.cantLitros := 0.0;
   rHis.cantgranel := 600;
   Write(fHistorial, rHis);
   rHis.nombrebodega := 'BODEGA11';
   rHis.cantLitros := 1000.0;
   rHis.cantgranel := 300;
   Write(fHistorial, rHis);
   rHis.nombrebodega := 'BODEGA12';
   rHis.cantLitros := 500.0;
   rHis.cantgranel := 0;
   Write(fHistorial, rHis);

   // Valor centinela
   rHis.nombrebodega := 'ZZZZZZZZZZZZZZZZZZZZ';
   rHis.cantLitros := 0.0;
   rHis.cantgranel := 0;
   Write(fHistorial, rHis);

   Close(fHistorial);
End;

Begin
   CrearBodegas;
   CrearHistorial;
   WriteLn('Archivos bodegas.dat y historia.dat creados correctamente.');
End.

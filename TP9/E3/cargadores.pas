
Program cargadores;

Type 
   st3 =  string[3];
   st15 =  string[15];

   TR =  Record
      codE:  st3;
      descr:  st15;
      Pbase, Pcomida:  real;
   End;

   TR2 =  Record
      codE:  st3;
      Nbol:  word;
      comida:  char;
   End;

   TarEXC =  file Of TR;
   TarBOL =  file Of TR2;

Var 
   AE:  TarEXC;
   AB:  TarBOL;

Const 
   descs:  array[1..15] Of string[15] =  (
                                          'City Tour', 'Laguna', 'Sierras', 'Barco', 'Museo',
                                          'Catedral', 'Zoologico', 'Parque', 'Teatro', 'Cerro Azul',
                                          'Caminata', 'Viñedos', 'Puente', 'Centro', 'Castillo'
                                         );

Function CodStr(i: integer):  st3;
Begin
   If i < 10 Then
      CodStr := '00' + Chr(48 + i)
   Else
      CodStr := '0' + Chr(48 + i Div 10) + Chr(48 + i Mod 10);
End;

Procedure CrearArchivos;

Var 
   R1:  TR;
   R2:  TR2;
   i, nb, j:  integer;
Begin
   // Crear EXCURSIONES.DAT
   Assign(AE, 'EXCURSIONES.DAT');
   Rewrite(AE);
   For i := 1 To 15 Do
      Begin
         R1.codE := CodStr(i);
         R1.descr := descs[i];
         R1.Pbase := 800 + i * 20;
         R1.Pcomida := 200 + i * 10;
         Write(AE, R1);
      End;
   // Centinela
   R1.codE := 'ZZZ';
   R1.descr := 'FIN';
   R1.Pbase := 0;
   R1.Pcomida := 0;
   Write(AE, R1);
   Close(AE);

   // Crear BOLETERIA.DAT (ordenado por codE)
   Assign(AB, 'BOLETERIA.DAT');
   Rewrite(AB);
   j := 1;
   For i := 1 To 15 Do
      For nb := 1 To 3 Do
         Begin
            R2.codE := CodStr(i);
            R2.Nbol := j;
            If nb Mod 2 = 0 Then
               R2.comida := 'N'
            Else
               R2.comida := 'S';
            Write(AB, R2);
            Inc(j);
         End;
   // Centinela
   R2.codE := 'ZZZ';
   R2.Nbol := 0;
   R2.comida := 'X';
   Write(AB, R2);
   Close(AB);
End;

Procedure ListarExcursiones;

Var 
   R:  TR;
Begin
   Assign(AE, 'EXCURSIONES.DAT');
   Reset(AE);
   Writeln('--- LISTADO DE EXCURSIONES ---');
   Read(AE, R);
   While R.codE <> 'ZZZ' Do
      Begin
         Writeln(R.codE:4, R.descr:15, ' | Base: ', R.Pbase:6:2, ' | Comida: ', R.Pcomida:6:2);
         Read(AE, R);
      End;
   Close(AE);
End;

Procedure ListarBoletos;

Var 
   R:  TR2;
Begin
   Assign(AB, 'BOLETERIA.DAT');
   Reset(AB);
   Writeln('--- LISTADO DE BOLETOS ---');
   Read(AB, R);
   While R.codE <> 'ZZZ' Do
      Begin
         Writeln(R.codE:4, ' | Boleto #: ', R.Nbol:3, ' | Comida: ', R.comida);
         Read(AB, R);
      End;
   Close(AB);
End;

Begin
   CrearArchivos;
   ListarExcursiones;
   Writeln;
   ListarBoletos;
End.

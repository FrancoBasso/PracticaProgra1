

Program CrearArchivosEj7;

Type 
   st4 =  String[4];
   st3 =  String[3];
   st15 =  String[15];

   TRC =  Record
      cod:  st4;
      zona:  1..10;
      capacidad:  Word;
   End;

   TRVen =  Record
      codC:  st4;
      codP:  st3;
      localvend:  Byte;
   End;

Var 
   archCine:  file Of TRC;
   archVentas:  file Of TRVen;
   archPeliculas:  Text;
   regCine:  TRC;
   regVenta:  TRVen;
   i:  Integer;
   s:  String;

Function CodigoCine(n: Integer):  String;

Var temp:  String;
Begin
   Str(n, temp);
   If n < 10 Then
      CodigoCine := 'C00' + temp
   Else
      CodigoCine := 'C0' + temp;
End;

Begin
   { Crear archivo CINES.dat con 10 cines distintos }
   Assign(archCine, 'CINES.dat');
   Rewrite(archCine);

   For i := 1 To 10 Do
      Begin
         regCine.cod := CodigoCine(i);  { Genera C001 a C010 }
         regCine.zona := i;
         regCine.capacidad := 100 + (i * 10);
         Write(archCine, regCine);
      End;

   { Centinela al final }
   regCine.cod := 'ZZZZ';
   regCine.zona := 10;
   regCine.capacidad := 0;
   Write(archCine, regCine);
   Close(archCine);

   { Crear archivo VENTAS.dat }
   Assign(archVentas, 'ventas.dat');
   Rewrite(archVentas);

   { Cine C001, película P01 (2 funciones) }
   regVenta.codC := 'C001';
   regVenta.codP := 'P01';
   regVenta.localvend := 80;
   Write(archVentas, regVenta);
   regVenta.localvend := 70;
   Write(archVentas, regVenta);

   { Cine C002, película P02 }
   regVenta.codC := 'C002';
   regVenta.codP := 'P02';
   regVenta.localvend := 90;
   Write(archVentas, regVenta);

   { Cine C003, película P01 }
   regVenta.codC := 'C003';
   regVenta.codP := 'P01';
   regVenta.localvend := 60;
   Write(archVentas, regVenta);

   { Cine C004, película P03 }
   regVenta.codC := 'C004';
   regVenta.codP := 'P03';
   regVenta.localvend := 75;
   Write(archVentas, regVenta);

   { Cine C005, películas P01 y P02 }
   regVenta.codC := 'C005';
   regVenta.codP := 'P01';
   regVenta.localvend := 65;
   Write(archVentas, regVenta);
   regVenta.codP := 'P02';
   regVenta.localvend := 85;
   Write(archVentas, regVenta);

   { C006 y C007 no tienen funciones }

   { Cine C008, película P04 (2 funciones) }
   regVenta.codC := 'C008';
   regVenta.codP := 'P04';
   regVenta.localvend := 50;
   Write(archVentas, regVenta);
   regVenta.localvend := 60;
   Write(archVentas, regVenta);

   { Cine C009, película P05 }
   regVenta.codC := 'C009';
   regVenta.codP := 'P05';
   regVenta.localvend := 55;
   Write(archVentas, regVenta);

   { Centinela }
   regVenta.codC := 'ZZZZ';
   regVenta.codP := 'ZZZ';
   regVenta.localvend := 0;
   Write(archVentas, regVenta);
   Close(archVentas);

   { Crear archivo peliculas.txt }
   Assign(archPeliculas, 'peliculas.txt');
   Rewrite(archPeliculas);

   Writeln(archPeliculas, 'P01 Avengers        120');
   Writeln(archPeliculas, 'P02 Batman          110');
   Writeln(archPeliculas, 'P03 Spiderman       130');
   Writeln(archPeliculas, 'P04 IronMan         125');
   Writeln(archPeliculas, 'P05 Thor            115');
   Writeln(archPeliculas, 'P06 Hulk            100');
   Writeln(archPeliculas, 'P07 Flash           105');  { formato alternativo }

   Close(archPeliculas);

   WriteLn('Archivos CINES.dat, VENTAS.dat y peliculas.txt creados correctamente.');
End.

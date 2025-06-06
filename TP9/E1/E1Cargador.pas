

Program E1Cargador;



Type 
   str15 =  string[15];

   TDestino =  Record
      codigo:  byte;
      descripcion:  str15;
   End;

   TPaquete =  Record
      codigo:  integer;
      peso:  real;
      destino:  byte;
      monto:  real;
   End;

Var 
   fDestinos:  file Of TDestino;
   fPaquetes:  file Of TPaquete;

{----------------------}
Procedure CargarDestinos;

Var 
   d:  TDestino;
   i:  integer;
Begin
   assign(fDestinos, 'DESTINO.DAT');
   rewrite(fDestinos);

   For i := 1 To 30 Do
      Begin
         d.codigo := i;
         d.descripcion := 'Dest. ' + chr(65 + Random(26));
         // A-Z aleatorio
         write(fDestinos, d);
      End;

   close(fDestinos);
End;

{----------------------}
Procedure CargarPaquetes;

Var 
   p:  TPaquete;
   i:  integer;
Begin
   assign(fPaquetes, 'PAQUETES.DAT');
   rewrite(fPaquetes);

   For i := 1 To 50 Do
      Begin
         p.codigo := 1000 + i;
         p.peso := 0.5 + Random * 20;
         // entre 0.5 y 20.5
         p.destino := Random(30) + 1;
         // 1 a 30
         p.monto := 100 + Random(2000);
         // entre 100 y 2099
         write(fPaquetes, p);
      End;

   close(fPaquetes);
End;

{----------------------}
Procedure MostrarDestinos;

Var 
   d:  TDestino;
Begin
   assign(fDestinos, 'DESTINO.DAT');
   reset(fDestinos);

   writeln('Listado de destinos:');
   While Not eof(fDestinos) Do
      Begin
         read(fDestinos, d);
         writeln('Código: ', d.codigo:2, ' - Descripción: ', d.descripcion);
      End;

   close(fDestinos);
End;

{----------------------}
Procedure MostrarPaquetes;

Var 
   p:  TPaquete;
Begin
   assign(fPaquetes, 'PAQUETES.DAT');
   reset(fPaquetes);

   writeln('Listado de paquetes:');
   While Not eof(fPaquetes) Do
      Begin
         read(fPaquetes, p);
         writeln('Código: ', p.codigo, ', Peso: ', p.peso:4:1,
                 ', Destino: ', p.destino, ', Monto: $', p.monto:0:2);
      End;

   close(fPaquetes);
End;

{----------------------}
Begin
   Randomize;
   // Inicializa el generador de números aleatorios

   CargarDestinos;
   CargarPaquetes;

   writeln;
   MostrarDestinos;
   writeln;
   MostrarPaquetes;
End.


Program Ecargador;

Type 
   str20 =  string[20];

   TTarjeta =  Record
      numero:  longint;
      // número de tarjeta
      propietario:  str20;
      // nombre del titular
      tope:  real;
      // límite de crédito
      gasto:  real;
      // gasto actual
   End;

Var 
   fTarjetas:  file Of TTarjeta;

{----------------------------}
Procedure CargarArchivo;

Var 
   t:  TTarjeta;
   i:  integer;
   nombres:  array[1..15] Of str20 =  (
                                       'Ana Gómez', 'Luis Pérez', 'Carlos Ruiz', 'María López', 'Elena Torres',
                                       'Jorge Díaz', 'Lucía Romero', 'Pedro Martínez', 'Valeria Castro',
                                       'Sofía Herrera', 'Tomás Suárez', 'Natalia Paz', 'Iván Ríos',
                                       'Camila Vera', 'Andrés Silva'
                                      );
Begin
   assign(fTarjetas, 'TARJETAS.DAT');
   rewrite(fTarjetas);
   Randomize;

   For i := 1 To 15 Do
      Begin
         t.numero := 40000000 + Random(10000000);
         // número de tarjeta aleatorio
         t.propietario := nombres[i];
         t.tope := 10000 + Random(20001);
         // entre 10000 y 30000
         t.gasto := Random(Round(t.tope));
         // gasto <= tope
         write(fTarjetas, t);
      End;

   close(fTarjetas);
End;

{----------------------------}
Procedure MostrarArchivo;

Var 
   t:  TTarjeta;
Begin
   assign(fTarjetas, 'TARJETAS.DAT');
   reset(fTarjetas);

   writeln('LISTADO DE TARJETAS:');
   writeln('-----------------------------------------------------------');
   While Not eof(fTarjetas) Do
      Begin
         read(fTarjetas, t);
         writeln('N° Tarjeta: ', t.numero,
                 ' | Propietario: ', t.propietario,
                 ' | Tope: $', t.tope:0:2,
                 ' | Gasto: $', t.gasto:0:2);
      End;

   close(fTarjetas);
End;

{----------------------------}
Begin
   CargarArchivo;
   writeln;
   MostrarArchivo;
End.

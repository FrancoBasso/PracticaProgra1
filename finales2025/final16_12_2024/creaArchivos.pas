
Program creaArchivos;

Type 
   St20 =  string[20];

   TRE =  Record
      nroE:  integer;
      direccion:  St20;
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

   TEdif =  file Of TRE;
   TOctubre =  file Of TRO;

Const 
   CORTE =  9999;

Var 
   arEdif:  TEdif;
   arOct:  TOctubre;
   RE:  TRE;
   RO:  TRO;

Procedure AgregarEdificio(nro: integer; dir: St20; cant: byte; fondo: real);
Begin
   RE.nroE := nro;
   RE.direccion := dir;
   RE.cantdep := cant;
   RE.fondoReserva := fondo;
   RE.gastosOctubre := 0;
   Write(arEdif, RE);
End;

Procedure AgregarMovimiento(nroE, nroD: integer; valor: real; tipo: char);
Begin
   RO.nroE := nroE;
   RO.nrodepto := nroD;
   RO.valor := valor;
   RO.tipo := tipo;
   Write(arOct, RO);
End;

Begin
   // Crear archivo edificio.dat
   Assign(arEdif, 'edificio.dat');
   Rewrite(arEdif);

   AgregarEdificio(1, 'Av. Rivadavia 1000', 3, 5000);
   AgregarEdificio(2, 'Calle Mitre 234', 4, 10000);
   AgregarEdificio(3, 'Calle Belgrano 321', 2, 3000);
   AgregarEdificio(4, 'Calle San Juan 789', 3, 8000);
   AgregarEdificio(5, 'Calle Laprida 456', 2, 7000);

   // Centinela
   RE.nroE := CORTE;
   Write(arEdif, RE);
   Close(arEdif);

   // Crear archivo octubre.dat
   Assign(arOct, 'octubre.dat');
   Rewrite(arOct);

   // === EDIFICIO 1 ===
   // Dpto 1: deuda 2000, paga 2000 → justo
   AgregarMovimiento(1, 1, 2000, 'E');
   AgregarMovimiento(1, 1, 2000, 'P');

   // Dpto 2: deuda 1500, paga 1000 → debe 500
   AgregarMovimiento(1, 2, 1500, 'E');
   AgregarMovimiento(1, 2, 1000, 'P');

   // Dpto 3: deuda 1000, no paga → debe 1000
   AgregarMovimiento(1, 3, 1000, 'E');

   // === EDIFICIO 2 ===
   // Dpto 1: deuda 2500, paga 3000 → sobra
   AgregarMovimiento(2, 1, 2500, 'E');
   AgregarMovimiento(2, 1, 3000, 'P');

   // Dpto 2: deuda 1000, paga 1000 → justo
   AgregarMovimiento(2, 2, 1000, 'E');
   AgregarMovimiento(2, 2, 1000, 'P');

   // Dpto 3: deuda 1500, no paga → deuda total
   AgregarMovimiento(2, 3, 1500, 'E');

   // Dpto 4: sin deuda ni pago

   // === EDIFICIO 3 ===
   // Dpto 1: deuda 2000, paga 1000 → debe 1000
   AgregarMovimiento(3, 1, 2000, 'E');
   AgregarMovimiento(3, 1, 1000, 'P');

   // Dpto 2: sin deuda ni pago

   // === EDIFICIO 4 ===
   // Dpto 1: paga sin deuda (donación o adelanto)
   AgregarMovimiento(4, 1, 500, 'P');

   // Dpto 2: deuda 1000, paga 500 → debe 500
   AgregarMovimiento(4, 2, 1000, 'E');
   AgregarMovimiento(4, 2, 500, 'P');

   // Dpto 3: deuda 700, paga 700 → justo
   AgregarMovimiento(4, 3, 700, 'E');
   AgregarMovimiento(4, 3, 700, 'P');

   // === EDIFICIO 5 ===
   // Dpto 1: deuda 1000, paga 1200 → de más
   AgregarMovimiento(5, 1, 1000, 'E');
   AgregarMovimiento(5, 1, 1200, 'P');

   // Dpto 2: sin nada

   // Centinela
   RO.nroE := CORTE;
   Write(arOct, RO);
   Close(arOct);

   WriteLn('Archivos edificio.dat y octubre.dat generados con datos de prueba.');
End.


Program E1;

Const 
   maxe =  50;

Type 
   TR =  Record
      codP:  word;
      peso:  real;
      codD:  byte;
      montoA:  real;
   End;

   st15 =  string[15];

   TR2 =  Record
      codD:  byte;
      des:  st15;
   End;

   TarPaq =  file Of TR;
   TarDes =  file Of TR2;
   TV =  array[1..maxe] Of st15;
   TC =  array[1..maxe] Of byte;
Procedure LeeDestino(Var Vdes:TV);

Var 
   arch:  TarDes;
   R:  TR2;
Begin
   Assign(arch,'DESTINO.DAT');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         Read(arch,R);
         Vdes[R.codD] := R.des;
      End;
   Close(arch);
End;
Procedure Listado(Var Vpaq:TC);

Var 
   R:  TR;
   i:  byte;
   totalmonto:  real;
   pesoprom:  real;
   contP:  byte;
   arch:  TarPaq;
Begin
   For i:=1 To 30 Do
      Vpaq[i] := 0;
   Assign(arch,'paquetes.dat');
   Reset(arch);
   totalmonto := 0;
   pesoprom := 0;
   contP := 0;
   While Not eof(arch) Do
      Begin
         Read(arch,R);
         contP := contP+1;
         pesoprom := pesoprom+R.peso;
         totalmonto := totalmonto+R.montoA;
         Vpaq[R.codD] := Vpaq[R.codP]+1;
      End;
   Close(arch);
   WriteLn('el peso promedio de los paquetes es: ',pesoprom/contP:8:2);
   WriteLn('el total de los montos asegurados es:',totalmonto:8:2);
End;
Procedure listapaquetes(Vpaq:TC;Vdes:TV);

Var 
   i:  byte;
Begin
   WriteLn('Destino      cantidad de paquetes');
   For i:=1 To 30 Do
      Writeln(Vdes[i],'    ',Vpaq[i]);
End;

Var 
   Vpaq:  TC;
   Vdes:  TV;


Begin
   LeeDestino(Vdes);
   Listado(Vpaq);
   listapaquetes(Vpaq,Vdes);

End.

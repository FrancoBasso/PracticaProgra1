
Program E2;

Const 
   maxE =  50;

Type 
   st20 =  string[20];
   TR =  Record
      Ntarjeta:  LongInt;
      Propietario:  st20;
      tope,gastoMes:  real;
   End;
   TR2 =  Record
      Ntarjeta:  LongInt;
      codop:  byte;
      monto:  real;
   End;
   Tartarjeta =  file Of TR;
   TarREch =  file Of TR2;
   TT =  array[0..maxE] Of LongInt;

Procedure armarTabla(Var tabla:TT);

Var 
   i:  byte;
   arch:  Tartarjeta;
   R:  TR;
Begin
   i := 0;
   Assign(arch,'TARJETAS.DAT');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         Read(arch,R);
         tabla[i] := R.Ntarjeta;
         i := i+1;
      End;
   Close(arch);
End;
Function buscapos(Tabla:TT;Ntarjeta:LongInt):  byte;

Var 
   i:  byte;
Begin
   i := 0;
   While Ntarjeta<>Tabla[i] Do
      i := i+1;
   buscapos := i;
End;
Procedure LISTADO(Var Arech:TarREch;Var Atarj:Tartarjeta;Tabla:TT);

Var 
   numT:  LongInt;
   R1:  TR;
   R2:  TR2;
   monto:  real;

   codop:  byte;
Begin
   Assign(Arech,'RECHAZADOS.DAT');

   Reset(Atarj);
   Rewrite(Arech);
   WriteLn('ingrese el numero de tarjeta');
   ReadLn(numT);
   While numT<>0 Do
      Begin
         Seek(Atarj,buscapos(Tabla,numT));
         Read(Atarj,R1);
         WriteLn('ingrese el monto y codigo de operacion');
         ReadLn(monto,codop);
         If (monto+R1.gastoMes)>R1.tope Then
            Begin

               R2.Ntarjeta := numT;
               R2.codop := codop;
               R2.monto := monto;
               Write(Arech,R2);

            End
         Else
            Begin

               R1.gastoMes := R1.gastoMes + monto;
               Seek(Atarj, buscapos(Tabla, numT));

               Write(Atarj, R1);

            End;
         WriteLn('ingrese el numero de tarjeta o 0 para fin de datos');
         ReadLn(numT);

      End;
   Close(Arech);
   Close(Atarj);
End;
Procedure MostrarArchivo(Var Atarj:Tartarjeta);

Var 
   R:  TR;
Begin
   Reset(Atarj);

   writeln('LISTADO DE TARJETAS:');
   writeln('-----------------------------------------------------------');
   While Not eof(Atarj) Do
      Begin
         read(Atarj, R);
         writeln('N° Tarjeta: ', r.Ntarjeta,
                 ' | Propietario: ', R.Propietario,
                 ' | Tope: $', R.tope:0:2,
                 ' | Gasto: $', R.gastoMes:0:2);
      End;

   close(Atarj);
End;
Procedure mostrarRechazados(Var Arech:TarREch);

Var 
   R:  TR2;
Begin
   Reset(Arech);
   While Not eof(Arech) Do
      Begin
         Read(Arech,R);
         WriteLn('Numero de tarjeta: ',R.Ntarjeta:10,'  codigo de operacion :',R.codop,'  monto:',R.monto:8:2);
      End;
   Close(Arech);
End;

Var 
   Arech:  TarREch;
   Atarj:  Tartarjeta ;
   tabla:  TT;
Begin
   armarTabla(tabla);


   Assign(Atarj,'TARJETAS.DAT');
   LISTADO(Arech,Atarj,tabla);
   MostrarArchivo(Atarj);
   mostrarRechazados(Arech);

End.

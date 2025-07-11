
Program Ej1;

Type 
   st4 =  string[4];
   st10 =  string[10];
   st15 =  string[15];
   st8 =  string[8];
   TRP =  Record
      codP:  st4;
      descripcion:  st10;
      costo:  real;
   End;
   TRC =  Record
      nombre:  st10;
      tel:  st15;
      cantM:  Byte;
   End;
   TRV =  Record
      nombre:  st10;
      nombremascota:  st10;
      codP:  st4;
      fecha:  st8;
      alta:  char;
   End;
   TRPV =  Record
      codP:  st4;
      costo:  real;
      cantP:  byte;
   End;
   Tveterinara =  file Of TRV;
   Tpracticas =  file Of TRP;
   Tclientes =  file Of TRC;
   TVP =  array[1..50] Of TRPV;
   TVC =  array[1..50] Of TRC;

Procedure insertapractica(Var vecp:TVP;codP:st4;costo:real;Var L:byte);

Var 
   i:  byte;
Begin
   i := L;
   While (i>0) And (Vecp[i].codP>codP) Do
      Begin
         Vecp[i+1].codP := vecp[i].codP;
         Vecp[i+1].costo := vecp[i].costo;
         i := i-1;
      End;
   Vecp[i+1].codP := codP;
   Vecp[i+1].costo := costo;
   vecp[i+1].cantP := 0;
   L := L+1;
End;
Procedure LeePracticas(Var VecP:TVP;Var L:byte;Var arpractica:Tpracticas);

Var 
   RP:  TRP;
Begin
   Reset(arpractica);
   read(arpractica,RP);
   L := 0;
   While Not eof(arpractica) Do
      Begin
         insertapractica(vecp,RP.codP,RP.costo,L);
         Read(arpractica,RP);
      End;
   Close(arpractica);
End;
Procedure insertaClientes(Var vecC:TVC;nombre:st10;tel:st15;Var M:byte);

Var 
   i:  byte;
Begin
   i := M;
   While (i>0) And (VecC[i].nombre>nombre) Do
      Begin
         VecC[i+1].nombre := vecC[i].nombre;
         VecC[i+1].tel := vecC[i].tel;
         i := i-1;
      End;
   VecC[i+1].nombre := nombre;
   VecC[i+1].tel :=  tel;

   M := M+1;
End;

Procedure LeeCLientes(Var vecC:TVC;Var M:byte;Var arClientes:Tclientes);

Var 
   RC:  TRC;
Begin
   Reset(arClientes);
   Read(arClientes,RC);
   M := 0;
   While Not eof(arClientes) Do
      Begin
         insertaCliente(vecC,RC.nombre,RC.tel,M);
         Read(arClientes,RC);
      End;
   Close(arClientes);
End;
Function buscaCli(vecC:TVC;nombre:st10;N:byte):  byte;

Var 
   medio,pri,ult:  byte;
Begin
   pri := 1;
   ult := M;
   Medio := (pri+ult) Div 2;
   While (pri<ult) And (nombre<>vecC[medio].nombre) Do
      Begin
         If nombre<vecC[medio].nombre Then
            ult := medio -1
         Else
            pri := medio +1;
         medio := (pri + ult) Div 2;
      End;
   If (pri<ult) Then
      buscaCli := medio
   Else
      buscaCli := 0;
End;
Function buscaprac(vecP:TVP;codP:st4;M:byte):  byte;

Var 
   medio,pri,ult:  byte;
Begin
   pri := 1;
   ult := M;
   Medio := (pri+ult) Div 2;
   While (pri<ult) And (nombre<>vecP[medio].codP) Do
      Begin
         If nombre<vecP[medio].codP Then
            ult := medio -1
         Else
            pri := medio +1;
         medio := (pri + ult) Div 2;
      End;
   If (pri<ult) Then
      buscaCli := medio
   Else
      buscaCli := 0;
End;

Procedure informeVeterinaria(Var arVet:Tveterinara;vecC:TVC;vecp:TVP;L,M:byte);

Var 
   RV:  TRV;
   importetotal:  real;
   importeporMascota:  real;
   clienteAct:  st10;
   posC,posP:  byte;
   i:  byte;
   mascotaAct:  st10;
   mesult:  string[2];
   cantE:  byte;
   alta:  Char;
   terminotrat:  Boolean;
Begin
   Reset(arVet);
   Read(arVet,RV);
   cantE := 0;
   While Not eof(arVet) Do
      Begin
         posC := buscaCli(vecC,RV.nombre,M);
         If (posC<>0)  Then
            Begin
               clienteAct := RV.nombre;
               importetotal := 0;
               WriteLn('cliente:',clienteAct,' |  telefono:',vecC[posC].tel);
               WriteLn('Mascota   |    mes ultima practica  |  importetotal   |  termino algun tratamiento?');
               While (clienteAct=RV.nombr) Do
                  Begin
                     mascotaAct := RV.nombremascota;
                     importeporMascota := 0;
                     terminotrat := false;
                     While (clienteAct=RV.nombr) And (Copy(RV.fecha,1,4)='2024') And (mascotaAct=RV.nombremascota)   Do
                        Begin
                           posP := buscaPrac(Vecp,RV.codP,L);
                           mesult := RV.fecha[5]+RV.fecha[6];
                           importeporMascota := importeporMascota + vecp[posP].costo;
                           vecp[posP].cantP := vecp[posP].cantP + 1;
                           If RV.alta='S' Then
                              terminotrat := True;

                           Read(arVet,RV);

                        End;
                     If terminotrat Then
                        alta := 'S'
                     Else alta := 'N';

                     WriteLn(RV.nombremascota,'    ',mesult,'    $ ',importeporMascota,'    ',alta);
                     importetotal := importetotal + importeporMascota;
                  End;
               WriteLn('importe total de todas las practicas $:',importetotal:8:2);

            End
         Else
            Begin
               cantE := cantE +1;
               Read(arVet,RV);
            End;

      End;
   Close(arVet);
   WriteLn('cantidad de clientes erroneos en el archivo veterinaria.dat:',cantE);
   WriteLn('cantidad de cada practica realizada');
   For i:=1 To L Do
      WriteLn(vecp[i].codP,' :',vecp[i].cantP);
End;

Var 
   arClientes:  Tclientes;
   arpractica:  Tpracticas;
   arVet:  Tveterinara;
   vecC:  TVC;
   vecP:  TVP;
   M,L:  byte;

Begin
   Assign(arClientes,'clientes.dat');
   Assign(arpractica,'Practicas.dat');
   Assign(arVet,'veterinaria.dat');

   LeePracticas(vecP,L,arpractica);
   LeeCLientes(vecC,M,arClientes);
   informeVeterinaria(arVet,vecC,vecP,l,M);


End.

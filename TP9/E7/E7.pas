
Program E7;

Type 
   st4 =  String[4];
   st3 =  string[3];
   st15 =  string[15];
   TRC =  Record
      cod:  st4;
      zona:  Byte;
      capacidad:  Word;
   End;
   TRVen =  Record
      codC:  st4;
      codP:  st3;
      localvend:  byte;
   End;
   TRP =  Record
      codP:  st3;
      nombreP:  st15;
      duracion:  byte;
      locvend,cantfunc:  byte;
   End;
   TVZ =  array[1..10] Of byte;
   TVP =  array[1..50] Of TRP;
   Tcine =  file Of TRC;
   Tventas =  file Of TRVen;

Procedure iniciaVectorzona(Var vecz:TVZ);

Var 
   i:  Byte;
Begin
   For i:= 1 To 10 Do
      vecz[i] := 0;
End;
Procedure Leearchivo(Var vecP:TVP;Var N:byte);

Var 
   arch:  text;
   aux:  char;
Begin
   Assign(arch,'peliculas.txt');
   Reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         N := N+1;
         Readln(arch,vecP[N].codP,aux,vecP[n].nombreP,vecP[N].duracion);
         vecP[N].locvend := 0;
         vecP[n].cantfunc := 0;
      End;
   Close(arch);
End;
Function buscapos(codp:st3;vecp:TVP;N:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (codp<>vecp[i].codP) Do
      i := i+1;
   If i<=N Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure listado(Var arCine:Tcine;Var arVentas:Tventas;Var vecz:TVZ;Var  vecP:TVP;N:byte);

Var 
   RegC:  TRC;
   REgV:  TRVen;
   cantPdif,canfunciones:  byte;
   codcine_actual:  st4;
   codpeli_actual:  st3;
   totalLocvend:  byte;
   cant_cine_noproy:  byte;
   ocupProm:  real;
   pospeli:  byte;

Begin
   iniciaVectorzona(vecz);
   reset(arCine);
   Reset(arVentas);
   Read(arCine,RegC);
   Read(arVentas,REgV);
   WriteLn('Listado');
   WriteLn('cine  | cantidad de peliculas  | cant funciones | total de localidades vendidas | % ocup promedio');
   cant_cine_noproy := 0;
   While (Not eof(arCine)) And (Not eof(arVentas))  Do
      Begin
         If RegC.cod=REgV.codC Then
            Begin
               codcine_actual := RegC.cod;
               cantPdif := 0;
               canfunciones := 0;
               totalLocvend := 0;
               While codcine_actual=REgV.codC Do
                  Begin
                     cantPdif := cantPdif+1;

                     codpeli_actual := REgV.codP;
                     While (Not EOF(arVentas)) And (codcine_actual=REgV.codC) And (codpeli_actual=REgV.codP)  Do
                        Begin
                           canfunciones := canfunciones+1;
                           totalLocvend := totalLocvend + REgV.localvend;
                           Read(arVentas,REgV);
                        End;
                     pospeli := buscapos(codpeli_actual,vecp,N);
                     vecP[pospeli].locvend := vecP[pospeli].locvend + totalLocvend;
                     vecP[pospeli].cantfunc := vecP[pospeli].cantfunc + canfunciones;
                  End;
               If RegC.capacidad<>0 Then
                  WriteLn(codcine_actual,'  ',cantPdif,'  ',canfunciones,'  ',totalLocvend,'  ',(totalLocvend*100)/RegC.
                  capacidad:  8:  2,' %');


               vecz[RegC.zona] := vecz[RegC.zona] + totalLocvend;
               read(arCine,RegC);
            End
         Else
            If RegC.cod<REgV.codC Then
               Begin
                  cant_cine_noproy := cant_cine_noproy +1;
                  read(arCine,RegC);
               End
         Else
            Begin
               Read(arVentas,REgV);
            End;
      End;
   Close(arCine);
   Close(arVentas);
   WriteLn('cantida de cines que no proyectaron ninguna pelicula fue de :',cant_cine_noproy);


End;
Function menorprom(vecP:TVP;N:byte):  st15;

Var 
   i:  byte;
   compact:  real;
   menor:  real;
   pos:  byte;
Begin

   menor := 99999;
   pos := 0;
   For i:= 1 To N Do
      Begin
         If vecP[i].cantfunc<>0 Then
            compact := vecP[i].locvend/vecP[i].cantfunc;
         If compact<menor Then
            Begin
               menor := compact;
               pos := i;
            End;
      End;
   menorprom := vecP[pos].nombreP;
End;
Procedure localvendporzona(vecz:TVZ);

Var 
   i:  byte;
Begin
   For i:=1 To 10 Do
      WriteLn('zona ',i,' ',vecz[i]);
End;

Var 
   arCine:  Tcine;
   arVentas:  Tventas;
   vecz:  TVZ;
   vecP:  TVP;
   N:  byte;

Begin
   Assign(arCine,'CINES.dat');
   Assign(arVentas,'ventas.dat');
   Leearchivo(vecP,N);
   listado(arCine,arVentas,vecz,vecp,N);
   localvendporzona(vecz);
   WriteLn('pelicula con menor promedio de localidades vendidas por funcion ',menorprom(vecp,N));
End.

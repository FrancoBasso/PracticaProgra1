
Program parcial22_4_22;

Type 
   st3 =  String[3];
   st7 =  String[7];

   TVZ =  array[1..50] Of st3;
   TVF =  array[1..50] Of real;
   TVP =  array[1..50] Of st7;

Const 
   camiones =  5000;
   motos =  1000;

   autos =  2000;

Procedure leeArch(Var vecZ:tvz;Var vecf:tvf;Var N:byte);

Var 
   arch:  text;
   aux:  char;
Begin
   n := 0;
   assign(arch,'zona.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         N := N+1;
         readln(arch,vecz[N],aux,vecf[N]);
         WriteLn(vecz[n],vecf[n]);
      End;
   Close(arch);
End;
Procedure inicia(Var vecM,vecVZ:tvf;N:byte);

Var 
   i:  byte;
Begin
   For  i:= 1 To N Do
      Begin
         vecM[i] := 0;
         vecVZ[i] := 0;
      End;
End;
Function Buscapos(zona:st3;N:byte;vecZ:TVZ):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (vecz[i]<>zona) Do
      i := i+1;
   If i<=N Then
      Buscapos := i
   Else
      Buscapos := 0;
End;
Procedure leeArch2(vecz:tvz;vecf:tvf ;Var vecM,vecvz:tvf; Var vecP:tvp;n:byte;Var promedio:real);

Var 
   arch:  text;
   tipo,cont,pos:  byte;
   aux:  char;
   pat:  st7;
   cumple:  boolean;
   vel:  Real;
   zona:  st3;
   i:  Byte;
Begin
   promedio := 0;
   cont := 0;
   Assign(arch,'radar.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         cumple := false;
         readln(arch,tipo,vel,aux,zona,aux,pat);
         pos := Buscapos(zona,N,vecz);
         Case tipo Of 
            1:
                Begin
                   If vel<=100 Then
                      Begin
                         promedio := promedio + vel;
                         cont := cont+1;

                      End

                   Else
                      Begin
                         vecM[pos] := vecM[pos]+ motos*vecf[pos];
                         cumple := true;
                      End;
                End;
            2:
                Begin
                   If vel<=110 Then
                      Begin
                         promedio := promedio + vel;
                         cont := cont+1;

                      End

                   Else
                      Begin
                         vecM[pos] := vecM[pos]+ autos*vecf[pos];
                         cumple := true;
                      End;
                End;
            3:
                Begin
                   If vel<=90 Then
                      Begin
                         promedio := promedio + vel;
                         cont := cont+1;

                      End

                   Else
                      Begin
                         vecM[pos] := vecM[pos]+ camiones*vecf[pos];
                         cumple := true;
                      End;
                End;


         End;
         If cumple Then
            Begin
               If vel>=vecvz[pos] Then
                  Begin
                     vecvz[pos] := vel;
                     vecp[pos] := pat;
                  End;
            End;

      End;
   Close(arch);
   promedio := promedio/cont;
End;

Var 
   vecz:  tvz;
   vecf:  tvf;
   vecM:  tvf;
   vecVz:  TVF;
   vecp:  tvp;
   N:  byte;
   promedio:  real;
   zona:  st3;
   pos:  Byte;
   i:  byte;

Begin
   leeArch(vecz,vecf,N);
   inicia(vecm,vecvz,N);
   leeArch2(vecz,vecf,vecm,vecvz,vecp,n,promedio);
   WriteLn('ingrese un codigo de zona');
   ReadLn(zona);
   pos := Buscapos(zona,N,vecz);
   WriteLn('el importe total de multas de la zona:',zona,' es de ',vecm[pos]:8:2);
   WriteLn('el promedio de velocidad de las personas que no cometieron infraccion fue de ',promedio:8:2,'kms');
   For i:=1 To N Do
      Begin
         WriteLn('para la zona',vecz[i],' la patente del vehiculo que mayor velociadad alcanzo fue ',vecp[i]);
      End;
End.


Program E3;

Const 
   maxE =  50;

Type 
   st3 =  string[3];
   st15 =  string[15];
   TR =  Record
      codE:  st3;
      descr:  st15;
      Pbase,Pcomida:  real;
   End;
   TR2 =  Record
      CodE:  st3;
      Nbol:  word;
      comida:  char;
   End;
   TarEXC =  file Of TR;
   TarBOL =  file Of TR2;
   TT =  array [0..maxE] Of st3;
Procedure creaTabla(Var tabla:TT;Var N:byte;Var AE:TarEXC);

Var 
   R:  TR;
Begin
   Reset(AE);
   N := 0;
   While Not Eof(AE) Do
      Begin

         read(AE,R);
         tabla[N] := R.codE;
         N := N+1;
      End;
End;
Function buscapos(tabla:TT;ZonaAct:st3;N:Byte):  byte;

Var 
   i:  byte;
Begin
   i := 0;
   While (i<=N) And (tabla[i]<>ZonaAct) Do
      i := i+1;
   If i<=N Then
      buscapos := i
   Else
      buscapos := 0;
End;


Procedure LISTADO(Var AB:TarBOL;Var AE:TarEXC;tabla:TT;N:byte);

Var 
   R1:  TR;
   R2:  TR2;
   cantT,cantB,cantC,cantCC:  byte;
   monto:  real;
   ZonaAct:  st3;
Begin
   Reset(AB);
   Reset(AE);
   Read(AB,R2);
   cantT := 0;
   cantCC := 0;
   WriteLn('Excursion     cantidad de boletos    cantidad de comida      monto total');

   While Not eof(AB) Do
      Begin
         cantB := 0;
         cantC := 0;
         monto := 0;
         ZonaAct := R2.CodE;
         Seek(AE,buscapos(tabla,ZonaAct,N));
         Read(AE,R1);
         While ZonaAct=R2.CodE Do
            Begin
               cantB := cantB+1;
               monto := monto + R1.Pbase;
               If R2.comida='S' Then
                  Begin
                     cantC := cantC+1;
                     monto := monto+ R1.Pcomida;
                  End;
               Read(AB,R2);
            End;
         cantT := cantT+cantB;
         cantCC := cantCC+cantC;

         WriteLn(R1.descr,'               ',cantB,'                 ',cantC,'                   ',monto:8:2);
      End;
   Close(AB);
   Close(AE);
   WriteLn('% de turistas que contrataron excursion con comida: ',(cantCC*100)/cantT:  8:  2,' %');
End;

Var 
   AB:  TarBOL;
   AE:  TarEXC;
   N:  byte;
   tabla:  TT;

Begin
   Assign(AB,'BOLETERIA.DAT');
   Assign(AE,'EXCURSIONES.DAT');
   creaTabla(tabla,N,AE);
   LISTADO(AB,AE,tabla,N);
End.

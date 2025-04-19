
Program E15;

Const 
   maxE =  50;

Type 
   st7 =  string[7];
   st4 =  String[4];
   TVP =  array[1..maxE] Of st7;
   TVC =  array[1..maxE] Of st4;
   TVT =  array[1..maxE] Of  real;
   VT =  array[1..maxE] Of byte;
Function buscapos(Vcli:TVC;cli:st4;M:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=M) And (Vcli[i]<>cli) Do
      i := I+1;
   If i<=M Then
      buscapos := i
   Else
      buscapos := 0;
End;
Function buscapos2(Vpat:TVp;pat:st7;N:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (Vpat[i]<>pat) Do
      i := I+1;
   If i<=N Then
      buscapos2 := i
   Else
      buscapos2 := 0;
End;

Procedure LeeArchivo(Var Vcli:TVC;Var Vind:VT;Var Vpat:TVP;Var Vton:TVT;Var Vtipo:VT;Var N,M:byte);

Var 
   arch:  text;

   cli:  st4;
   pat:  st7;
   aux:  char;
   tipo:  byte;
   ton:  real;
   pos:  byte;
   pos2:  byte;

Begin
   Assign(arch,'tp5e15.txt');
   Reset(arch);
   N := 0;
   M := 0;
   While Not eof(arch) Do
      Begin
         Readln(arch,cli,aux,pat,tipo,ton);
         pos := buscapos(Vcli,cli,M);
         pos2 := buscapos2(Vpat,pat,N);
         WriteLn(pos,' ',pos2);
         If pos=0 Then
            Begin


               M := M+1;
               Vcli[M] := cli;


            End;
         WriteLn(Vcli[M]);
         If (pos2<>0)  Then
            Begin
               Vton[pos2] := Vton[pos2]+ton;

            End
         Else
            Begin
               N := N+1;
               Vpat[N] := pat;
               Vton[N] := ton;
               Vtipo[N] := tipo;
               If pos=0 Then
                  Vind[N] := M
               Else
                  Vind[N] := pos;

            End;
         Writeln(Vton[N]:8:2);
         WriteLn(Vpat[N],'  ',Vind[N]);



      End;
   Close(ARCH);
End;
Procedure porcentaje(Vton:TVT;Vtipo:VT;N:byte);

Var 
   suma :  real;
   i:  byte;
   tipo:  string;
   toton:  TVT;
Begin
   For i:=1 To 4 Do
      toton[i] := 0;
   suma := 0;
   For i:=1 To N Do
      Begin
         toton[Vtipo[i]] := toton[Vtipo[i]] + Vton[i];
         suma := Vton[i]+suma;
      End;
   For i:= 1 To 4 Do
      Begin
         Case i Of 
            1:  tipo := 'trigo';
            2:  tipo := 'girasol';
            3:  tipo := 'soja';
            4:  tipo := 'maiz';
         End;
         WriteLn(tipo,' ', (toton[i]*100)/suma:  8:  2,' %');

      End;
End;
Procedure patente(pat:st7;Vpat:TVP;Vcli:TVC;Vtipo:VT;Vton:TVT;N,M:byte;Vind:VT);

Var 
   i:  byte;
   pos:  byte;
   tipo:  string;
Begin
   pos := buscapos2(Vpat,pat,N);
   WriteLn('la cantidad de toneladas que trajo este camion fue de :',vton[pos]:8:2);
   Case Vtipo[pos] Of 
      1:  tipo := 'trigo';
      2:  tipo := 'girasol';
      3:  tipo := 'soja';
      4:  tipo := 'maiz';
   End;
   WriteLn('el cereal q trasporto fue : ',tipo);
   WriteLn('pertenece al cliente ',Vcli[Vind[pos]]);


End;
Procedure generarotro (Vcli:TVC;Vind:VT;Vton:TVT;N,M:byte;X:real;Var Vsup:TVC;Var l:byte);

Var 
   i,j,z:  byte;
   total:  real;
Begin
   L := 0;

   For j:= 1 To M Do
      Begin
         total := 0;
         For i:=1 To N Do
            If Vind[i]=j Then
               total := total+Vton[i];
         If total>=X Then
            Begin
               Z := L;
               While (z>0) And (vcli[j]<Vsup[z]) Do
                  Begin
                     Vsup[Z+1] := Vsup[Z];
                     Z := Z-1;
                  End;
               Vsup[z+1] := Vcli[J];
               L := L+1;
            End;

      End;
End;
Procedure mostrar3 (Vcli:VT;M:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      Write(Vcli[i],'  ');
End;

Procedure mostrar2 (Vcli:TVP;M:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      Write(Vcli[i],'  ');
End;

Procedure mostrar (Vcli:TVC;M:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      Write(Vcli[i],'  ');
End;

Var 
   Vcli,Vsup:  TVC;
   Vind,Vtipo:  VT;
   Vpat:  TVP;
   Vton:  TVT;
   N,M,L:  byte;
   X:  real;
   pat:  st7;

Begin
   LeeArchivo(Vcli,Vind,Vpat,Vton,Vtipo,N,M);
   mostrar(Vcli,M);
   Writeln();
   mostrar2(Vpat,N);
   Writeln();

   mostrar3(Vind,N);
   Writeln();


   porcentaje(Vton,Vtipo,N);
   WriteLn('Ingrese una patente');
   ReadLn(pat);
   patente(pat,Vpat,Vcli,Vtipo,Vton,N,M,Vind);
   WriteLn('ingrese un valor a superar');
   Readln(X);
   generarotro(Vcli,vind,Vton,N,M,X,Vsup,L);
   mostrar(Vsup,L);

End.

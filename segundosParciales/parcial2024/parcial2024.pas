
Program parcial2024;

Const 
   maxE =  50;

Type 
   st4 =  string[4];
   Treg =  Record
      cod:  st4;
      hora:  byte;
   End;
   TV =  array[1..maxE] Of st4;
   TM =  array[1..maxE,1..24] Of real;
   TR =  array[1..maxE] Of Treg;
   TVA =  array[1..24] Of byte;
Function buscapos(Vcod:TV;cod:ST4;N:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (Vcod[i]<>cod) Do
      i := i+1;
   If i<=N Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure inicialinea(Var mat:TM;i:byte);

Var 
   j:  byte;
Begin
   For j:= 1 To 24 Do
      mat[i,j] := 0;
End;
Procedure LeeArchivo(Var Vcod:TV;Var mat:TM;Var N:byte);

Var 
   arch:  text;
   pos:  byte;
   cod:  st4;
   hora:  byte;
Begin
   N := 0;
   Assign(arch,'precios.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         read(arch,cod);
         pos := buscapos(Vcod,cod,N);
         If pos=0 Then
            Begin
               N := N+1;
               Vcod[N] := cod;
               inicialinea(mat,N);
               pos := N;
            End;
         ReadLn(arch,hora,mat[pos,hora]);
      End;
   Close(arch);
End;
Function promedio(mat:TM;i:byte):  real;

Var 
   j,contV:  byte;
   sum:  real;
Begin
   sum := 0;
   contV := 0;
   For j:=1 To 24 Do
      If mat[i,j]<>0 Then
         Begin
            contV := contV+1;
            sum := sum+mat[i,j];
         End;
   If contV<>0 Then
      promedio := sum/contV
   Else
      promedio := 0
End;
Function menorProm(Vcod:TV;mat:TM;N:byte):  st4;

Var 
   menor,prom:  real;
   i,posmenor:  byte;
Begin
   menor := promedio(mat,1);
   posmenor := 1;
   For i:=2 To N Do
      Begin
         prom := promedio(mat,i);
         If prom<menor Then
            Begin
               menor := prom;
               posmenor := i;
            End;
      End;
   menorProm := Vcod[posmenor];
End;
Function precio(pos,hora:byte;mat:TM;km:real):  real;
Begin
   If mat[pos,hora]<>0 Then
      precio := (km*100)*mat[pos,hora]
   Else
      precio := 0;
End;
Function cumple (mat:TM;i:byte):  Boolean;

Var 
   j:  byte;
Begin
   j := 1;
   While (j<=N) And (mat[i,j]<>0) Do
      j := j+1;
   cumple := j>24;
End;
Procedure masCara(mat:TM;i:byte;Var Vaux:TVA;Var X:byte);

Var 
   j,pos:  byte;
   max:  real;
Begin
   max := mat[i,j];
   For j:= 2 To 24 Do
      If mat[i,j]>max Then
         max := mat[i,j];
   For j:=1 To 24 Do
      If mat[i,j]=max Then
         Begin
            X := X+1;
            Vaux[X] := J;
         End;
End;
Procedure insertaordenado(cod:ST4;Var Vgen:TR;Var L:byte;hora:byte);

Var 
   J:  byte;
Begin
   J := L;
   While (j>=1) And (cod<Vgen[j].cod) Do
      Begin
         Vgen[j+1].cod := Vgen[j].cod;
         j := j-1;
      End;
   Vgen[j+1].cod := cod;
   Vgen[j+1].hora := hora;
   L := L+1;
End;
Procedure generarOtro(Vcod:TV;mat:TM;N:byte; Var Vgen:TR;Var L:byte);

Var 
   Vaux:  TVA;
   X:  byte;
   j,i:  byte;
Begin
   L := 0;
   For i:=1 To N Do
      If cumple(mat,i) Then
         Begin
            X := 0;
            mascara(mat,i,Vaux,X);
            For j:= 1 To X Do
               insertaordenado(Vcod[i],Vgen,l,Vaux[J]);
         End;
End;
Procedure mostrar(Vgen:Treg;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do
      WriteLn(Vgen[i].cod,'  ',Vgen[i].hora);
End;

Var 
   Vcod:  TV;
   mat:  TM;
   N,L:  byte;
   Vgen:  TR;
   hora,pos:  byte;
   cod:  ST4;
   KM,precio:  real;
Begin
   LeeArchivo(Vcod,mat,N);
   WriteLn('codigo del menor promedio:',menorProm(Vcod.mat,N));
   WriteLn('ingrese un codigo , hora y km recorridos ');
   ReadLn(cod,hora,km);
   pos := buscapos(Vcod,cod,N);
   If pos<>0 Then
      If precio<>0 Then
         Begin
            precio := precio(pos,hora,mat,km);
            If precio<>0 Then
               WriteLn('el precio por los km recorridos es:',precio)
            Else
               WriteLn('la hora indicada no registra actividad ');
         End
   Else
      WriteLn('el codigo dado no es valido');
   generarOtro(Vcod,mat,N,Vgen,L);
   mostrar(Vgen,L);
End.

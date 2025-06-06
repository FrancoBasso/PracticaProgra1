
Program parcial;

Const 
   maxE =  50;

Type 


   st3 =  string[3];
   st10 =  string[10];
   Treg =  Record
      cad:  st3;
      descripcion:  ST10;
   End;
   TN =  array[1..maxE] Of st10;
   TC =  array[1..maxE] Of st3;
   TM =  array[1..maxE,1..maxE] Of word;
   TR =  array[1..maxE] Of Treg;
Procedure iniciaMatriz(Var mat:TM;N,M:byte);

Var 
   i,j:  Byte;
Begin
   For i:=1 To M Do
      For j:=1 To N Do
         mat[i,j] := 0;
End;
Procedure LeeCadenas(Var Vcad:TC;Var M:byte);

Var 
   arch:  text;

Begin
   M := 0;
   Assign(arch,'cadNoticias.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         M := M+1;
         readln(arch,Vcad[M]);
      End;
   Close(arch);

End;
Procedure Leetipo(Var Vtipo:TN;Var N:byte);

Var 
   arch:  text;
   i:  byte;
   aux:  char;

Begin
   N := 0;
   Assign(arch,'TipoNoticias.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         N := N+1;
         ReadLn(arch,i,aux,Vtipo[i]);
      End;
   Close(arch);

End;
Function buscapos(Vcad:TC;cad:st3;M:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=M) And (Vcad[i]<>cad) Do
      i := i+1;
   If i<=M Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure LeeCoberturas(Var mat:TM;Vcad:TC;N,M:byte);

Var 
   arch:  text;
   fila:  byte;
   cad:  st3;
   codigo:  byte;
   nota:  byte;
Begin
   iniciaMatriz(mat,N,M);
   Assign(arch,'coberturas.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch,cad,codigo,nota);
         fila := buscapos(Vcad,cad,M);
         If fila<>0 Then
            mat[fila,codigo] := mat[fila,codigo]+nota;
      End;
   Close(arch);

End;
Procedure Masnota(mat: TM; i, j, N: byte; Var posCad: byte; Var posNoticia: byte);
Begin
   If (i=1) And (j=1) Then
      Begin
         posCad := 1;
         posNoticia := 1;
      End
   Else
      If (j = 0) Then
         Begin
            If (i > 1) Then
               Masnota(mat, i - 1, N, N, posCad, posNoticia);
         End

   Else
      Begin
         Masnota(mat, i, j - 1, N, posCad, posNoticia);

         If mat[i, j] > mat[posCad,posNoticia] Then
            Begin
               posCad := i;
               posNoticia := j;

            End;

      End;
End;

Function suma(mat:TM;pos:byte;M:byte):  word;
Begin
   If M=0 Then
      suma := 0
   Else
      If M=3 Then
         suma := suma(mat,pos,M-1)

   Else

      suma := mat[pos,m] + suma(mat,pos,M-1)
End;
Function porcentaje(mat:TM;pos:byte;M:byte):  real;

Var 
   acum:  word;
Begin
   acum := suma(mat,pos,M);
   If acum<>0 Then
      porcentaje := (mat[pos,3]*100)/acum
   Else
      porcentaje := 0;
End;
Procedure generarListado(mat:TM;Vtipo:TN;Vcad:TC;N,M:byte;Var Vreg:TR;Var L:byte);

Var 
   i,j:  byte;
Begin
   L := 0;
   For i:=1 To M Do
      For j:=1 To N Do
         If mat[i,j]=0 Then
            Begin
               L := L+1;
               Vreg[L].cad := Vcad[i];
               Vreg[L].descripcion := Vtipo[j];
            End;

End;
Procedure mostrar(Vreg:TR;L:byte);

Var 
   i:  byte;

Begin
   WriteLn('algunas cadenas no cubrieron los siguientes datos:');
   For i:=1 To L Do
      WriteLn(Vreg[i].cad,'   ',Vreg[i].descripcion);

End;

Var 
   Vcad:  TC;
   Vtipo:  TN;
   mat:  TM;
   Vreg:  TR;
   L,N,M:  byte;

   posCad,posNoticia,pos:  byte;
   X:  ST3;
Begin
   LeeCadenas(Vcad,M);
   Leetipo(Vtipo,N);
   LeeCoberturas(mat,Vcad,N,M);

   Masnota(mat,M,N,N,posCad,posNoticia);
   WriteLn('La cadena con mas notas es ',Vcad[posCad],' con el tema de ',Vtipo[posNoticia]);
   WriteLn('ingrese una cadena de noticias');
   ReadLn(X);
   pos := buscapos(Vcad,X,M );
   WriteLn('para ',X,'  ',porcentaje(mat,pos,M):  5:  2,' %');
   generarListado(mat,Vtipo,Vcad,N,M,Vreg,L);
   mostrar(Vreg,L);
End.
//preguntar en que falla

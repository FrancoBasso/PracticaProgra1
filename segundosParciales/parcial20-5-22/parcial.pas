
Program parcial;

Const 
   MaxE =  50;

Type 

   st8 =  string[8];
   st2 =  string[2];
   Treg =  Record
      prov:  st2;
      rango:  byte;
   End;
   TM =  array[1..MaxE,0..9] Of word;
   TP =  array[1..MaxE] Of st2;
   TR =  array[1..MaxE] Of Treg;
Procedure LeeProvincias(Var Vprov:TP;Var N:byte);

Var 


   arch:  text;
Begin
   Assign(arch,'provincias.txt');
   Reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         N := N+1;
         ReadLn(arch,Vprov[N]);
      End;
   Close(arch);
End;
Function  buscapos(Vprov:TP;cod:ST2):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While Vprov[i]<>cod Do
      i := i+1;
   buscapos := i;
End;
Procedure iniciamtriz(Var mat:TM;N:byte);

Var 
   i,j:  byte;
Begin
   For i:= 1 To N Do
      For j:=0 To 9 Do
         mat[i,j] := 0;
End;
Procedure LeeInscriptos(Var mat:TM;Vprov:TP;N:byte);

Var 
   arch:  text;
   edad:  byte;
   cod:  st2;
   pos,pos2:  byte;
   Dni:  st8;
   aux:  char;
Begin
   iniciamtriz(mat,N);
   Assign(arch,'inscriptos.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch,dni,edad,aux,cod);
         pos := buscapos(Vprov,cod);
         pos2 := edad Div 10;
         mat[pos,pos2] := mat[pos,pos2] +1;
      End;
   Close(arch);
End;
Function buscaRecursivo(Vprov:TP;N:byte;X:st2):  byte;
Begin
   If N=0 Then
      buscaRecursivo := 0
   Else
      If Vprov[N]=X Then
         buscaRecursivo := N
   Else
      buscaRecursivo := buscaRecursivo(Vprov,N-1,X);
End;
Function cantidadEtarios(mat:TM;pos:byte):  byte;

Var 
   cont:  byte;
   i:  byte;
Begin
   cont := 0;
   For i:=0 To 9 Do
      If mat[pos,i]=0 Then
         cont := cont+1;
   cantidadEtarios := cont;
End;
Function RangosEtarios(mat:TM;Vprov:TP;R,T,N:byte):  st2;

Var 
   i,j:  byte;
   min:  word;
   posmin:  byte;
   acum:  word;
Begin
   min := 0;
   For j:=R To T Do
      min := mat[1,j] + min;
   posmin := 1;
   For j:= 2 To N Do
      Begin
         acum := 0;
         For j:=R To T Do
            acum := acum+ mat[i,j];
         If acum<min Then
            Begin
               min := acum;
               posmin := i;
            End;
      End;


   RangosEtarios := Vprov[posmin];
End;
Function totalRecursivo(mat:TM;N:byte;j,M:byte):  word;
Begin
   If N=0 Then
      totalRecursivo := 0
   Else
      If j<0 Then
         totalRecursivo := totalRecursivo(mat,N-1,M,M)
   Else
      totalRecursivo := mat[i,j] + totalRecursivo(mat,N,j-1,M);
End;

Procedure GenerarOtro(mat:TN;Vprov:TV;N:byte;Var Vreg:TR;Var L:byte );

Var 
   i,j:  byte;
   total:  word;
Begin
   total := totalRecursivo(mat,N,9,9);
   L := 0;
   For i:= 1 To n Do
      For j:=0 To 9 Do
         If mat[i,j]>(total*0.10) Then
            Begin
               l := L+1;
               Vreg[L].prov := Vprov[i];
               Vreg[L].rango := j*10;
            End;
End;
Procedure mostrar (Vreg:TR;L:byte);

Var 
   i:  byte;
Begin
   For i:=1 To L Do
      WriteLn(Vreg[i].prov,'  ',Vreg[i].rango);
End;

Var 
   Vprov:  TP;
   Vreg:  Treg;
   mat:  TM;
   N,l:  Byte;
   X:  ST2;
   R,T:  byte;
   pos:  byte;
Begin
   LeeProvincias(Vprov,N);
   LeeInscriptos(mat,Vprov,N);
   WriteLn('ingrese un codigo de provincia');
   ReadLn(X);
   pos := buscaRecursivo(Vprov,N,X);
   If pos<>0 Then
      WriteLn('cantidad de rangos etarios si inscriptos en ',X,' es :',cantidadEtarios(mat,pos))
   Else
      WriteLn('el codigo de provincia dado no existe');
   WriteLn('ingreseun rango R y un rango T de edades con (R<=T)');
   ReadLn(R,T);
   R := R Div 10;
   T := T Div 10;
   WriteLn(RangosEtarios(mat,Vprov,R,T,N));
   GenerarOtro(mat,Vprov,N,Vreg,L);
   mostrar(Vreg,L);

End.


Program E7;

Const 
   maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of byte;
Procedure iniciamat(Var mat:TM;N,M:byte);

Var 
   i,j:  byte;
Begin
   For i:=1 To N Do
      For j:= 1 To M Do
         mat[i,j] := 0;
End;
Procedure LeeArch(Var matS,matB:TM;N,M:byte);

Var 
   arch:  text;
   i,j:  byte;
   sub,baj:  byte;
Begin
   iniciamat(matS,N,M);
   iniciamat(matB,N,M);

   Assign(arch,'colectivos.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch,i,j,sub,baj);
         matS[i,j] := matS[i,j] + sub;
         matB[i,j] := matb[i,j] + baj;
      End;
   Close(arch);
End;
Function sumar(mat:TM;k,L:byte):  integer;

Var 
   f:  byte;
   suma:  integer;
Begin
   suma := 0;
   For f:= 1 To L Do
      suma := suma + mat[k,f];
   sumar := suma;
End;
Function sumar2(mat:TM;k,L:byte):  integer;

Var 
   f:  byte;
   suma:  integer;
Begin
   suma := 0;
   For f:= 1 To L Do
      suma := suma + mat[f,k];
   sumar2 := suma;
End;

Function Mayorcantidad(matB:TM;N,M:byte):  byte;

Var 
   i:  byte;
   suma:  integer;
   max:  integer;
   pos:  byte;
Begin
   max := sumar(matB,1,M);
   pos := 1;
   For i:= 2 To N Do
      Begin
         suma := sumar(matB,i,M);
         If suma>max Then
            Begin
               Max := suma;
               pos := i;
            End;
      End;
   Mayorcantidad := pos;
End;
Function menorcantidad(matS:TM;N,M:byte):  byte;

Var 
   j:  byte;
   suma:  integer;
   min:  integer;
   pos:  byte;
Begin
   min := sumar2(matS,1,N);
   pos := 1;
   For j:= 2 To M Do
      Begin
         suma := sumar2(matS,j,N);
         If suma<min Then
            Begin
               Min := suma;
               pos := j;
            End;
      End;
   menorcantidad := pos;
End;
Function cantidad40porciento(matS,matB:TM;N,M:byte):  byte;

Var 
   i:  byte;
   cont:  byte;
   sumaS,sumaB:  integer;
Begin
   cont := 0;
   For i:=1 To N Do
      Begin
         sumaS := sumar(matS,i,M);
         sumaB := sumar(matB,i,M);
         If sumaS<sumaB*0.40 Then
            cont := cont+1;
      End;
   cantidad40porciento := cont;

End;
Function cuantaslineas(matB,matS:TM;N,M:byte):  byte;

Var 
   i,j:  byte;
   cont:  byte;
Begin
   cont := 0;
   For j:= 1 To M Do
      Begin
         i := 1;
         While (i<=N) And ((matS[i,j]<>0) And (matB[i,j]<>0)) Do
            i := i+1;
         If i<=N Then
            cont := cont+1;
      End;
   cuantaslineas := cont;
End;

Var 
   matS,MatB:  TM;
   N,M:  byte;
Begin
   WriteLn('ingrese el numero de paradas y lineas a analizar respectivamente');
   ReadLn(N,M);
   LeeArch(matS,matB,N,M);
   WriteLn('parada con mayor cantidad de pasajeros que bajaron: ',Mayorcantidad(matB,N,M));
   WriteLn('linea con menor cantidad de pasajeros que subieron :',menorcantidad(matS,N,M));
   WriteLn(















      'Cantidad de paradas en las cuales el total de personas que subieron fue menor al 40% de las que bajaron fue de :'
           ,cantidad40porciento(matS,matB,N,M));
   WriteLn('la cantidad de lineas que no registraron subida ni bajada de pasajeros en alguna parada fue de:',
           cuantaslineas(matB,matS,N,M));
End.

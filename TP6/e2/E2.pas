
Program E2;

Const 
   maxE =  50;

Type 
   ST10 =  string[10];
   TM =  array[1..maxE,1..maxE] Of real;
   TV =  array[1..maxE] Of ST10;
Procedure Leearch(Var mat:TM;Var vecN:TV;Var N:byte;K:byte);

Var 
   arch:  text;
   j:  byte;
Begin
   N := 0;
   Assign(arch,'notas.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         N := N+1;
         Read(arch,vecN[N]);
         For j:= 1 To K Do
            Read(arch,mat[N,j]);
         ReadLn(arch);
      End;
   close(arch);
End;
Procedure listadoAlumnos(mat:TM;vecN:TV;N,K:byte);

Var 
   i,j:  byte;
Begin
   For i:= 1 To N Do
      Begin
         j := 1;
         While (j<K) And (mat[i,j]>=5) Do
            j := j+1;
         If mat[i,j]>=5 Then
            WriteLn(vecN[i]);

      End;
End;
Procedure situacion(mat:TM;vecN:TV;N,K:byte;Var vecProm:TV;Var L:byte);

Var 
   i,j:  byte;
   prom:  Real;
   suma:  real;
Begin
   L := 0;
   For i:=1 To N Do
      Begin
         suma := 0;
         For j:= 1 To K Do
            suma := suma+mat[i,j];
         prom := suma/k;
         If prom>=7 Then
            Begin
               WriteLn(vecN[i],' promociona');
               L := L+1;
               vecProm[L] := vecN[i];

            End
         Else
            If (prom>=5) And (prom<7) Then
               WriteLn(vecN[i],' habilita')
         Else
            WriteLn(vecN[i],' desaprueba');

      End;

End;
Procedure mostrarPromocionados(vecProm:TV;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do
      WriteLn(vecProm[i]);
End;

Var 
   mat:  tM;
   vecN,vecProm:  TV;
   N,K,L:  byte;
Begin
   Repeat
      WriteLn('ingrese el valor de k');
      ReadLn(K);
      If K=0 Then
         WriteLn('ingrese un valor valido');
   Until K>0;
   Leearch(mat,vecN,N,K);
   WriteLn('listado de alumnos:');
   listadoAlumnos(mat,vecN,N,K);
   WriteLn('situacion de cada uno:');
   situacion(mat,vecN,N,K,vecProm,L);
   WriteLn('alumnos promocionados');
   mostrarPromocionados(vecProm,L);
End.

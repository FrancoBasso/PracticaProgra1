
Program E5;

Const 
   maxE =  50;
   M =  4;
   Vrub:  array[1..4] Of string[15] =  ('supermercado','combustible','indumentaria','otros');

Type 
   TM =  array[1..maxE,1..4] Of real;
   TV =  array [1..maxE] Of Integer;

Function buscapos(vnum:TV;N:byte;num:integer):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (Vnum[i]<>num) Do
      i := i+1;
   If i<=N Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure inicialinea(Var mat:TM;N:byte);

Var 
   j:  byte;
Begin
   For j:= 1 To M Do
      mat[N,j] := 0;
End;
Procedure inicocompras(Var Vcompras:TV);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      Vcompras[i] := 0;
End;
Procedure Leearch(Var mat:TM;Var N:byte;Var Vnum:TV;Var Vcompras:TV);

Var 
   arch:  text;
   num:  integer;
   monto:  real;
   pos:  byte;
   tipo:  byte;
Begin
   Assign(arch,'supermercado.txt');
   Reset(arch);
   N := 0;
   inicocompras(Vcompras);
   While Not Eof(arch) Do
      Begin
         Readln(arch,num,tipo,monto);
         Vcompras[tipo] := Vcompras[tipo]+1;
         pos := buscapos(vnum,N,num);
         If pos=0 Then
            Begin
               N := N+1;
               vnum[N] := num;
               inicialinea(mat,N);
               mat[N,tipo] := mat[N,tipo]+monto;
            End
         Else
            mat[pos,tipo] := mat[pos,tipo]+monto;

      End;
   Close(arch);
End;
Procedure totalCompras(Vcompras:TV);

Var 
   i:  byte;
Begin
   For i:=1 To M Do
      WriteLn('el total de compras en ',Vrub[i],'  fue de: ',Vcompras[i]);

End;
Procedure listado (Vnum:TV;N:byte;mat:TM);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      If mat[i,1]>mat[i,4] Then
         WriteLn(Vnum[i]);
End;
Procedure promedioCliente(mat:TM;N:byte;Vnum:TV);

Var 
   i,j:  byte;
   prom:  real;
Begin
   For i:=1 To N Do
      Begin
         prom := 0;
         For j:= 1 To M Do
            prom := prom +mat[i,j];
         prom := prom/M;
         WriteLn('el promedio de compra para el cliente ',Vnum[i],' es de $ ',prom:8:2);
      End;
End;
Function masConsumio(mat:TM;N:byte;Vnum:TV):  integer;

Var 
   max:  real;
   i,j,pos:  byte;
   suma:  real;
Begin
   max := 0;
   For i:= 1 To N Do
      Begin
         suma := 0;
         For j:=1 To M Do
            suma := suma+mat[i,j];
         If suma>max Then
            Begin
               max := suma;
               pos := i;
            End;

      End;



   masConsumio := Vnum[pos];

End;
Function cuantosNoRegistraron(mat:TM;N:byte):  byte;

Var 
   i,j:  byte;
   contcli:  byte;
Begin
   contcli := 0;
   For i:= 1 To N Do
      Begin
         j := 1;
         While (j<=M) And (mat[i,j]<>0) Do
            j := j+1;
         If i<=M Then
            contcli := contcli +1;
      End;
   cuantosNoRegistraron := contcli;
End;

Var 
   mat:  TM;
   vnum,Vcompras:  TV;
   N:  byte;
Begin
   Leearch(mat,N,Vnum,Vcompras);
   totalCompras(Vcompras);
   WriteLn('el listado de clientes de los cuales el monto de supermercado supero al de indumentaria es:');
   listado(Vnum,N,mat);
   promedioCliente(mat,N,Vnum);
   WriteLn('el numero del cliente que mas consumio es de:',masConsumio(mat,N,Vnum));
   WriteLn('la cantidad de clientes que no registraron compras en algun rubro fue de:',cuantosNoRegistraron(mat,N));
End.

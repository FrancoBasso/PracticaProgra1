
Program primer_parcial;

Const 
   maxE =  50;

Type 
   Tlic =  array[1..maxE] Of Integer;
   Tdem =  array[1..maxE] Of real;
   st16 =  string[16];
Function buscapos(Vlic:Tlic;lic:Integer;N:byte):  byte;

Var 
   pri,ult,medio:  byte;
Begin
   pri := 1;
   ult := N;
   medio := (pri+ult) Div 2;
   While (pri<ult) And (lic<>Vlic[medio]) Do
      Begin
         If lic<Vlic[medio] Then
            ult := medio-1
         Else
            pri := medio+1;
         medio := (pri+ult) Div 2;
      End;
   If lic=Vlic[Medio] Then
      buscapos := medio
   Else
      buscapos := 0;
End;
Procedure insertaord(Var vLic,Vviajes:Tlic;Var Vdem,Vrec:Tdem;Var N:byte;lic:integer;dem,rec:real);

Var 
   j:  byte;
Begin
   j := N;
   While (j>0) And (lic<Vlic[j]) Do
      Begin
         vLic[j+1] := Vlic[j];
         vviajes[j+1] := Vviajes[j];
         vdem[j+1] := Vdem[j];
         vrec[j+1] := Vrec[j];
         j := j-1;

      End;
   Vlic[j+1] := lic;
   Vviajes[j+1] := 1;
   Vdem[j+1] := dem;
   Vrec[j+1] := rec;
   N := N+1;


End;
Procedure LeeArchivo(Var Vlic,Vviajes:Tlic;Var Vdem,Vrec:Tdem;Var N,contcan:byte);

Var 
   licencia:  integer;
   fecha:  st16;
   dem,rec:  real;
   pos:  byte;
   aux:  char;
   arch:  text;
Begin
   Assign(arch,'viajes.txt');
   Reset(arch);
   N := 0;
   contcan := 0;
   While Not eof(arch) Do
      Begin
         Read(arch,licencia,aux,fecha,dem);
         If (fecha[4]='4') And (dem=-1) Then
            contcan := contcan+1;
         If dem<>-1 Then
            Begin
               Readln(arch,rec);
               pos := Buscapos(Vlic,licencia,N);
               If pos=0 Then

                  insertaord(Vlic,Vviajes,Vdem,Vrec,N,licencia,dem,rec)

               Else
                  Begin
                     Vviajes[pos] := Vviajes[pos]+1;
                     Vrec[pos] := Vrec[pos]+rec;
                     Vdem[pos] := Vdem[pos]+dem;
                  End;

            End;

      End;
   Close(arch);
   For pos:= 1 To N Do
      Vdem[pos] := Vdem[pos]/Vviajes[pos];
End;
Procedure mostrar(Vaux:Tlic;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do
      WriteLn(Vaux[i]);
End;
Procedure demoraprom(Vdem:Tdem;N:byte;Vlic:Tlic);

Var 
   Vaux:  Tlic;
   i:  byte;
   max:  Real;
   L:  byte;
   pos:  byte;
Begin
   L := 0;
   max := Vdem[1];
   pos := 1;
   For i:= 2 To N Do
      If Vdem[i]>max Then
         Begin
            max := Vdem[i];
            pos := i;
         End;
   For i:= 1 To N Do
      If Vdem[i]=Vdem[pos] Then
         Begin
            L := L+1;
            Vaux[L] := vlic[i];
         End;
   mostrar(Vaux,L);
End;

Var 
   Vlic,Vviajes:  Tlic;
   Vdem,Vrec:  Tdem;
   N,pos,contcan:  byte;
   K:  Integer;
Begin
   LeeArchivo(Vlic,Vviajes,Vdem,Vrec,N,contcan);
   WriteLn('la cantidad de viajes cancelados en 2024 es:',contcan);
   demoraprom(Vdem,N,Vlic);
   WriteLn('ingrese un numero de licencia');
   readln(K);
   pos := buscapos(vlic,K,N);
   If pos=0 Then
      Writeln('la licencia dada no existe')
   Else
      WriteLn('la recaudacion pormedio para ',K,' es :',Vrec[pos]/Vviajes[pos]:8:2);
End.


Program recup;

Const 
   maxE =  50;

Type 
   st10 =  string[10];
   Tint =  array[1..maxE] Of st10;
   Tdur =  array [1..maxE] Of real;
   Tgen =  array[1..maxE] Of byte;
Function buscapos(Vint:tint;id:st10;N:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (id<>Vint[i]) Do
      i := i+1;
   If i<=N Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure inicia1(Var vec:Tgen;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      vec[i] := 0;
End;
Procedure inicia2(Var vec:Tdur;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      vec[i] := 0;
End;

Procedure LeeArchivo(Var Vint:Tint;Var Vgen:Tgen;Var N:byte);

Var 
   arch:  Text;
   id:  st10;
   gen:  byte;
   firmo:  char;
Begin
   Assign(arch,'Interpretes.txt');
   reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         ReadLn(arch,id,gen,firmo,firmo);
         If firmo='S' Then
            Begin
               N := N+1;
               Vint[N] := id;
               Vgen[N] := gen;

            End;
      End;
   Close(arch);
End;
Procedure cargaTemas(Var VTD,VTND:tgen;Var Vdur:Tdur;N,M:byte;Vint:Tint);

Var 
   id:  st10;
   tema:  string[6];
   dur:  real;
   Disp:  char;
   i:  byte;
   pos:  byte;
Begin
   For i:= 1 To M Do
      Begin
         WriteLn('ingrese el interprete');
         ReadLn(id);
         pos := buscapos(Vint,id,n);
         If pos=0 Then
            WriteLn('el interprete dado no firmo contrato')

         Else
            Begin
               WriteLn('ingrese el nombre del tema');
               ReadLn(tema);
               While tema<>'ZZZ' Do
                  Begin
                     WriteLn('ingrese si esta disponible');
                     ReadLn(disp);
                     If disp='S' Then
                        Begin
                           VTD[pos] := VTD[pos] + 1;
                           WriteLn('ingrese la duracion');
                           ReadLn(dur);
                           Vdur[pos] := Vdur[pos]+ dur;
                        End
                     Else
                        VTND[pos] := VTND[pos]+1;
                     WriteLn('ingrese el nombre del tema o ZZZ para fin de datos');
                     ReadLn(tema);

                  End;
            End;
      End;
End;
Function gen2o3(Vint:tint;Vgen,Vtd,VTND:Tgen;N:byte):  st10;

Var 
   i:  byte;
   mast:  byte;
   pos:  byte;
Begin
   mast := 0;
   pos := 0;
   For i:=1 To N Do
      Begin
         If ((Vgen[i]=2) Or (Vgen[i]=3)) And (VTND[i]=0) Then
            If mast<Vtd[i] Then
               Begin
                  mast := VTD[i];
                  pos := i;
               End;
      End;
   If pos<>0 Then
      gen2o3 := Vint[pos]
   Else
      gen2o3 := 'no existe';
End;
Procedure generarOtro(Vint:Tint;Vdur:Tdur;N:byte;Var Vnuevo:Tint;Var L:byte);

Var 
   total:  real;
   i:  byte;
Begin
   total := 0;
   L := 0;
   For i:= 1 To N Do
      total := total+Vdur[i];
   total := total/N;
   For i:= 1 To N Do
      If Vdur[i]>total Then
         Begin
            L := L+1;
            Vnuevo[l] := Vint[i];
         End;
End;
Procedure mostrar(Vnuevo:Tint;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do
      WriteLn(Vnuevo[i]);
End;

Var 
   Vint,Vnuevo:  tint;
   VTD,VTND,Vgen:  Tgen;
   Vdur:  Tdur;
   id:  st10;
   pos,N,l,m:  byte;
   T:  string[6];
   D:  real;
Begin
   LeeArchivo(Vint,Vgen,N);
   WriteLn('ingrese la cantidad e interpretes a ingresar temas');
   ReadLn(M);
   inicia1(VTD,N);
   inicia1(VTND,N);
   inicia2(Vdur,N);
   cargaTemas(VTD,Vtnd,N,M,Vint);
   WriteLn('el interprete que tiene todos sus temas disponibles del genero 2 o 3 es : ',gen2o3(Vint,Vgen,Vtd,Vtnd,N));
   generarOtro(Vint,Vdur,N,Vnuevo,L);
   mostrar(Vnuevo,l);
   Writeln('ingrese un interprete,un tema y su duracion');
   ReadLn(id,T,D);
   pos := buscapos(Vint,id,N);
   If pos<>0 Then
      Begin
         VTD[pos] := Vtd[pos]+1;
         Vdur[pos] := Vdur[pos] + D;
         WriteLn('tema ingresado con exito');
      End
   Else
      WriteLn('el interprete dado no firmo contrato o no existe');

End.

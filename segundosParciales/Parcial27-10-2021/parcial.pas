
Program parcial;

Const 
   MaxE =  50;

Type 
   ST3 =  string[3];
   st12 =  string[12];
   Treg =  Record
      ocup:  byte;
      apell:  st12;
      categ:  st3;
      prop:  char;
   End;
   Treg2 =  Record
      cat:  st3;
      exp:  real;
   End;
   Treg3 =  Record
      apell:  st12;
      piso:  byte;
   End;
   TM =  array[1..MaxE,1..6] Of Treg;
   TV =  array[1..MaxE] Of Treg2;
   TVG =  array[1..MaxE] Of Treg3;
Procedure iniciamatriz(Var mat:TM;N:byte);

Var 
   i,j:  byte;
Begin
   For i:=1 To N  Do
      For j:= 1 To 6 Do
         mat[i,j].ocup := 0;



End;
Function buscapos(Vec:TV;M:byte;categ:st3):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=M) And (vec[i].cat<>categ) Do
      i := i+1;
   If i<=M Then
      buscapos := i
   Else
      buscapos := 0;
End;
Procedure Leecategorias(Var vec:TV;Var M:byte);

Var 
   arch:  text;
   aux:  char;
Begin
   Assign(arch,'categorias.txt');
   reset(arch);
   M := 0;
   While Not eof(arch) Do
      Begin
         M := M+1;
         Read(arch,vec[M].cat,aux,aux);
         While aux<>' ' Do
            Read(arch,aux);
         ReadLn(arch,Vec[M].exp);

      End;

End;

Procedure LeeOcupantes(Var mat:TM;Var N:byte);

Var 
   arch:  text;
   i,j:  byte;
   aux:  char;
Begin
   Assign(arch,'ocupantes.txt');
   Reset(arch);
   ReadLn(arch,N);
   iniciamatriz(mat,N);
   While Not eof(arch) Do
      Begin
         Read(arch,i,j,aux);

         Readln(arch,mat[i,j].apell,aux,mat[i,j].categ,mat[i,j].ocup,aux,mat[i,j].prop);

         WriteLn(mat[i,j].prop,'  ',mat[i,j].categ);
      End;
   Close(arch);
End;
Function cumple(mat:TM;i:byte;j:byte):  boolean;
Begin
   If j=0 Then
      cumple := true
   Else
      If mat[i,j].ocup>=2 Then
         cumple := cumple(mat,i,j-1)
   Else
      cumple := False;
End;

Function cuantosPisos(mat:TM;N:byte):  byte;

Var 
   i:  byte;
   cont:  byte;
Begin
   cont := 0;
   For i:=1 To N Do
      If cumple(mat,i,6) Then
         cont := cont+1;
   cuantosPisos := cont;
End;
Procedure cuentaRecusivo(mat:TM;categ:st3;i,j:byte;Var contP,contN:byte);
Begin
   If (i=0) And (j=0) Then
      Begin
         contP := 0;
         contN := 0;

      End
   Else
      Begin
         If j=0 Then

            cuentaRecusivo(mat,categ,i-1,6,contP,contN)
         Else
            Begin


               cuentaRecusivo(mat,categ,i,j-1,contP,contN);
               If mat[i, j].categ = categ Then
                  Begin
                     If mat[i, j].prop = 'S' Then
                        contP := contP + 1
                     Else
                        contN := contN + 1;
                  End;

            End;



         // Contar solo si i y j válidos


      End;
End;
Function Expensas(vec:TV;categ:st3;pos:byte;mat:TM;N:byte):  real;

Var 
   contP,contN:  byte;
   precio:  real;

Begin
   precio := vec[pos].exp;

   cuentaRecusivo(mat,categ,N,6,contP,contN);
   Expensas := (precio*contP*0.90) + precio*contN;
End;

Procedure generarOtro(mat:TM;dpto,N:byte;Var Vgen:TVG;Var l:byte);

Var 
   i:  byte;
Begin
   L := 0;
   For i:=1 To N Do
      If mat[i,dpto].prop='S' Then
         Begin
            L := L+1;
            Vgen[l].apell := mat[i,dpto].apell;
            Vgen[l].piso := i;

         End;

End;
Procedure mostrar(Vgen:TVG;L:Byte);

Var 
   i:  Byte;
Begin
   For i:=1 To L Do
      WriteLn(Vgen[i].apell,'  ',Vgen[i].piso);
End;

Var 
   Vec:  TV;
   Vgen:  TVG;
   mat:  TM;
   N,M,l:  byte;
   pos,dpto:  byte;
   categ:  st3;

Begin
   Leecategorias(vec,M);
   LeeOcupantes(mat,N);
   WriteLn('la cantidad de pisos con mas de 2 personas es de :',cuantosPisos(mat,N));
   WriteLn('ingrese una categoria');
   ReadLn(categ);
   pos := buscapos(vec,M,categ);
   If pos<>0 Then
      WriteLn('lo que debe abonarse de expensas para la categoria ingresada tiene un valor de $: ',Expensas(vec,categ
              ,
              pos,mat,N):  8:  2)
                               Else
                                  WriteLn('la categoria ingresada no es valida');
   WriteLn('ingrese una linea de departamentos');
   ReadLn(dpto);
   generarOtro(mat,dpto,N,Vgen,L);
   mostrar(Vgen,L);
End.

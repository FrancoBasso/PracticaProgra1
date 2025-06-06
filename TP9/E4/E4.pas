
Program E4;

Type 
   st4 =  string[4];
   TR =  Record
      codA:  st4;
      talle:  char;
      colo:  byte;
      cantP:  byte;
      costo:  real;
   End;
   TarPren =  file Of TR;
Procedure Listado(Var Arch:TarPren);

Var 
   R:  TR;
   codAct:  st4;
   Tact:  char;
   cantidPT,cantTT,Pnegras:  byte;
   preciocosto:  real;
Begin
   Assign(arch,'PRENDAS.DAT');
   reset(arch);
   Read(arch,R);
   cantTT := 0;
   Pnegras := 0;
   WriteLn('    Stock de Prendas   ');
   While Not eof(arch) Do
      Begin
         codAct := R.codA;
         WriteLn('codigo: ',codAct);
         While  codAct=R.codA Do
            Begin
               Tact := R.talle;
               cantidPT := 0;
               preciocosto := 0;
               While Tact=R.talle Do
                  Begin
                     cantidPT := cantidPT+R.cantP;
                     preciocosto := preciocosto+ R.cantP*R.costo;
                     If R.colo=1 Then
                        Pnegras := Pnegras +R.cantP;
                     read(arch,R);
                  End;
               cantTT := cantTT+cantidPT;
               WriteLn('talle :',Tact,' || cantidad: ',cantidPT,'|| Pecio costo: $ ',preciocosto:8:2);

            End;
      End;
   Close(arch);
   WriteLn('cantidad total de prendas:',cantTT);
   WriteLn('procentaje de prendas negras: ',(Pnegras*100)/cantTT:  8:  2,' %');
End;

Var 
   arch:  TarPren;
Begin
   Listado(arch);
End.

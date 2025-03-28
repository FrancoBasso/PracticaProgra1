
Program E17;

Var 
   nombre,maxofer:  string[10];
   CA,i:  byte;
   precio,total,totaldesc:  real;
   promocion:  Char;
   cont,cont2,maxof:  byte;
Begin
   maxof := 0;
   cont2 := 0;
   WriteLn('ingrese el nombre del cliente');
   ReadLn(nombre);


   While nombre<>'****' Do
      Begin
         total := 0;
         totaldesc := 0;
         cont := 0;
         WriteLn('ingrese la cantidad de  articulos que compro el cliente');
         ReadLn(CA);
         For i:=1 To CA  Do
            Begin
               WriteLn(





                    'ingrese el precio base del articulo y si esta en promocion'

               );

               ReadLn(precio);
               ReadLn(promocion);
               If upcase(promocion)='S' Then
                  Begin
                     total := total+precio*0.90;
                     cont := cont+1;
                     totaldesc := totaldesc+precio*0.10
                  End
               Else
                  total := total+precio;
            End;
         If cont>maxof Then
            Begin
               maxof := cont;
               maxofer := nombre;
            End;
         If cont=CA Then
            cont2 := cont2+1;
         WriteLn('precio final :$ ',total:8:2);
         WriteLn('total de descuentos:-$',totaldesc:8:2);

         WriteLn('ingrese el nombre del cliente');
         ReadLn(nombre);



      End;
   WriteLn('el nombre del clietne que compro mas articulos en oferta fue :',
           maxofer);
   WriteLn(







       'la cantidad de clientes que compraron solo articulos en oferta fue de :'
           ,cont2);
   ReadLn()
End.

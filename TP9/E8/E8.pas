
Program E8;

Type 
   st4 =  string[4];
   TRC =  Record
      codA:  st4;
      talle:  char;
      color:  1..4;
   End;
   TRS =  Record
      CP:  TRC;
      cant:  byte;
      pcosto:  real;
   End;
   TRP =  Record
      CP:  TRC;
      cant:  byte;
   End;
   Tstock =  file Of TRS;
   Tpedido =  file Of TRP;
Procedure actualizastock(Var arstock,arstocknuevo:Tstock;Var arpedido:Tpedido);

Var 
   Rst:  TRS;
   Rpe:  TRP;
   RNS:  TRS;
   cantResultante:  byte;
Begin
   Rewrite(arstocknuevo);
   Reset(arstock);
   Reset(arpedido);
   Read(arstock,Rst);
   Read(arpedido,Rpe);
   While (Not eof(arstock)) Or (Not eof(arpedido)) Do
      Begin
         If (Rst.CP.codA=Rpe.CP.codA) And (Rst.CP.talle=Rpe.CP.talle) And ((Rst.CP.color=Rpe.CP.color)) Then
            Begin
               cantResultante := Rst.cant-Rpe.cant;
               If cantResultante>=0 Then
                  Begin
                     RNS.CP := Rst.CP;
                     RNS.cant := cantResultante;
                     RNS.pcosto := Rst.pcosto;
                     Write(arstocknuevo,RNS);

                  End
               Else
                  WriteLn('no hay cantidad suficiente de stock de :',Rst.CP.codA,' ',Rst.cp.talle,' ',Rst.cp.color);

               Read(arstock,Rst);
               Read(arpedido,Rpe);
            End
         Else
            If (Rst.CP.codA<Rpe.CP.codA) Or (Rst.CP.talle<Rpe.CP.talle) Or ((Rst.CP.color<Rpe.CP.color)) Then
               Begin
                  RNS.CP := Rst.CP;
                  RNS.cant := Rst.cant;
                  RNS.pcosto := Rst.pcosto;
                  Write(arstocknuevo,RNS);

                  Read(arstock,Rst)
               End

         Else
            If (Rst.CP.codA>Rpe.CP.codA) Or (Rst.CP.talle>Rpe.CP.talle) Or (Rst.CP.color>Rpe.CP.color) Then
               Read(arpedido,Rpe);

      End;
   Close(arstock);
   Close(arpedido);
   Close(arstocknuevo);

End;

Var 
   arstock,arstocknuevo:  Tstock;
   arpedido:  Tpedido;

Begin
   Assign(arstock,'stock.dat');
   Assign(arpedido,'pedido.dat');
   Assign(arstocknuevo,'stocknuevo.dat');
   actualizastock(arstock,arstocknuevo,arpedido);
   Erase(arstock);
   Rename(arstocknuevo,'stock.dat');

End.

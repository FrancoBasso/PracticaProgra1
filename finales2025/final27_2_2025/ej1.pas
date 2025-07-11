
Program ej1;

Type 
   st20 =  string[20];
   TRB =  Record
      nombrebodega:  st20;
      variedad:  word;
      zona:  byte;
      comerc:  char;
      cantidad:  real;
   End;
   TRH =  Record
      nombrebodega:  st20;
      cantLitros:  real;
      cantgranel:  real;
   End;
   TVA =  array[0..99] Of real;
   Tbodega =  file Of TRB;
   Thistoria =  file Of TRH;
Procedure iniciaVectoraux(Var Vaux:TVA);

Var 
   i:  byte;
Begin
   For i :=0 To 99 Do
      Vaux[i] := 0;
End;
Function zonamayor(Vaux:TVA):  integer;

Var 
   i:  byte;
   Zmax:  real;
   pos:  integer;
Begin
   Zmax := 0;
   pos := -1;
   For i:= 0 To 99 Do
      If Vaux[i]>Zmax Then
         Begin
            Zmax := Vaux[i];
            pos := i;
         End;

   zonamayor := pos;

End;
Procedure ListadoArchivonuevo(Var arbodega:Tbodega;Var arhistoria:Thistoria);

Var 
   Rbod:  TRB;
   bodactual:  st20;
   variedadAct:  word;
   Rhis:  TRH;
   Rtemp:  TRH;
   Vaux:  TVA;
   Zmax:  integer;

   totalgran,totalgranhis:  real;
   totalbot,totalbothis:  real;
   artemp:  Thistoria;
Begin
   Assign(artemp,'temporario.dat');
   Reset(arbodega);
   Reset(arhistoria);
   Rewrite(artemp);
   Read(arbodega,Rbod);
   Read(arhistoria,Rhis);
   WriteLn('produccion 2024 de vinos');

   While Not eof(arbodega) Or Not Eof(arhistoria) Do
      Begin
         If (Rhis.nombrebodega=Rbod.nombrebodega) Or (Rhis.nombrebodega>Rbod.nombrebodega) Then
            Begin
               bodactual := Rbod.nombrebodega;
               WriteLn('bodega:',bodactual,' | total litros a granel  |  total botellas fraccionado');
               WriteLn('Variedad');
               iniciaVectoraux(Vaux);
               totalgranhis := 0;
               totalbothis := 0;
               While bodactual=Rbod.nombrebodega Do
                  Begin
                     totalgran := 0;
                     totalbot := 0;
                     variedadAct := Rbod.variedad;

                     While (bodactual = Rbod.nombrebodega) And (variedadAct=Rbod.variedad) Do
                        Begin
                           If Rbod.comerc='1' Then
                              totalgran := totalgran + Rbod.cantidad
                           Else
                              If Rbod.comerc='2' Then
                                 Begin
                                    totalbot := totalbot + Rbod.cantidad;
                                    Vaux[Rbod.zona] := Vaux[Rbod.zona] + Rbod.cantidad;
                                 End;
                           Read(arbodega,Rbod);
                        End;
                     WriteLn(variedadAct,'  ',totalgran:8:2,'  ',totalbot:8:2);
                     totalgranhis := totalgranhis + totalgran;
                     totalbothis := totalbothis + totalbot;
                  End;
               Zmax := zonamayor(Vaux);
               If Zmax<>-1 Then
                  WriteLn('zona de mayor produccion de botellas fue:',Zmax)
               Else
                  WriteLn('no hay ninguna zona q registre tener produccion de botellas para esta bodega');
               Rtemp.nombrebodega := bodactual;
               Rtemp.cantLitros := totalgranhis;
               Rtemp.cantgranel := totalbothis;
               Write(artemp,Rtemp);
               Read(arhistoria,Rhis);
            End
         Else
            If (Rhis.nombrebodega<Rbod.nombrebodega) Then

               Begin
                  Rtemp.nombrebodega := Rhis.nombrebodega;
                  Rtemp.cantLitros := Rhis.cantLitros;
                  Rtemp.cantgranel := Rhis.cantgranel;
                  Write(artemp,Rtemp);
                  Read(arhistoria,Rhis);
               End;
      End;
   Close(arbodega);
   Close(arhistoria);
   Close(artemp);
   Erase(arhistoria);

   Rename(artemp,'historia.dat');

End;

Var 
   arhistoria:  Thistoria;
   arbodega:  Tbodega;
Begin
   Assign(arhistoria,'historia.dat');
   Assign(arbodega,'bodegas.dat');
   ListadoArchivonuevo(arbodega,arhistoria);


End.

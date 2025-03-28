

Program E8;


Var 
   Arch:  text;
   A, Sum, Cont :  integer;
Begin
   Assign( Arch, 'datos.TXT' );
   Reset ( Arch );
   Sum := 0;
   Cont := 0;
   While Not eof ( Arch ) Do
      Begin
         Read( Arch, A );
         If A > 0 Then
            Begin
               Sum := Sum + A ;
               Cont := Cont + 1;
            End;
      End;
   Close ( Arch );
   If Cont <> 0 Then
      Writeln( Sum / Cont:8:2 )
   Else
      Writeln ('no hay numeros positivos');
End.
//el programa saca el rpomedio de los nuemros positivos que a parezcan

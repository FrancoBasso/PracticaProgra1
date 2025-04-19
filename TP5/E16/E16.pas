
Program E16;

Const 
   MaxE =  50;

Type 
   TV =  array[1..50] Of integer;
Procedure Leevector(Var vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e4.txt');
   Reset(arch);
   While Not eof(arch)   Do
      Begin
         N := N+1;
         read(arch,vec[N]);
      End;
   Close(arch);
End;

Procedure compactar (Var vec:TV;Var N:byte );

Var 
   i,j:  byte;

Begin
   j := 0;
   For i:= 1 To N Do
      If vec[i]<>0 Then
         Begin
            j := J+1;

            vec[j] := vec[i];

         End;
   N := j;

End;
Procedure compactar2(Var vec:TV;Var N:byte);

Var 
   i,j,cont,h:  byte;
Begin
   cont := 0;
   For i:= 1 To N-cont Do
      Begin
         If vec[i]=0 Then
            Begin
               j := i;
               cont := cont+1;
               For h:= j To N-1 Do
                  vec[h] := vec[h+1];
            End;
      End;
   N := N-cont;
End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Write(vec[i]:5);
End;

Var 
   Vec:  TV;
   N:  Byte;
Begin
   Leevector(vec,N);
   mostrar(vec,N);
   WriteLn();
   compactar(vec,N);
   mostrar(vec,N);
End.

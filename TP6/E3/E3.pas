
Program E3;

Const maxE =  50;

Type 
   TM =  array[1..maxE,1..maxE] Of Integer;
   TV =  array[1..maxE] Of integer;
Procedure Leearch(Var mat:TM;Var N,Y:byte);

Var 
   arch:  text;
   j:  byte;
   Vaux:  TV;
Begin
   Assign(arch,'enteros.txt');
   reset(arch);
   N := 0;
   ReadLn(arch,Y);
   While Not eof(arch) Do
      Begin

         For j:=1 To Y Do
            Read(arch,Vaux[j]);
         If Vaux[y] Mod Vaux[1]=0 Then
            Begin
               N := N+1;
               For j:=1 To y Do
                  mat[N,J] := Vaux[J];

            End;

         ReadLn(arch);
      End;
   Close(arch);
End;
Procedure mostrarMatriz(mat:TM;N,Y:byte);

Var 
   i,j:  byte;
Begin
   For i:= 1 To N Do
      Begin
         For j:= 1 To y Do
            Write(mat[i,j]:5);
         Writeln();
      End;
End;

Var 
   mat:  TM;
   N,Y:  byte;
Begin
   Leearch(mat,N,Y);
   WriteLn('matriz obtenida');
   mostrarMatriz(mat,N,Y);
End.

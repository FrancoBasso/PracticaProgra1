
Program E6;

Const 
   maxE =  1000;

Type 
   TM =  array[1..maxE,1..maxE] Of Integer;
Procedure cuadradoMagico(Var mat:tM;N:integer);

Var 
   i,j,k:  integer;

Begin

   j := (N  Div 2) +1;
   k := 1;

   For i:= 1 To N*N Do
      Begin
         mat[k,j] := i;


         If (i Mod N=0)  Then
            Begin
               k := K+1;
               If k>N Then
                  k := 1;
            End

         Else
            Begin
               k := k-1;
               j := j+1;
               If k<1 Then
                  k := N;
               If j>N Then
                  j := 1;

            End;




      End;
End;
Procedure mostrarmatriz(mat:TM;N:integer);

Var 
   i,j:  integer;
Begin
   For i:= 1 To N Do
      Begin
         For j:= 1 To N Do
            Write(mat[i,j]:5);
         Writeln();
      End;

End;

Var 
   mat:  TM;
   N:  integer;
Begin
   WriteLn('ingrese el orden  N del cuadrado magico');
   ReadLn(N);
   cuadradoMagico(mat,N);
   mostrarmatriz(mat,N);

End.

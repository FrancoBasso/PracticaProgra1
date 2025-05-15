
Program E12;

Const 
   N =  4;
   A:  array[1..N, 1..N] Of Integer =  (
                                        (10, 1, -2, 0),
                                       (0, 12, 3, -1),
                                       (-3, 2, 15, 0),
                                       (4, -2, 1, 20)
                                       );

Type 
   TM =  array[1..4,1..4] Of integer;
Function suma(mat:tM;i,j:byte):  Integer;
Begin
   If j=0 Then
      suma := 0
   Else
      If j<>i Then
         suma := mat[i,j] + suma(mat,i,j-1)
   Else
      suma := suma(mat,i,j-1);
End;
Function verifica(mat:TM;i,M:byte):  Boolean;
Begin
   If i=0 Then
      verifica := true
   Else
      Begin
         If suma(mat,i,M)<mat[i,i] Then
            verifica := verifica(mat,i-1,M)
         Else
            verifica := False;

      End;

End;

Begin
   If verifica(A,N,N) Then
      WriteLn('la matriz verifica')
   Else
      WriteLn('la matriz no verifica');

End.

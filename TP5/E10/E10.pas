
Program E10;

Const 
   maxE =  50;
   A:  array [1..17] Of Integer =  (3, 5, -1, 3, 8, 2, -5, 2, 10, -4, -8, 4, 6, 7,-3, 11, 2);

Type 
   TV =  array [1..maxE] Of integer;
Procedure sumaEnegativos(Var B,C:TV;Var N:byte);

Var 
   i,j:  byte;
   suma,cont:  integer;
Begin
   i := 1;
   N := 0;
   While (i<=17) Do
      Begin
         If A[i]<0 Then
            Begin


               suma := 0;
               cont := 0;
               j := i+1;

               While (j<=17) And (A[j]>=0)  Do
                  Begin
                     suma := suma + A[j];
                     cont := cont+1;

                     j := j+1;

                  End;
               If (j<=17) And (A[j]<0) Then
                  Begin
                     N := N+1;
                     B[N] := suma;
                     C[N] := cont;
                     i := j;
                  End
               Else
                  i := 17 +1;

            End

         Else
            i := i+1;
      End;
End;
Procedure mostrar(B:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      Write(B[i]:5);
End;

Var 
   B,C:  TV;
   N:  byte;
Begin
   sumaEnegativos(B,C,N);
   mostrar(B,N);
   WriteLn();
   mostrar(C,N);
   ReadLn();
End.

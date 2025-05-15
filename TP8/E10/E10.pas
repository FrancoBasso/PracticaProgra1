

Program E10;

Type 
   TV =  array[1..10] Of integer;
   TV2 =  array[1..50] Of integer;

Const 
   VectorA:  array[1..10] Of Integer =  (2, 4, 5, 7, 10, 15, 16, 18, 22, 30);
   VectorB:  array[1..10] Of Integer =  (1, 3, 5, 6, 8, 11, 14, 17, 19, 25);

Procedure intercalacion(vec1, vec2: TV; i, j, N, M: Byte; Var C: TV2; Var L: Byte);
Begin
   // Inicializar L en la primera llamada
   If (i = 1) And (j = 1) Then
      L := 0;

   // Solo procedemos si alguno de los vectores aún tiene elementos
   If (i <= N) Or (j <= M) Then
      Begin
         If (i <= N) And ((j > M) Or (vec1[i] < vec2[j])) Then
            Begin
               L := L + 1;
               C[L] := vec1[i];
               intercalacion(vec1, vec2, i + 1, j, N, M, C, L);
            End
         Else If (j <= M) And ((i > N) Or (vec1[i] > vec2[j])) Then
                 Begin
                    L := L + 1;
                    C[L] := vec2[j];
                    intercalacion(vec1, vec2, i, j + 1, N, M, C, L);
                 End
         Else If ((i <= N) And (j <= M)) And (vec1[i]=vec2[j]) Then
                 Begin
                    L := L + 1;
                    C[L] := vec1[i];
                    // vec1[i] = vec2[j]
                    intercalacion(vec1, vec2, i + 1, j + 1, N, M, C, L);
                 End;
      End;
End;

Procedure mostrarC(vec:TV2;L:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To L Do
      Write(vec[i]:5)
End;

Var 
   C:  TV2;
   L:  Byte;
Begin
   intercalacion(VectorA,VectorB,1,1,10,10,C,L);
   mostrarC(C,L);

End.

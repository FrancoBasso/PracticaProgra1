
Program E6;

Const 
   A:  array [1..10] Of real =  (12.5, 23.0, 45.75, 10.0, 18.25, 30.6, 41.9, 50.3, 9.8, 27.45);
   B:  array[1..10] Of Real =  (9.8, 10.0, 12.5, 18.25, 23.0, 27.45, 30.6, 41.9, 45.75, 50.3);
   N =  10;

Type 
   TV =  array[1..10] Of real;
Function busqueda(Vec:TV;N:byte;X:real):  byte;
Begin
   If N>0 Then
      Begin
         If Vec[N]=X Then
            busqueda := N
         Else
            busqueda := busqueda(vec,N-1,X)
      End
   Else
      busqueda := 0;
End;
Function busquedabinaria(vec:TV;N:byte;i,Vmedio:byte;X:real):  byte;
Begin
   If (i>N) Then
      busquedabinaria := 0
   Else
      Begin
         If X<Vec[Vmedio] Then
            busquedabinaria := busquedabinaria(vec,Vmedio-1,i,((Vmedio-1)+i)Div 2,X)
         Else
            If X>vec[Vmedio] Then
               busquedabinaria := busquedabinaria(vec,N,Vmedio+1,(N+(Vmedio+1)) Div 2,X)
         Else
            If X=vec[Vmedio] Then
               busquedabinaria := Vmedio;
      End;



End;

Var 
   X:  real;
   pos:  byte;
Begin
   WriteLn('ingrese el valor a buscar para el vector A');
   ReadLn(X);
   pos := busqueda(A,N,X);
   If pos>0 Then
      WriteLn(X:8:2,'se encuentra en la posicion: ',pos)
   Else
      WriteLn(X:8:2,'no se encuentra en el vector A');
   WriteLn('ingrese el valor a buscar para el vector B');
   ReadLn(X);
   pos := busquedabinaria(B,N,1,(N+1) Div 2,X);
   If pos>0 Then
      WriteLn(X:8:2,'se encuentra en la posicion: ',pos)
   Else
      WriteLn(X:8:2,'no se encuentra en el vector B');


End.

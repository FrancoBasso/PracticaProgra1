
Program E9;

Const 
   maxE =  50;

Type 
   TMF =  array[1..maxE,1..maxE] Of char;
   TMC =  array[1..maxE,1..maxE] Of byte;
Procedure cargarTablero(Var T1:TMF;Var T2:TMC;N:byte) ;

Var 
   i,j:  byte;
   ficha:  char;
   cant:  byte;
Begin
   For i:=1 To N Do
      For j:=1 To N Do
         Begin
            Writeln('ingrese el color de la fichas en  ',i,' ',j,' y la cantidad');
            Repeat
               ReadLn(ficha,cant);
               ficha := upcase(ficha);
            Until (ficha='R') Or (ficha='A');
            t1[i,j] := ficha;
            T2[i,j] := cant;


         End;
End;
Function colorPredomintante(T1:TMF;N:byte):  char;

Var 
   i,j:  byte;
   contR,contA:  byte;
Begin
   contR := 0;
   contA := 0;
   For i:=1 To N Do
      For j:= 1 To N Do
         Begin
            If T1[i,j]='R' Then
               contR := contR+1
            Else
               contA := contA +1;

         End;
   If contR>contA Then
      colorPredomintante := 'R'
   Else
      colorPredomintante := 'A';

End;
Function  colorMasFichas(T1:TMF;T2:TMC;N:byte):  char;

Var 
   i,j:  byte;
   acumA:  integer;
   acumR:  integer;
Begin
   acumA :=  0;
   acumR :=  0;


   For i:= 1 To N Do
      For j:= 1 To N Do

         If T1[i,j]='R' Then
            acumR := acumR+ T2[i,j]
         Else
            acumA := acumA + T2[i,j];

   If acumR>acumA Then
      colorMasFichas := 'R'
   Else
      colorMasFichas := 'A';
End;
Function cantidadColumna(T1:TMF;N:byte):  byte;

Var 
   i,j:  byte;
   cant:  byte;
   color:  char;

Begin
   cant := 0;
   For j:= 1 To N Do
      Begin
         i := 2;
         color := t1[1,j];
         While (i<=N) And (t1[i,j]=color) Do
            i := i+1;
         If i>N Then
            cant := cant +1;
      End;
   cantidadColumna := cant;

End;

Var 
   T1:  TMF;
   T2:  TMC;
   N:  byte;

Begin
   WriteLn('ingrese la dimension NxN del tablero');
   Readln(N);
   cargarTablero(T1,T2,N);
   WriteLn('Color predominante (presente en más casillas): ',colorPredomintante(T1,N));
   WriteLn('Color con más fichas: ',colorMasFichas(T1,T2,N));
   WriteLn('Cantidad de columnas de un solo color: ',cantidadColumna(T1,N));


End.

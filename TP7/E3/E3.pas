
Program E3;

Const 
   maxE =  50;
   vecN:  array[0..6] Of string =  ('origen de coordenadas','1er cuadrante','2do cuadrante','3er cuadrante',
                                    '4to cuadrante','eje Y','Eje X');

Type 
   Treg =  Record
      X,y:  real;
      dist:  real;
      cuadrante:  byte;
   End;
   TV =  array [1..maxE] Of Treg;
   TP =  array[0..6] Of real;
Function cuadrante (X,Y:real):  byte;
Begin
   If (X>0) And (Y>0) Then
      cuadrante := 1
   Else
      If (X<0) And (Y>0) Then
         cuadrante := 2
   Else
      If (X<0) And (Y<0) Then
         cuadrante := 3
   Else
      If (X>0) And (Y<0) Then
         cuadrante := 4
   Else
      If (X=0) And (Y=0) Then
         cuadrante := 0
   Else
      If (X=0) And (Y<>0) Then
         cuadrante := 5
   Else
      If (X<>0) And (y=0) Then
         cuadrante := 6;
End;
Function Distancia(x1, y1, x2, y2: Real):  Real;
Begin
   Distancia := Sqrt(Sqr(x2 - x1) + Sqr(y2 - y1));
End;

Procedure CargarDesdeArchivo(Var puntos: TV; Var N: Byte);

Var 
   arch:  Text;
   x, y:  Real;
Begin
   Assign(arch, 'puntos.txt');
   Reset(arch);
   N := 0;
   While Not EOF(arch)  Do
      Begin
         ReadLn(arch, x, y);
         N := N + 1;
         puntos[N].x := x;
         puntos[N].y := y;
         puntos[N].dist := Distancia(x, y, 0, 0);
         puntos[N].cuadrante := cuadrante(x, y);
      End;
   Close(arch);
End;

Function masLejano(vec:TV;N:byte):  byte;

Var 
   max:  real;
   pos:  byte;
   i:  byte;
Begin
   max := vec[1].dist;
   pos := 1;
   For i:= 2 To N Do
      If vec[i].dist>max Then
         Begin
            max := Vec[i].dist;
            pos := i;
         End;
   masLejano := pos;
End;
Function mascercano(vec:TV;N:byte):  byte;

Var 
   min:  real;
   i:  byte;
   pos:  byte;
Begin
   min := vec[1].dist;
   pos := 1;
   For i:= 2 To N Do
      If vec[i].dist<min Then
         Begin
            min := Vec[i].dist;
            pos := i;
         End;
   mascercano := pos;
End;
Procedure inicializa(Vaux:TP);

Var 
   i:  byte;
Begin
   For i:= 0 To 6 Do
      Vaux[i] := 0;
End;
Procedure porcentajes (Vec:TV;N:byte);

Var 
   i:  byte;

   Vaux:  TP;

Begin
   inicializa(Vaux);


   For i:=1 To N Do
      Vaux[Vec[i].cuadrante] := Vaux[Vec[i].cuadrante] +1;



   For i:=0 To 6 Do
      Begin
         If N<>0 Then
            Begin

               Vaux[i] := (Vaux[i]*100)/N;


               WriteLn(VecN[i], ' : ',Vaux[i]:8:2,'%');
            End;
      End;
End;

Var 
   vec:  TV;
   N,pos:  byte;
Begin
   CargarDesdeArchivo(vec,N);
   pos := mascercano(vec,N);
   WriteLn('el punto mas cercano es: (',Vec[pos].X:8:2,',',vec[pos].Y:8:2,')');
   pos := masLejano(vec,N);
   WriteLn('el punto mas lejano es: (',Vec[pos].X:8:2,',',vec[pos].Y:8:2,')');
   porcentajes(vec,N);
End.

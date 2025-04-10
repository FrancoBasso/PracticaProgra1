
Program E11;

Procedure ejeSim(b,a,c:real);

Var 
   eje:  real;
   imagen:  real;

Begin
   eje := (-b)/(2*a);
   WriteLn('el eje de simetrria es x= ',eje:8:2);
   imagen := a*Sqr(eje)+B*eje+c;
   If a>0 Then
      WriteLn('la imagen presenta un maximo en:',imagen:8:2)
   Else
      If a<0 Then
         WriteLn('la imagen presenta un minimo en:',imagen:8:2);

End;
Procedure abierta(a:real);
Begin
   If a>0 Then
      WriteLn('la parabola es abierta hacia arriba')

   Else
      If a<0 Then
         WriteLn('la parabola es abierta hacia abajo');
End;
Procedure discriminante(a,b,c:real);

Var 
   D:  real;
   x1,x2:  real;
Begin
   D := Sqr(b)-4*a*c;
   If D>0 Then
      Begin
         x1 := (-b+sqrt(D))/2*a;
         x2 := (-b-sqrt(D))/2*a;
         WriteLn('las raices son:',x1:8:2,'  ',x2:8:2);
      End
   Else
      If D=0 Then
         Begin
            x1 := (-b)/2*a;
            WriteLn('la raiz unica es:',x1:8:2);
         End
   Else
      If D<0 Then
         WriteLn('las raices no son reales');
End;
Function imagen(a,b,c,x:real):  real;
Begin
   imagen := a*Sqr(x)+b*x+c;

End;

Var 
   a,b,c,x:  real;
   ingreso:  char;
Begin
   WriteLn('ingrese los valores de a b y c reapectivamente');
   ReadLn(a,b,c);
   ejeSim(b,a,c);
   abierta(a);
   discriminante(a,b,c);
   WriteLn('quiere ingresar un valor de x para saber su imagen? S/N');
   ReadLn(ingreso);
   ingreso := upcase(ingreso);
   While ingreso='S' Do
      Begin
         WriteLn('ingrese el valor de X');
         ReadLn(X);
         WriteLn('x=',X:8:2,'y= ',imagen(a,b,c,x):  8:  2);
         WriteLn('quiere seguir ingresando valores?');
         ReadLn(ingreso);
         ingreso := upcase(ingreso);

      End;

   ReadLn();
End.

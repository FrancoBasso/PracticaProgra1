
Program E1;

Const 
   maxE =  50;

Type 
   TV =  array[1..50] Of integer;
Procedure Leevector(Var vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'tp5e1.txt');
   Reset(arch);
   While Not eof(arch)   Do
      Begin
         N := N+1;
         read(arch,vec[N]);
      End;
End;
Function suma(vec:TV;N:byte):  integer;

Var 
   i:  byte;
   sum:  Integer;
Begin
   sum := 0;
   For i:=1 To N Do
      sum := sum+vec[i];
   suma := sum;
End;
Procedure MostrarPares(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   i := 2;
   While i<=N Do
      Begin
         Write(vec[i]:5);
         i := i+2;

      End;

End;
Procedure MaxyMin(vec:tv;N:byte);

Var 
   max,min:  integer;
   i:  byte;
Begin
   max := vec[1];
   min := max;
   For i:= 2 To N Do
      Begin
         If vec[i]>max Then
            max := vec[i];
         If vec[i]<min Then
            min := vec[i];
      End;
   WriteLn('el maximo elemento es el:',max);
   WriteLn('el minimo elemento es el',min);
End;
Procedure generarOtro(vec:tv;Var vec2:TV;N:byte);

Var 
   i:  byte;
   j:  byte;
Begin
   j := 0;
   For i:=N Downto 1 Do
      Begin
         j := j+1;
         vec2[j] := vec[i];

      End;


End;
Procedure mostrar(vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:=1 To N Do
      Write(vec[i]:5);
End;

Var 
   vec,vec2:  TV;
   N:  byte;
Begin
   Leevector(vec,N);
   WriteLn('la suma de sus elementos es',suma(vec,N));
   MaxyMin(vec,N);
   generarOtro(vec,vec2,N);
   MostrarPares(vec,N);
   WriteLn();
   mostrar(vec2,N);
End.

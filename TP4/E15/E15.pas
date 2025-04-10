
Program E15;
Function funcion2(n:byte):  integer;

Var 
   i:  byte;
   pot:  Integer;
Begin
   pot := 1;
   For i:= 1 To (n-1) Do
      pot := pot*2;
   funcion2 := pot;
End;
Function funcion3(n:integer):  Integer;

Var 
   i:  byte;
   fact:  Integer;
Begin
   fact := 1;
   For i:= 1 To N Do
      fact := fact*i;
   funcion3 := fact;
End;
Procedure serie_finita(N:byte;Var Res:real;F:byte);

Var 
   i:  byte;
   imp:  integer;
Begin
   res := 0;
   Case F Of 
      1:
          Begin
             For i:= 1 To n Do
                Begin
                   imp := sqr(i);
                   res := res +1/imp ;
                   WriteLn('1/',imp);
                End;

          End;
      2:
          Begin
             For i:= 1 To n Do
                Begin
                   imp := funcion2(i);
                   res := res +1/imp ;
                   WriteLn('1/',imp);
                End;
          End;
      3:
          Begin
             For i:= 1 To n Do
                Begin
                   imp := funcion3(i);
                   res := res +imp ;
                   WriteLn('1/',1/imp);
                End;
          End;
   End;
End;

Var 
   RES:  real;
   N:  byte;
   F:  byte;
Begin
   WriteLn('ingrese la cantidad de terminos a sumar');
   ReadLn(N);
   WriteLn('ingrese la que tipo de funcion quiere realizar 1, 2 ,3');
   ReadLn(F);
   serie_finita(N,res,F);
   WriteLn('el resultado de la serie es ',res:8:2);
   ReadLn()
End.

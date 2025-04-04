// En un archivo de texto se han grabado números naturales, uno por línea. Se pide leerlos, teniendo en cuenta
// solamente los que están ubicados en el rango de 1 a 99.
// Se pide, calcular e informar:
//   - la cantidad de números analizados en cada una de las decenas (ej. 34 corresponde a
//                                                                                                 decena 3).
//  - el número máximo que apareció en cada decena.
//   Por fin de proceso, indicar si hubo o no números en todas las decenas mediante una funci
//                             ón.

Program parcialito;

Type 
   TVC =  array[1..50] Of word;

Const 
   N =  10;
Procedure inicia(Var vecC,vecM:TVC);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      Begin
         vecC[i] := 0;
         vecM[i] := 0;
      End;
End;
Procedure LeeArch(Var vecC,vecM:TVC);

Var 

   Num:  word;
   arch:  text;
   pos:  byte;
Begin
   Assign(arch,'parcialito.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch,num);
         If num In [1..99] Then
            Begin
               pos := (num Div 10)+1;
               vecC[pos] := vecC[pos]+1;
               If num>vecM[pos] Then
                  vecM[pos] := num;


            End;



      End;
   Close(arch);

End;
Function valida(vecC:TVC):  Boolean;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (vecC[i]<>0) Do
      i := i+1;
   If (i<N)  Then
      valida := False
   Else
      valida := true;

End;

Var 
   vecC,vecM:  TVC;
   i:  byte;
Begin
   inicia(vecC,vecM);
   LeeArch(vecC,vecM);
   WriteLn('cantidad         maximo');
   For i:= 1 To N Do
      Begin
         WriteLn(vecC[i],'    ',vecM[i]);
      End;
   If valida(vecC) Then
      WriteLn('hay numeros en todas las decenas')
   Else
      WriteLn('no hay numeros en todas las decenas');
   ReadLn()
End.

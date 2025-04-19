
Program E6;

Const 
   maxE =  50;

Type 
   TV =  array [1..maxE] Of string;
   VC =  array[1..maxE] Of byte;
   ABC =  array[1..maxE] Of char;
Function buscapos(vecL:abc;M:byte;car:char):  byte;

Var 
   i:  byte;
Begin
   If M=0 Then
      buscapos := 0
   Else
      Begin
         i := 1;
         While (i<=m) And (vecL[i]<>car) Do
            i := i+1;
         If i<=M Then
            buscapos := i

         Else
            buscapos := 0;
      End;
End;

Procedure leeFrase (Var vec:TV;Var N,M:byte;Var contL:VC;Var vecL:ABC);

Var 
   arch:  text;
   car:  char;
   pos:  byte;
Begin
   assign(arch,'tp5e6.txt');
   reset(arch);
   N := 0;
   M := 0;
   While Not eof(arch) Do
      Begin
         Read(arch,car);
         N := N+1;
         vec[N] := '';
         While (car<>' ') And (car<>'.') Do
            Begin
               vec[N] := vec[N] + car ;
               car := upcase(car);
               pos := buscapos(vecL,M,car);
               If pos=0 Then
                  Begin
                     M := M+1;
                     vecL[M] := car;
                     contL[M] := 1;
                  End
               Else
                  contL[pos] := contL[pos]+1;


               Read(arch,car);
            End;
         WriteLn(vec[N]);

      End;
   close(arch);
End;
Function masLarga(vec:TV;N:byte):  byte;

Var 
   max:  byte;
   i:  byte;
Begin
   max := Length(vec[1]);
   For i:= 2 To N Do
      Begin
         If Length(vec[i])>max Then
            max := Length(vec[i]);
      End;
   masLarga := max;
End;
Function Diccionario(vec:TV;N:byte):  string;

Var 
   i:  byte;
   j:  byte;
   antes:  string;
Begin
   antes := vec[1];
   For i:= 2 To N Do
      Begin
         If lowercase(vec[i])<lowercase(antes) Then
            antes := vec[i];

      End;
   Diccionario := antes;
End;

Procedure mostraletras(vecL:abc;contL:VC;M:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      WriteLn('la cantidad de ocurrencias de la letra ',vecL[i],' fue de ',contL[i]);

End;

Var 
   vec:  TV;
   vecL:  abc;
   contL:  VC;
   N,M:  byte;

Begin
   leeFrase(vec,n,m,contL,vecL);
   WriteLn('el numero de la frase es:',N);
   WriteLn('la longitud de la palabra mas larga fue de: ',masLarga(vec,N));
   WriteLn('la palabra que aparece antes en el diccionario es: ',Diccionario(vec,N));
   mostraletras(vecl,contl,M);
End.


Program E5;

Const 
   maxE =  50;

Type 
   Treg =  Record
      i,j:  byte;
      valor:  Integer;
   End;
   TV =  array [1..maxE] Of Treg;
Procedure cargavector(Var vec:TV;N,M:byte;Var l:byte);

Var 
   i:  byte;
   columna:  byte;
   ingresar:  char;
Begin
   L := 0;
   For i:= 1 To N Do
      Begin
         WriteLn('desea ingresar valores para la fila',i,' ?');
         ReadLn(ingresar);
         ingresar := upcase(ingresar);
         While ingresar='S' Do
            Begin
               L := L+1;
               Repeat
                  WriteLn('ingrese la columna para la fila ',i);
                  ReadLn(columna);
               Until  (columna<=M);
               Vec[L].j := columna;
               vec[L].i := i;
               WriteLn('ingrese el valor no nulo ');
               ReadLn(vec[L].valor);
               WriteLn('desea seguir ingresando valores a esta fila?');
               ReadLn(ingresar);
               ingresar := upcase(ingresar);

            End;
      End;
End;
Function valor (j,i:byte;Vec:TV;L:byte):  Integer;

Var 
   k:  byte;
Begin
   k := 1;
   While (k<=L) And ((Vec[k].i<>i) Or (Vec[k].j<>j)) Do
      K := K+1;
   If k<=L Then
      valor := Vec[k].valor
   Else
      valor := 0;
End;
Procedure motrar(vec:TV;L,N,M:byte);

Var 
   i,j:  byte;

Begin
   For i:= 1 To N Do
      Begin

         For j:= 1 To M Do
            Write(valor(j,i,vec,L):  5);
         WriteLn();

      End;

End;

Var 
   vec:  TV;
   N,M:  byte;
   L:  byte;
Begin
   WriteLn('ingrese el tamanio NxM de la matriz');
   ReadLn(N,M);
   cargavector(vec,N,M,L);
   motrar(vec,L,N,M);
End.

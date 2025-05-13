
Program E4;

Const 
   maxE =  50;

Type 
   st15 =  string[15];
   Treg =  Record
      nombre:  st15;
      puntaje:  byte;
      contP:  byte;
   End;
   TV =  array[1..maxE] Of Treg;
   Tp =  array[1..maxE] Of byte;

Procedure cargaEquipos(Var Vec:TV;N:byte);

Var 
   i,j:  byte;
   pJ:  byte;
   resultado:  char;
Begin
   For i:= 1 To N Do
      Begin
         WriteLn('ingrese el nombre del equipo');
         ReadLn(vec[i].nombre);
         Vec[i].puntaje := 0;
         Vec[i].contP := 0;
         WriteLn('ingrese la cantidad de partidos jugados');
         ReadLn(pJ);
         For j:= 1 To pJ Do
            Begin
               Repeat
                  WriteLn('ingrese el resultado del partido ',j);
                  ReadLn(resultado);
                  resultado := upcase(resultado);

               Until resultado In ['G','E','P'];
               Case resultado Of 

                  'G':  Vec[i].puntaje := Vec[i].puntaje + 3;
                  'E':  Vec[i].puntaje := Vec[i].puntaje + 1;
                  'P':  Vec[i].contP := Vec[i].contp + 1;
               End;
            End;
      End;
End;
Procedure listado (vec:TV;N:byte);

Var 
   i:  byte;
Begin
   For i:= 1 To N Do
      WriteLn(vec[i].nombre,' puntaje :',vec[i].puntaje:5);
End;
Procedure puntero (vec:TV;N:byte);

Var 
   i:  byte;
   maxP:  byte;

Begin

   maxP := vec[1].puntaje;
   For i:=2 To N Do
      If vec[i].puntaje>maxP Then
         Begin
            maxP := vec[i].puntaje;

         End;
   WriteLn('el/los punteros son:');
   For i:= 1 To N Do
      If vec[i].puntaje=maxP Then
         Begin
            WriteLn(vec[i].nombre);
         End;
End;
Function porcentaje(vec:TV;N:byte):  real;

Var 
   i:  byte;
   cont:  byte;
Begin
   cont := 0;
   For i:= 1 To N Do
      Begin
         If vec[i].contP=0 Then
            cont := cont +1;
      End;
   If N>0 Then
      porcentaje := (cont*100)/N
   Else
      porcentaje := 0;
End;

Var 
   vec:  TV;
   N:  byte;
Begin
   WriteLn('ingrese la cantidad de equipos');
   ReadLn(N);
   cargaEquipos(vec,N);
   puntero(vec,N);
   WriteLn('el porcentaje de equipos que no perdieron ningun partido es de :',porcentaje(vec,N):  8:  2,'%');
End.

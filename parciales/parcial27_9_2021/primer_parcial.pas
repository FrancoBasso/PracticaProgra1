
Program primer_parcial;

Const 
   maxE =  50;

Type 
   st16 =  string[16];
   Tnom =  array[1..maxE] Of st16;
   Tnum =  array[1..maxE] Of byte;
Function buscapos(Vnom:Tnom;nombre:st16;N:byte):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While (i<=N) And (Vnom[i]<>nombre) Do
      i := i+1;
   If i<=N Then
      buscapos := i

   Else
      buscapos := N+1;
End;
Procedure LeeArchivo(Var Vnom:Tnom;Var Vesc,Vtiempo,Vvueltas:Tnum;Var N:byte);

Var 
   Nombre:  st16;
   pos,esc:  byte;
   arch:  text;
   tiempo:  byte;
Begin
   Assign(arch,'carrera.txt');
   Reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         Read(arch,Nombre,esc,tiempo);
         pos := buscapos(Vnom,Nombre,N);
         If pos>N Then
            Begin
               N := pos;
               Vnom[pos] := nombre;
               Vesc[pos] := esc;
               Vvueltas[pos] := 1;
               Vtiempo[pos] := tiempo;

            End
         Else
            Begin
               Vvueltas[pos] := Vvueltas[pos]+1;
               Vtiempo[pos] := Vtiempo[pos]+tiempo;
            End;
         ReadLn(arch);
      End;
   Close(arch);
   For pos:=1 To N Do
      Vtiempo[pos] := Vtiempo[pos] Div Vvueltas[pos];
End;
Procedure mostrarEscuderia(Vesc,Vvueltas:Tnum;N:byte);

Var 
   vecA:  Tnum;
   i:  byte;
   escuderia:  st16;
Begin
   For i:= 1 To 4 Do
      vecA[i] := 0;
   For i:= 1 To N Do
      vecA[Vesc[i]] := vecA[Vesc[i]] + Vvueltas[i];
   For i:=1 To 4 Do
      Begin
         Case i Of 
            1:  escuderia := 'Mercedes';
            2:  escuderia := 'Mclaren';
            3:  escuderia := 'ferrari';
            4:  escuderia := 'williams';
         End;
         WriteLn(escuderia,' : ',vecA[i]);
      End;

End;
Function primerPuesto(Vnom:tnom;Vtiempo,Vvuelta:Tnum;N:byte):  st16;

Var 
   min,pos,i:  byte;

Begin
   min := Vtiempo[1];
   pos := 1;
   For i:=2 To N Do
      If Vtiempo[i]<min Then
         Begin
            min := Vtiempo[i];
            pos := i;
         End
      Else
         If (Vtiempo[i]=min) And (Vvuelta[i]>Vvuelta[pos]) Then
            Begin
               min := Vtiempo[i];
               pos := i;
            End;

   primerPuesto := Vnom[pos];
End;
Function Cronometro(Vesc,Vtiempo:Tnum;N:byte;E,T:byte):  Boolean;

Var 
   i:  byte;
   cumple:  Boolean;
Begin
   i := 1;
   cumple := true;
   While (i<=N) Do
      If (Vesc[i]=E) And (Vtiempo[i]>T) Then
         Begin
            i := N+1;
            cumple := false;
         End
      Else
         i := i+1;
   Cronometro := cumple;
End;

Var 
   Vnom:  TNOM;
   Vtiempo,Vvuelta,Vesc:  Tnum;
   N,E,T:  byte;
Begin
   LeeArchivo(Vnom,Vesc,Vtiempo,Vvuelta,N);
   mostrarEscuderia(Vesc,Vvuelta,N);
   WriteLn('el primer puesto es para:',primerPuesto(Vnom,Vtiempo,Vvuelta,N));
   WriteLn('ingrese el codigo de escuderia 1 a 4 y el tiempo promedio');
   ReadLn(E,T);
   If Cronometro(Vesc,Vtiempo,N,E,T) Then
      WriteLn('todos los corredores de la escuderia relizaron el cicuito en el tiempo ingresado')

   Else
      WriteLn('lo corredores no realizaron el cicuito en el tiempo dado');

End.

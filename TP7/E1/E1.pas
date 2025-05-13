
Program E1;

Const 
   maxE =  50;
   M =  4;

Type 
   st15 =  string[15];
   Treg =  Record
      nombre:  st15;
      dia,mes:  byte;
      anio:  word;
   End;
   TV =  array[1..maxE] Of Treg;
   TE =  array[1..maxE] Of byte;
Procedure iniciavec(Vestacion:TE);

Var 
   i:  byte;
Begin
   For i:= 1 To M Do
      Vestacion[i] := 0;
End;
Procedure LeeArchivo(Var Vec:TV;Var N:byte);

Var 
   arch:  text;
Begin
   N := 0;
   Assign(arch,'empleados.txt');
   reset(arch);
   While Not eof(arch) Do
      Begin
         N := N+1;
         With vec[N] Do
            Begin
               readln(arch,nombre,dia,mes,anio);


            End;
      End;
End;
Procedure creaVector(Var Vestacion:TE;Vec:TV;N:byte);

Var 
   i:  byte;
Begin
   iniciavec(Vestacion);
   For i:= 1 To N Do
      Begin
         If ((vec[i].mes=3) And (vec[i].dia >= 21)) Or ((vec[i].mes = 4) Or (vec[i].mes = 5)) Or ((vec[i].mes = 6) And
            (vec[i].dia <= 20)) Then
            Vestacion[1] := Vestacion[1]+1
         Else If ((vec[i].mes = 6) And (vec[i].dia >= 21)) Or ((vec[i].mes = 7) Or (vec[i].mes = 8)) Or ((vec[i].mes = 9
                 ) And (vec[i].dia <= 22)) Then
                 Vestacion[2] := Vestacion[2]+1
         Else If ((vec[i].mes = 9) And (vec[i].dia >= 23)) Or ((vec[i].mes = 10) Or (vec[i].mes = 11)) Or ((vec[i].mes =
                 12) And
                 (vec[i].dia <= 20)) Then
                 Vestacion[3] := Vestacion[3]+1
         Else
            Vestacion[4] := Vestacion[4]+1;


      End;
End;
Function estacion(Vestacion:TE):  st15;

Var 
   i:  byte;
   max:  byte;
   pos:  byte;
   nombre:  st15;
Begin
   max := Vestacion[1];
   pos := 1;

   For i:=2 To M Do
      If Vestacion[i]>max Then
         Begin
            max := Vestacion[i];
            pos :=  i;
         End;
   Case pos Of 
      1:  nombre := 'otonio';
      2:  nombre := 'invierno';
      3:  nombre := 'primavera';
      4:  nombre := 'verano';
   End;
   estacion := nombre;

End;

Var 
   vec:  TV;
   Vestacion:  TE;
   N:  byte;

Begin
   LeeArchivo(vec,N);
   creaVector(Vestacion,vec,N);
   WriteLn('la estacion en donde se festejan mas cumpleanios es: ',estacion(Vestacion));

End.


Program E12;

Const 
   maxE =  50;

Type 
   TVC =  array [1..maxE] Of string;
   TVP =  array [1..maxE] Of real;
   TVL =  array [1..maxE] Of char;
Procedure LeeArchivo(Var Vclave:TVC;Var Vprom:TVP;Var Vcar:TVL;Var N:byte);

Var 
   clave:  string;
   car:  char;
   cont,i:  byte;
   num:  Integer;
   prom:  real;
   arch:  text;
Begin
   Assign(arch,'tp5e12.txt');
   Reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         prom := 0;
         clave := '';
         cont := 0;
         read(arch,car);
         While car<>' ' Do
            Begin
               If (car In ['a'..'z']) Or (car In ['A'..'Z']) Or (car In ['1'..'9']) Then
                  clave := clave + car
               Else
                  cont := cont+1;
               Read(arch,car);
            End;
         For I:= 1 To 3 Do
            Begin
               Read(arch,num);
               prom := num+prom;
            End;
         Read(arch,car);
         While car=' ' Do
            Read(arch,car);
         If (car<>clave[Length(clave)]) And (cont<=3) Then
            Begin
               N := N+1;
               Vclave[N] := clave;
               Vprom[N] := prom/3;
               Vcar[N] := car;
            End;
         ReadLn(arch);



      End;
   Close(arch);
End;
Function claveMax(Vclave:TVC;Vprom:TVP;Vcar:TVL;N:byte;letra:char):  string;

Var 
   i:  Byte;
   max:  real;
   cMax:  string;
Begin
   max := 0;
   For i:=1 To N Do
      Begin
         If Vcar[i]=letra Then
            If Vprom[i]>max Then
               Begin
                  max := Vprom[i];
                  cMax := Vclave[i];
               End;
      End;
   claveMax := cMax;
End;
Procedure promyletra(Vclave:TVC;Vprom:TVP;Vcar:TVL;N:byte;clave:String);

Var 
   i:  Byte;
Begin
   i := 1;
   While (i<=N) And (Vclave[i]<>clave) Do
      i := i+1;
   If i<=N Then
      Begin
         WriteLn('promedio para la clave ',clave,' : ',Vprom[i]:8:2);
         WriteLn('letra asociada a ',clave,': ',Vcar[i]);
      End
   Else
      WriteLn('la clave ingresada no es valida');

End;
Procedure mostrar1(Vclave:TVC;N:byte);

Var 
   i:  byte;
Begin
   For i := 1 To N Do
      WriteLn(Vclave[i]);
End;
Procedure mostrar2(Vprom:TVP;N:byte);

Var 
   i:  byte;
Begin
   For i := 1 To N Do
      WriteLn(Vprom[i]:8:2);
End;
Procedure mostrar3(Vcar:TVl;N:byte);

Var 
   i:  byte;
Begin
   For i := 1 To N Do
      WriteLn(Vcar[i]);
End;

Var 
   Vclave:  TVC;
   Vprom:  TVP;
   Vcar:  TVl;
   N:  byte;
   clave:  String;
   letra:  char;
Begin
   LeeArchivo(Vclave,Vprom,Vcar,N);
   mostrar1(Vclave,N);
   mostrar2(Vprom,N);
   mostrar3(Vcar,N);
   WriteLn('ingrese una letra ');
   ReadLn(letra);
   WriteLn('la clave del promedio max asociado a la letra ingresada es:',claveMax(Vclave,Vprom,Vcar,N,letra));
   WriteLn('ingrese un clave');
   ReadLn(clave);
   promyletra(Vclave,Vprom,Vcar,N,clave);


End.

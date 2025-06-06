
Program EI;

Const 
   maxE =  50;

Type 
   st3 =  string[3];
   Treg =  Record
      cod:  st3;
      Dreal:  real;
   End;
   TM =  array[1..maxE,1..maxE] Of real;
   TVR =  array[1..maxE] Of Treg;
Procedure LeeAeoropuertos(Var Vaero:TVR;Var N:Byte);

Var 
   arch:  text;
Begin
   assign(arch,'aeropuertos.txt');
   reset(arch);
   N := 0;
   While Not eof(arch) Do
      Begin
         N := N+1;
         ReadLn(arch,Vaero[N].cod,Vaero[N].Dreal);

      End;
   Close(arch);
End;
Procedure iniciamatriz(Var mat:TM;N:byte);

Var 
   i,j:  byte;
Begin
   For i:=1 To N Do
      For j:=1 To N Do
         mat[i,j] := 0;
End;
Function buscapos(Vaero:TVR;cod:ST3):  byte;

Var 
   i:  byte;
Begin
   i := 1;
   While vaero[i].cod<>cod Do
      i := i+1;
   buscapos := i;
End;
Procedure LeeVuelos(Var mat:TM;Vaero:TVR;N:byte);

Var 
   arch:  text;
   aux:  char;
   posO,posD:  byte;
   cod:  st3;
Begin
   Assign(arch,'vuelos.txt');
   reset(arch);
   iniciamatriz(mat,N);
   While Not eof(arch) Do
      Begin
         Read(arch,cod,aux);
         posO := buscapos(Vaero,cod);
         Read(arch,cod);
         posD := buscapos(Vaero,cod);
         ReadLn(arch,mat[posO,posD]);
      End;
   close(arch);
End;
Procedure sumaFilaycolumna(mat:TM;i:byte;Var sumaF,sumaC:Real;Var contF,contC:Byte;N:byte);

Var 
   J:  byte;
Begin
   For J:=1 To N Do
      Begin
         If (mat[i,j]<>0) Then
            Begin
               sumaF := sumaF+mat[i,j];
               contF := contF+1;
            End;
         If mat[j,i]<>0 Then
            Begin
               sumaC := sumaC + mat[j,i];
               contC := contC+1;
            End;

      End;

End;


Procedure GenerarOtro(Vaero:TVR;mat:TM;N:byte;Var Vgen:TVR;Var l:byte;X:real);

Var 
   i,contF,contC:  byte;
   sumaF,sumaC:  real;

Begin
   L := 0;
   For i:=1 To N Do
      If Vaero[i].Dreal<X Then
         Begin
            sumaF := 0;
            sumaC := 0;
            contF := 0;
            contC := 0;
            sumaFilaycolumna(mat,i,sumaF,sumac,contF,contC,N);

            L := L+1;
            Vgen[l].cod := Vaero[i].cod;
            If (contF<>0) Or (contC<>0) Then
               Vgen[L].Dreal := (sumaF+sumaC)/(contF+contC)
            Else
               Vgen[L].Dreal := 0;
         End;

End;
Procedure mostrar(Vgen:TVR;L:byte);

Var 
   i:  byte;
Begin
   For i:=1 To L Do
      WriteLn(Vgen[i].cod,'  ',Vgen[i].Dreal:5:2);
End;
Procedure escala(Vaero:TVR;mat:TM;C:real;codO,codD:st3;N:byte);

Var 
   VD:  real;
   Vactual:  real;
   posO,posD:  byte;
   escala,j:  byte;
   Valid:  Boolean;
Begin
   posO := buscapos(Vaero,codO);
   posD := buscapos(Vaero,codD);
   VD := (mat[posO,posD])*C + (Vaero[posO].Dreal + Vaero[posD].Dreal);
   j := 1;
   Valid := true;
   While (J<=N) And valid Do
      Begin
         If j<>posO Then
            Begin

               Vactual := (mat[posO,j]+mat[j,posD])*C + (Vaero[posO].Dreal+Vaero[posD].Dreal+Vaero[j].Dreal);
               If Vactual<VD Then
                  Begin
                     Valid := false;
                     escala := j;

                  End;

            End;
         J := J+1;
      End;
   If Valid Then
      WriteLn('el mejor precio es el vuelo directo con un costo de :',VD:8:2)
   Else
      WriteLn('es mejor la escala en el aeropuerto con codigo: ',Vaero[escala].cod,' con un valor final de ',Vactual:5:2
      );
End;

Var 
   Vaero,Vgen:  TVR;
   mat:  TM;
   N,L:  Byte;
   X,C:  real;
   codO,codD:  st3;
Begin
   LeeAeoropuertos(Vaero,N);
   LeeVuelos(mat,Vaero,N);
   WriteLn('ingrese un valor X');
   ReadLn(X);
   GenerarOtro(Vaero,mat,N,Vgen,L,X);
   mostrar(Vgen,L);
   WriteLn('ingrese un codigo de aeopuerto de origen y otro de destino');
   ReadLn(codO);
   ReadLn(codD);
   WriteLn('ingrese un valor C');
   ReadLn(C);
   escala(Vaero,mat,C,codO,codD,N);





End.

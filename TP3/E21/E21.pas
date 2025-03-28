
Program E21;


Var 
   num:  integer;
   max:  integer;
   cont,cont2,maxsub,maximo:  byte;
   arch:  text;
Begin
   max := 0;
   cont := 0;
   cont2 := 0;
   maxsub := 0;
   assign(arch,'datos21.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         Read(arch,num);


         If num>0 Then
            Begin
               If num>max Then
                  max := num;
               cont2 :=  cont2+1;
            End
         Else
            If cont2>0 Then
               Begin
                  cont := cont+1;
                  If cont2>maxsub Then
                     Begin
                        maxsub := cont2;
                        maximo := cont;
                     End;

                  WriteLn('subconjunto:',cont,'maximo:',max);
                  max := 0;
                  cont2 := 0;
               End;
      End;
   WriteLn('el subconjunto q mas elementos tiene es el subconjunto: ',maximo);
   Close(arch);
   ReadLn()


End.

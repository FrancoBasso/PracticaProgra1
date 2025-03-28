
Program E20;

Var 
   arch:  text;
   num:  Integer;
   prom:  real;
   cont:  byte;
Begin
   Assign(arch,'datos20.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         prom := 0;
         cont := 0;
         Read(arch,num);
         If num<0 Then
            Read(arch,num);
         While (num>=0) And (Not eof(arch)) Do
            Begin
               prom := prom+num;
               If num<>0 Then
                  cont := cont+1;
               read(arch,num);
            End;
         If num<0 Then
            WriteLn(prom/cont:8:2);
      End;
   Close(arch);
   ReadLn();
End.

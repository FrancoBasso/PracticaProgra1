
Program E19;

Var 
   num:  integer;
   max:  integer;
   arch:  text;
Begin
   max := 0;
   assign(arch,'datos19.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         Read(arch,num);
         If num>0 Then
            Begin
               If num>max Then
                  max := num;

            End
         Else
            Begin
               WriteLn(max);
               max := 0;
            End;
      End;
   Close(arch);
   ReadLn()


End.

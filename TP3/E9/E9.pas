
Program E9;

Var 
   arch:  text;
   num,num2:  integer;
   cumple:  boolean;
Begin
   cumple := true;
   Assign(arch,'E9.txt');
   Reset(arch);
   Read(arch,num);


   While Not eof(arch) Do
      Begin
         Read(arch,num2);
         If num>num2 Then
            Begin
               cumple := False
            End

         Else
            num := num2;
      End;
   If cumple Then
      WriteLn('los numeros tienen orden ascendente')

   Else
      WriteLn('los numeros no tienen orden ascendente');



   ReadLn()

End.

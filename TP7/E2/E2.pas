


Program E2;

Const 
   maxE =  8;

Type 
   Treg =  Record
      tipo:  char;
      color:  byte;
   End;

   TM =  array [1..maxE,1..maxE] Of Treg;

Procedure iniciaMatriz(Var tablero: TM);

Var i, j:  byte;
Begin
   For i := 1 To maxE Do
      For j := 1 To maxE Do
         Begin
            tablero[i,j].color := 0;
            tablero[i,j].tipo := ' ';
         End;
End;

Procedure LeeJugada(Var tablero: TM);

Var 
   arch:  text;
   fila, col:  byte;
   aux:  char;
   auxTipo:  char;
   auxColor:  byte;
Begin
   Assign(arch, 'tablero.txt');
   Reset(arch);
   While Not eof(arch) Do
      Begin
         ReadLn(arch, fila, col, aux,auxTipo, auxColor);
         tablero[fila, col].tipo := auxTipo;
         tablero[fila, col].color := auxColor;
      End;
   Close(arch);
End;

Procedure atacaDefiendefila(tablero: TM; fT, cT: byte; Var pos1, pos2: byte);

Var i:  byte;
Begin
   i := cT + 1;
   While (i <= maxE) And (tablero[fT, i].color = 0) Do
      i := i + 1;
   If i <= maxE Then pos1 := i
   Else pos1 := 0;

   i := cT - 1;
   While (i >= 1) And (tablero[fT, i].color = 0) Do
      i := i - 1;
   If i >= 1 Then pos2 := i
   Else pos2 := 0;
End;

Procedure atacaDefiendecolumna(tablero: TM; fT, cT: byte; Var pos1, pos2: byte);

Var i:  byte;
Begin
   i := fT + 1;
   While (i <= maxE) And (tablero[i, cT].color = 0) Do
      i := i + 1;
   If i <= maxE Then pos1 := i
   Else pos1 := 0;

   i := fT - 1;
   While (i >= 1) And (tablero[i, cT].color = 0) Do
      i := i - 1;
   If i >= 1 Then pos2 := i
   Else pos2 := 0;
End;

Function fichaDF(tablero: TM; fT, col1, col2: byte):  byte;
Begin
   fichaDF := 0;
   If (col1 <> 0) And (col2 <> 0) Then
      Begin
         If (tablero[fT, col1].color = 2) And (tablero[fT, col2].color = 1) Then
            fichaDF := col1
         Else If (tablero[fT, col1].color = 1) And (tablero[fT, col2].color = 2) Then
                 fichaDF := col2;
      End;
End;

Function fichaDC(tablero: TM; cT, fil1, fil2: byte):  byte;
Begin
   fichaDC := 0;
   If (fil1 <> 0) And (fil2 <> 0) Then
      Begin
         If (tablero[fil1, cT].color = 2) And (tablero[fil2, cT].color = 1) Then
            fichaDC := fil1
         Else If (tablero[fil1, cT].color = 1) And (tablero[fil2, cT].color = 2) Then
                 fichaDC := fil2;
      End;
End;

Procedure AtacaYdefiende(tablero: TM; fT, cT: byte);

Var 
   fila1, fila2, col1, col2:  byte;
   defC, defF:  byte;
Begin
   atacaDefiendefila(tablero, fT, cT, col1, col2);
   atacaDefiendecolumna(tablero, fT, cT, fila1, fila2);
   defF := fichaDF(tablero, fT, col1, col2);
   defC := fichaDC(tablero, cT, fila1, fila2);

   // DEFENSA EN FILA Y COLUMNA
   If defF <> 0 Then
      WriteLn('La torre defiende en su fila a un/a ', tablero[fT, defF].tipo, ' color ', tablero[fT, defF].color)
   Else
      WriteLn('La torre no defiende a nadie en su fila');

   If defC <> 0 Then
      WriteLn('La torre defiende en su columna a un/a ', tablero[defC, cT].tipo, ' color ', tablero[defC, cT].color)
   Else
      WriteLn('La torre no defiende a nadie en su columna');

   // ATAQUE EN FILA
   If (col1 <> 0) And (tablero[fT, col1].color = 1) Then
      WriteLn('La torre ataca en su fila a un/a ', tablero[fT, col1].tipo)
   Else If (col2 <> 0) And (tablero[fT, col2].color = 1) Then
           WriteLn('La torre ataca en su fila a un/a ', tablero[fT, col2].tipo)
   Else
      WriteLn('No ataca a nadie en su fila');

   // ATAQUE EN COLUMNA
   If (fila1 <> 0) And (tablero[fila1, cT].color = 1) Then
      WriteLn('La torre ataca en su columna a un/a ', tablero[fila1, cT].tipo)
   Else If (fila2 <> 0) And (tablero[fila2, cT].color = 1) Then
           WriteLn('La torre ataca en su columna a un/a ', tablero[fila2, cT].tipo)
   Else
      WriteLn('No ataca a nadie en su columna');
End;
Procedure MostrarTablero(tablero: TM);

Var 
   i, j:  byte;
Begin
   WriteLn('  1 2 3 4 5 6 7 8');
   // Cabecera de columnas
   For i := 1 To maxE Do
      Begin
         Write(i, ' ');
         // Número de fila
         For j := 1 To maxE Do
            Begin
               If tablero[i, j].tipo <> ' ' Then
                  Write(tablero[i, j].tipo, ' ')
               Else
                  Write('. ');
            End;
         WriteLn;
      End;
End;


Var 
   tablero:  TM;
   fT, cT:  byte;

Begin
   iniciaMatriz(tablero);
   LeeJugada(tablero);
   MostrarTablero(tablero);

   WriteLn('Ingrese la posición de la torre negra (fila y columna del 1 al 8):');
   ReadLn(fT, cT);
   AtacaYdefiende(tablero, fT, cT);
End.

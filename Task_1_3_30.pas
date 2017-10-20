Program Task_1_1_30;

Type Matrix = Array of Array of Integer;

Var InputMatrix: Matrix;
Var M, N: Integer;

Function ReadMatrix(M: Integer; N: Integer): Matrix;
Var MatrixToRead: Matrix;
Var i, j: integer;
Begin
  	SetLength(MatrixToRead, M, N);

	i := 0;
	while (i < M) do
	begin
		j := 0;
		while (j < N) do
		begin
			Write('Enter element [', i, ',', j, ']: ');
			Readln(MatrixToRead[i, j]);
			j := j + 1;
		end;
		i := i + 1;
	end;
	ReadMatrix := MatrixToRead;
End;

Procedure OutputMatrix(OutputMatrix: Matrix; M: Integer; N: Integer);
Var i, j: integer;
Begin
	i:=0;
	while (i < M) do
	begin
		j := 0;
		while (j < N) do
		begin
			Write(OutputMatrix[i, j], ' ');
			j := j + 1;
		end;
		Writeln;
		i := i + 1;
	end;
End;

Function SwapRows(GivenMatrix: Matrix; RowIndexA: Integer; RowIndexB: Integer; M: Integer): Matrix;
Var i, Tmp: Integer;
Begin
	i := 0;
	while (i < M) do
	begin
		Tmp := GivenMatrix[i][RowIndexA];
		GivenMatrix[i][RowIndexA] := GivenMatrix[i][RowIndexB];
		GivenMatrix[i][RowIndexB] := Tmp;
		i := i + 1;
	end;
	SwapRows := GivenMatrix;
End;


Function ProcessMatrix(MatrixToProcess: Matrix; M: Integer; N: Integer): Matrix;
Var i, j: integer;
Var HeadArray : Array of Integer;
Begin
	HeadArray := MatrixToProcess[0];

	i := 0;
	while (i < N) do
	begin
		j := i + 1;
		while (j < N) do
		begin
			if (HeadArray[i] > HeadArray[j]) then
			begin
				MatrixToProcess := SwapRows(MatrixToProcess, i, j, M);
			end;
			j := j + 1;
		end;
		i := i + 1;
	end;
End;

Begin
	Write('Enter M (array width): ');
	Readln(M);
	Write('Enter N (array height): ');
	Readln(N);
	InputMatrix := ReadMatrix(M, N);

	Writeln('OK. Your array:');
	OutputMatrix(InputMatrix, M, N);
	
	Writeln('Wait...');
	InputMatrix := ProcessMatrix(InputMatrix, M, N);

	Writeln('OK. Result:');
	OutputMatrix(InputMatrix, M, N);
End.

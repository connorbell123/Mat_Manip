{ MATMANIP - A simple program that allows you to manipulate one or two matrices.
  © 2024 Connor Bell
  Date of Last Edit: 2024-07-06
}
unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Menus, Vcl.Imaging.pngimage, DateUtils;

type
  // Define the Type TMatrix Array, which is a dynamic multidimentional array.
  TMatrixArray = Array of Array of Integer;

type
  TfrmMain = class(TForm)
    matA: TStringGrid;
    pnlMatA: TPanel;
    sedRowsA: TSpinEdit;
    sedColsA: TSpinEdit;
    btnSetA: TButton;
    btnClearA: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlMatB: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    matB: TStringGrid;
    sedRowsB: TSpinEdit;
    sedColsB: TSpinEdit;
    btnSetB: TButton;
    btnClearB: TButton;
    pnlResult: TPanel;
    Label9: TLabel;
    matResult: TStringGrid;
    btnSaveResult: TButton;
    btnClearResult: TButton;
    pnlOperations: TPanel;
    Label7: TLabel;
    btnOperate: TButton;
    cmbOperation: TComboBox;
    cmbMatrix: TComboBox;
    Label8: TLabel;
    Label10: TLabel;
    mmMain: TMainMenu;
    Help1: TMenuItem;
    Help2: TMenuItem;
    sbarMain: TStatusBar;
    imgMatAStatus: TImage;
    imgMatBStatus: TImage;
    imgOperationStatus: TImage;
    tmrStatusPanelDateTime: TTimer;
    heme1: TMenuItem;
    Settings1: TMenuItem;
    procedure btnClearAClick(Sender: TObject);
    procedure sedRowsAChange(Sender: TObject);
    procedure sedColsAChange(Sender: TObject);
    procedure matAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClearBClick(Sender: TObject);
    procedure sedRowsBChange(Sender: TObject);
    procedure sedColsBChange(Sender: TObject);
    procedure matBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSetAClick(Sender: TObject);
    procedure btnSetBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrStatusPanelDateTimeTimer(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure cmbOperationChange(Sender: TObject);
    procedure cmbMatrixChange(Sender: TObject);
    procedure btnOperateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    iAColCount, iARowCount, iBColCount, iBRowCount : Integer;
    iRColCount, iRRowCount : Integer;

    bSetAOK, bSetBOK : Boolean;

    sOperation, sMatrix : string;

    { Verify StringGrid Function - This function will ensure that
      all characters entered into the matrix are integers only. }
    function Verify_StringGrid(pStringGrid_Name: string; pRowCount,
    pColCount: Integer): Boolean;

    { Populate the Matrix Array (arrMatrix_A or arrMatrix_B) from
    the StringGrid }
    procedure Populate_Matrix(Arr: TMatrixArray; pMatrix_Name : string);

    function Add_Matrices(Arr_A, Arr_B : TMatrixArray; pRows,
    pCols : Integer) : TMatrixArray;

    procedure Populate_ResultStringGrid(Arr : TMatrixArray);
  end;

var
  frmMain: TfrmMain;
  // Matrix Arrays for Mat A, B and the Result:
  arrMatrix_A, arrMatrix_B, arrMatrix_Result : TMatrixArray;


implementation

{$R *.dfm}

function TfrmMain.Add_Matrices(Arr_A, Arr_B : TMatrixArray; pRows,
pCols : Integer) : TMatrixArray;
var
  iRows, iCols : Integer;
begin
  // Function to ADD Two Matrices
  { We will check that the two matrices are the same size before we call
  this function - probably on btnOperate.Click. So it is safe to assume
  that they are the same size. }

  // Mat A, Mat B and the Result are the same size
  SetLength(Result, pRows, pCols);

  // Set the size of the resultant matrix
  matResult.RowCount := iARowCount;
  matResult.ColCount := iAColCount;
  for iRows := Low(Arr_A) to High(Arr_A) do { Using Arr_A or Arr_B doesn't matter,
   are the same size...}
    begin
      for iCols := Low(Arr_A) to High(Arr_A) do
        begin
          Result[iRows][iCols] := (Arr_A[iRows][iCols] + Arr_B[iRows][iCols]);
        end;
    end;
end;

procedure TfrmMain.btnClearAClick(Sender: TObject);
var
  iRows, iCols : Integer;
begin
  // Clear and Reset Mat A StringGrid

  with matA do
    begin
      ColCount := 5;
      RowCount := 5;
      for iRows := 0 to 4 do
        begin
          for iCols := 0 to 4 do
            begin
              Cells[iCols, iRows] := '';
            end;
        end;
    end;

  sedRowsA.Value := 5;
  sedColsA.Value := 5;

  btnClearA.Enabled := False;
  btnSetA.Enabled := False;

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';

  // Set Mat A Status to Not Ready
  bSetAOK := False;
  imgMatAStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatAStatus.Hint := 'Matrix A is not ready';
end;

procedure TfrmMain.btnClearBClick(Sender: TObject);
var
  iRows, iCols : Integer;
begin
  // Clear Mat B StringGrid
  with matB do
    begin
      ColCount := 5;
      RowCount := 5;
      for iRows := 0 to 4 do
        begin
          for iCols := 0 to 4 do
            begin
              Cells[iCols, iRows] := '';
            end;
        end;
    end;

  sedRowsB.Value := 5;
  sedColsB.Value := 5;

  btnClearB.Enabled := False;
  btnSetB.Enabled := False;

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';

  // Set Mat B Status to Not Ready
  bSetBOK := False;
  imgMatBStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatBStatus.Hint := 'Matrix B is not ready';
end;

procedure TfrmMain.btnOperateClick(Sender: TObject);
begin
  // Operate Button Click
  if sOperation = 'Add' then
    begin
      // Perform the Addition Operation on Mat A and Mat B
      // Check that they are the same size!!!
      if (iARowCount = iBRowCount) and (iAColCount = iBColCount) then
        begin
          // Call the Matrix Addition Function
          arrMatrix_Result := Add_Matrices(arrMatrix_A, arrMatrix_B, iARowCount,
          iAColCount);
          // Display the Result in the string grid!
          Populate_ResultStringGrid(arrMatrix_Result);
          // Indicate that the operation was completed.
          sbarMain.Panels[1].Text := 'Completed';
        end
      else
        begin
          // Mat A and Mat B are not the same size, so we cannot perform addition.
          MessageDlg('Matrix A and B are not the same size, so they cannot be added.'
          + #13 + 'Please ensure that they are the same size and try again.',
          TMsgDlgType.mtError, [mbOK], 0);
          cmbOperation.SetFocus;
        end;
    end;


  // Enable Result Buttons
  btnSaveResult.Enabled := True;
  btnClearResult.Enabled := True;

end;

procedure TfrmMain.btnSetAClick(Sender: TObject);
begin
  { Set Mat A - this will store the integer values from the Mat A StringGrid
    into a 2D array called arrMatrix_A }

  { Get the numbers of rows and columns of the Mat A and store in global
    variables }
  iARowCount := matA.RowCount;
  iAColCount := matA.ColCount;

  { Verify using the function Verify_StringGrid, that the StringGrid, Mat A
  contains no characters other than integers. }

  if (Verify_StringGrid('Mat A', iARowCount, iAColCount) = False) then
    begin
      { There are other illegal non-integer characters in the matrix!
        so display an error message to the user - promting them to enter
        only integer values into the matrix. }
      MessageDlg('Please enter only integer values into the matrix.',
      TMsgDlgType.mtError, [mbOK], 0);
      bSetAOK := False;
      // Set the Matrix Status Icon to Not Ready
      imgMatAStatus.Picture.LoadFromFile('Not_Ready.png');
      imgMatAStatus.Hint := 'Matrix A is not ready';
    end
  else
    begin
      // Mat A StringGruid is OK - all input characters are integers.
      bSetAOK := True;

      // Populate the Matrix Array - arrMatrix_A
      SetLength(arrMatrix_A, iARowCount, iAColCount);
      Populate_Matrix(arrMatrix_A, 'Mat A');

      // Set the Matrix Status Icon to Ready
      imgMatAStatus.Picture.LoadFromFile('Ready.png');
      imgMatAStatus.Hint := 'Matrix A is ready';

      // Enable Matrix B panel
      pnlMatB.Enabled := True;
    end;
end;

procedure TfrmMain.btnSetBClick(Sender: TObject);
begin
  { Set Mat B - this will store the integer values from the Mat B StringGrid
    into a 2D array called arrMatrix_B }

  { Get the numbers of rows and columns of the Mat B and store in global
    variables }
  iBRowCount := matB.RowCount;
  iBColCount := matB.ColCount;

  { Verify using the function Verify_StringGrid, that the StringGrid, Mat B
  contains no characters other than integers. }

  if (Verify_StringGrid('Mat B', iBRowCount, iBColCount) = False) then
    begin
      { There are other illegal non-integer characters in the matrix!
        so display an error message to the user - promting them to enter
        only integer values into the matrix. }

      MessageDlg('Please enter only integer values into the matrix.',
      TMsgDlgType.mtError, [mbOK], 0);

      bSetBOK := False;

      imgMatBStatus.Picture.LoadFromFile('Not_Ready.png');
      imgMatBStatus.Hint := 'Matrix B is not ready';
    end
  else
    begin
      // Mat B StringGruid is OK - all input characters are integers.
      bSetBOK := True;

      imgMatBStatus.Picture.LoadFromFile('Ready.png');
      imgMatBStatus.Hint := 'Matrix B is ready';

      // Populate the Matrix Array - arrMatrix_B
      SetLength(arrMatrix_B, iBRowCount, iBColCount);
      Populate_Matrix(arrMatrix_B, 'Mat B');

      // Enable the Operations Panel
      if (bSetAOK = True) and (bSetBOK = True) then
        begin
          // Set Operations Status to Ready
          pnlOperations.Enabled := True;
          imgOperationStatus.Picture.LoadFromFile('Ready.png');
          sbarMain.Panels[1].Text := 'Ready';
        end
      else
        begin
          // Set Operations Status to Not Ready
          pnlOperations.Enabled := False;
          imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
          sbarMain.Panels[1].Text := 'Not Ready';
        end;
    end;
end;

procedure TfrmMain.cmbMatrixChange(Sender: TObject);
begin
  // Matrix Combobox Change
  sMatrix := cmbMatrix.Items[cmbMatrix.ItemIndex];
  if (sMatrix = 'Matrix A') or (sMatrix = 'Matrix B') then
    btnOperate.Enabled := True
  else
    MessageDlg('Please select a matrix.', TMsgDlgType.mtError, [mbOK], 0);
end;

procedure TfrmMain.cmbOperationChange(Sender: TObject);
begin
  // Operations Combobox Change
  { Some operations are performed on both matrices, while others are not,
  so enable the matrix selection combobox for operations performed on
  one matrix only. }

  // Store the operation in the global variable, sOperation:
  sOperation := cmbOperation.Items[cmbOperation.ItemIndex];

  // Verify that an proper operation was selected.
  if (sOperation = 'Square') or (sOperation = 'Inverse') or
  (sOperation = 'Transpose') or (sOperation = 'Add') or (sOperation = 'Subtract')
  or (sOperation = 'Divide') or (sOperation = 'Multilpy') then
    begin
     if (sOperation = 'Square') or (sOperation = 'Inverse') or
      (sOperation = 'Transpose') then
        begin
          cmbMatrix.Enabled := True;
        end
      else
        begin
          cmbMatrix.Enabled := False;
          // Enable the operate button - so that the operation can be performed.
          btnOperate.Enabled := True;
        end;
    end
  else
    begin
      // Show Error Message - Tell the dense user to select a proper option.
      MessageDlg('Please select an operation.', TMsgDlgType.mtError, [mbOK], 0);
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // On Form Create
  // Initalise Boolean Values
  bSetAOK := False;
  bSetBOK := False;
end;

procedure TfrmMain.Help2Click(Sender: TObject);
begin
  // Show About information
  MessageDlg('Matmanip Version 2024.07.06-07' + #13 +
              '©2024 Connor Bell. All Rights Reserved.' + #13 +
              'Icons via www.icons8.com', TMsgDlgType.mtInformation, [mbClose], 0);
end;

procedure TfrmMain.matAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // On Mat A Edit (Key Down): Enable the Set and Clear Mat A buttons
  btnSetA.Enabled := True;
  btnClearA.Enabled := True;

  // Set Mat A Status to Not Ready
  bSetAOK := False;
  imgMatAStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatAStatus.Hint := 'Matrix A is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';

  // Disable Matrix B panel
  pnlMatB.Enabled := False;
end;

procedure TfrmMain.matBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // On Mat B Edit (Key Down): Enable the Set and Clear Mat B buttons
  btnSetB.Enabled := True;
  btnClearB.Enabled := True;

  // Set Mat B Status to Not Ready
  bSetBOK := False;
  imgMatBStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatBStatus.Hint := 'Matrix B is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';
end;

procedure TfrmMain.Populate_Matrix(Arr: TMatrixArray; pMatrix_Name : string);
var
  iRows, iCols : Integer;
begin
  // Populate the Matrix
  for iRows := Low(Arr) to High(Arr) do
    begin
      for iCols := Low(Arr) to High(Arr) do
        begin
          if pMatrix_Name = 'Mat A' then
            begin
              Arr[iRows][iCols] := StrToInt(matA.Cells[iCols, iRows]);
            end
          else
          if pMatrix_Name = 'Mat B' then
            begin
              Arr[iRows][iCols] := StrToInt(matB.Cells[iCols, iRows])
            end;
        end;
    end;

end;

procedure TfrmMain.Populate_ResultStringGrid(Arr: TMatrixArray);
var
  iRows, iCols : Integer;
begin
  // Populate the Result StringGrid with the Result of the Matrix Operation
  for iRows := Low(Arr) to High(Arr) do
    begin
      for iCols := Low(Arr) to High(Arr) do
          begin
            matResult.Cells[iCols, iRows] := IntToStr(Arr[iRows][iCols]);
          end;
    end;
end;

procedure TfrmMain.sedColsAChange(Sender: TObject);
begin
   // On Mat A Col Count Change:
  matA.ColCount := sedColsA.Value;

  // Set Mat A Status to Not Ready
  bSetAOK := False;
  imgMatAStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatAStatus.Hint := 'Matrix A is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';

  // Disable Matrix B panel
  pnlMatB.Enabled := False;
end;

procedure TfrmMain.sedColsBChange(Sender: TObject);
begin
  // On Mat B Col Count Change:
  matB.ColCount := sedColsB.Value;

  // Set Mat B Status to Not Ready
  bSetBOK := False;
  imgMatBStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatBStatus.Hint := 'Matrix B is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';
end;

procedure TfrmMain.sedRowsAChange(Sender: TObject);
begin
  // On Mat A Row Count Change:
  matA.RowCount := sedRowsA.Value;

  // Set Mat A Status to Not Ready
  bSetAOK := False;
  imgMatAStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatAStatus.Hint := 'Matrix A is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';

  // Disable Matrix B panel
  pnlMatB.Enabled := False;
end;

procedure TfrmMain.sedRowsBChange(Sender: TObject);
begin
  // On Mat B Row Count Change:
  matB.RowCount := sedRowsB.Value;

  // Set Mat B Status to Not Ready
  bSetBOK := False;
  imgMatBStatus.Picture.LoadFromFile('Not_Ready.png');
  imgMatBStatus.Hint := 'Matrix B is not ready';

  // Set Operations Status to Not Ready
  pnlOperations.Enabled := False;
  imgOperationStatus.Picture.LoadFromFile('Not_Ready.png');
  sbarMain.Panels[1].Text := 'Not Ready';
end;

procedure TfrmMain.tmrStatusPanelDateTimeTimer(Sender: TObject);
begin
  // Set Date and Time for Status Bar
  sbarMain.Panels[3].Text := DateToStr(Now) + ' ' + TimeToStr(Now);
end;

function TfrmMain.Verify_StringGrid(pStringGrid_Name: string; pRowCount,
  pColCount: Integer): Boolean;
var
  bResult : Boolean;
  iRows, iCols, iCellValue : Integer;
begin
  { Verify that the StringGrid (Mat A or Mat B) contain only integer values }
  bResult := False;
  iCellValue := 0;

  for iRows := 0 to pRowCount - 1 do
    begin
      for iCols := 0 to pColCount - 1 do
        begin
          { Try and check that the numbers entered in the matrix are
          integers only. If it fails, we know the matrix contains other
          illegal non-integer characters. }

          try
            if pStringGrid_Name = 'Mat A' then
              begin
                iCellValue := StrToInt(matA.Cells[iCols, iRows]);
              end
            else
            if pStringGrid_Name = 'Mat B' then
              begin
                iCellValue := StrToInt(matB.Cells[iCols, iRows]);
              end;

            if ((iCellValue div 1) = iCellValue) then
              begin
                bResult := True;
              end;

          except
            bResult := False;
            Break;
          end;
        end;
    end;

  // Return the Result
  Result := bResult;

end;

end.

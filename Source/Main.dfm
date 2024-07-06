object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Matmanip'
  ClientHeight = 404
  ClientWidth = 883
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  Font.Quality = fqAntialiased
  Menu = mmMain
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 23
  object pnlMatA: TPanel
    Left = 8
    Top = 8
    Width = 202
    Height = 369
    BevelEdges = []
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 207
      Width = 35
      Height = 16
      Caption = 'ROWS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label2: TLabel
      Left = 112
      Top = 207
      Width = 56
      Height = 16
      Caption = 'COLUMNS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label3: TLabel
      Left = 60
      Top = 12
      Width = 80
      Height = 22
      Caption = 'Matrix A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object imgMatAStatus: TImage
      Left = 23
      Top = 11
      Width = 25
      Height = 25
      Hint = 'Matrix A is not ready'
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
        000000E44944415478DAED96D10DC2300C44D325801190980256600C601A600C
        4600D6280C8018020487E44AFD28CDF940840F473AB9AA62FBB5899D54A9F0A8
        022000022037E191D202668789574F60F88D60E6F0DBCA0008B2845943353465
        212CF9111A432BF86D548001CC019A406783B8647C86307BF33941B33E1F6609
        68086F720A80855092D300390835B90BE01D04745793BB010CA2BDC36B7BDD3C
        D395220374FC89A47CF9A700ED357F0DAA44BF02507409BA763B744BCE662501
        F4959AD2315D004C9DAB104C2BA69B8C02913B8CDC1DCE0BF1DFC7B1052B7721
        F9C50880000880276C407821FB46DF110000000049454E44AE426082}
      Proportional = True
      ShowHint = True
    end
    object matA: TStringGrid
      Left = 21
      Top = 37
      Width = 159
      Height = 159
      DefaultColWidth = 30
      DefaultColAlignment = taCenter
      DefaultRowHeight = 30
      FixedCols = 0
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Options = [goVertLine, goHorzLine, goEditing]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = matAKeyDown
    end
    object sedRowsA: TSpinEdit
      Left = 21
      Top = 225
      Width = 68
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -17
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      MaxValue = 5
      MinValue = 1
      ParentFont = False
      StyleElements = [seClient, seBorder]
      TabOrder = 1
      Value = 5
      OnChange = sedRowsAChange
    end
    object sedColsA: TSpinEdit
      Left = 112
      Top = 225
      Width = 68
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -17
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      MaxValue = 5
      MinValue = 1
      ParentFont = False
      StyleElements = [seClient, seBorder]
      TabOrder = 2
      Value = 5
      OnChange = sedColsAChange
    end
    object btnSetA: TButton
      Left = 21
      Top = 271
      Width = 159
      Height = 34
      Caption = 'Set'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 3
      StyleElements = [seClient, seBorder]
      OnClick = btnSetAClick
    end
    object btnClearA: TButton
      Left = 21
      Top = 314
      Width = 159
      Height = 34
      Caption = 'Clear'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 4
      StyleElements = [seClient, seBorder]
      OnClick = btnClearAClick
    end
  end
  object pnlMatB: TPanel
    Left = 216
    Top = 8
    Width = 202
    Height = 369
    BevelEdges = []
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 2
    Enabled = False
    TabOrder = 1
    object Label4: TLabel
      Left = 21
      Top = 207
      Width = 35
      Height = 16
      Caption = 'ROWS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label5: TLabel
      Left = 112
      Top = 207
      Width = 56
      Height = 16
      Caption = 'COLUMNS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label6: TLabel
      Left = 60
      Top = 12
      Width = 80
      Height = 22
      Caption = 'Matrix B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object imgMatBStatus: TImage
      Left = 25
      Top = 11
      Width = 25
      Height = 25
      Hint = 'Matrix B is not ready'
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
        000000E44944415478DAED96D10DC2300C44D325801190980256600C601A600C
        4600D6280C8018020487E44AFD28CDF940840F473AB9AA62FBB5899D54A9F0A8
        022000022037E191D202668789574F60F88D60E6F0DBCA0008B2845943353465
        212CF9111A432BF86D548001CC019A406783B8647C86307BF33941B33E1F6609
        68086F720A80855092D300390835B90BE01D04745793BB010CA2BDC36B7BDD3C
        D395220374FC89A47CF9A700ED357F0DAA44BF02507409BA763B744BCE662501
        F4959AD2315D004C9DAB104C2BA69B8C02913B8CDC1DCE0BF1DFC7B1052B7721
        F9C50880000880276C407821FB46DF110000000049454E44AE426082}
      Proportional = True
      ShowHint = True
    end
    object matB: TStringGrid
      Left = 21
      Top = 37
      Width = 159
      Height = 159
      DefaultColWidth = 30
      DefaultColAlignment = taCenter
      DefaultRowHeight = 30
      FixedCols = 0
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goFixedRowDefAlign]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = matBKeyDown
    end
    object sedRowsB: TSpinEdit
      Left = 21
      Top = 225
      Width = 68
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -17
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      MaxValue = 5
      MinValue = 1
      ParentFont = False
      StyleElements = [seClient, seBorder]
      TabOrder = 1
      Value = 5
      OnChange = sedRowsBChange
    end
    object sedColsB: TSpinEdit
      Left = 112
      Top = 225
      Width = 68
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -17
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      MaxValue = 5
      MinValue = 1
      ParentFont = False
      StyleElements = [seClient, seBorder]
      TabOrder = 2
      Value = 5
      OnChange = sedColsBChange
    end
    object btnSetB: TButton
      Left = 21
      Top = 271
      Width = 159
      Height = 34
      Caption = 'Set'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 3
      StyleElements = [seClient, seBorder]
      OnClick = btnSetBClick
    end
    object btnClearB: TButton
      Left = 21
      Top = 314
      Width = 159
      Height = 34
      Caption = 'Clear'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 4
      StyleElements = [seClient, seBorder]
      OnClick = btnClearBClick
    end
  end
  object pnlResult: TPanel
    Left = 678
    Top = 8
    Width = 202
    Height = 369
    BevelEdges = []
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    object Label9: TLabel
      Left = 69
      Top = 12
      Width = 60
      Height = 22
      Caption = 'Result'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object matResult: TStringGrid
      Left = 21
      Top = 37
      Width = 159
      Height = 159
      DefaultColWidth = 30
      DefaultColAlignment = taCenter
      DefaultRowHeight = 30
      FixedCols = 0
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      Options = [goVertLine, goHorzLine, goFixedRowDefAlign]
      ParentFont = False
      TabOrder = 0
    end
    object btnSaveResult: TButton
      Left = 21
      Top = 271
      Width = 159
      Height = 34
      Caption = 'Save'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 1
    end
    object btnClearResult: TButton
      Left = 21
      Top = 314
      Width = 159
      Height = 34
      Caption = 'Clear'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 2
      StyleElements = [seClient, seBorder]
      OnClick = btnClearAClick
    end
  end
  object pnlOperations: TPanel
    Left = 424
    Top = 8
    Width = 249
    Height = 369
    BevelEdges = []
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 2
    Enabled = False
    TabOrder = 3
    object Label7: TLabel
      Left = 75
      Top = 12
      Width = 90
      Height = 22
      Caption = 'Operation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label8: TLabel
      Left = 21
      Top = 72
      Width = 70
      Height = 16
      Caption = 'OPERATION:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label10: TLabel
      Left = 21
      Top = 148
      Width = 49
      Height = 16
      Caption = 'MATRIX:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object imgOperationStatus: TImage
      Left = 21
      Top = 11
      Width = 25
      Height = 25
      Hint = 'Operations are not available'
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
        000000E44944415478DAED96D10DC2300C44D325801190980256600C601A600C
        4600D6280C8018020487E44AFD28CDF940840F473AB9AA62FBB5899D54A9F0A8
        022000022037E191D202668789574F60F88D60E6F0DBCA0008B2845943353465
        212CF9111A432BF86D548001CC019A406783B8647C86307BF33941B33E1F6609
        68086F720A80855092D300390835B90BE01D04745793BB010CA2BDC36B7BDD3C
        D395220374FC89A47CF9A700ED357F0DAA44BF02507409BA763B744BCE662501
        F4959AD2315D004C9DAB104C2BA69B8C02913B8CDC1DCE0BF1DFC7B1052B7721
        F9C50880000880276C407821FB46DF110000000049454E44AE426082}
      Proportional = True
      ShowHint = True
    end
    object btnOperate: TButton
      Left = 21
      Top = 271
      Width = 204
      Height = 34
      Caption = 'Perform Operation'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -15
      Font.Name = 'Cascadia Code'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 0
      OnClick = btnOperateClick
    end
    object cmbOperation: TComboBox
      Left = 21
      Top = 90
      Width = 204
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 1
      Text = 'Select an Operation'
      StyleElements = [seClient, seBorder]
      OnChange = cmbOperationChange
      Items.Strings = (
        'Add'
        'Subtract'
        'Divide'
        'Multilpy'
        'Square'
        'Transpose'
        'Inverse')
    end
    object cmbMatrix: TComboBox
      Left = 21
      Top = 168
      Width = 204
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Cascadia Code SemiBold'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 2
      Text = 'Select a Matrix'
      StyleElements = [seClient, seBorder]
      OnChange = cmbMatrixChange
      Items.Strings = (
        'Matrix A'
        'Matrix B')
    end
  end
  object sbarMain: TStatusBar
    Left = 0
    Top = 383
    Width = 883
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -15
    Font.Name = 'Cascadia Code'
    Font.Style = []
    Panels = <
      item
        Text = 'Operation Status:'
        Width = 160
      end
      item
        Text = 'Not Ready'
        Width = 100
      end
      item
        Width = 420
      end
      item
        Width = 50
      end>
    SizeGrip = False
    UseSystemFont = False
    StyleElements = [seClient, seBorder]
  end
  object mmMain: TMainMenu
    Left = 480
    Top = 232
    object heme1: TMenuItem
      Caption = 'Edit'
      object Settings1: TMenuItem
        Caption = 'Settings'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Help2: TMenuItem
        Caption = 'About'
        OnClick = Help2Click
      end
    end
  end
  object tmrStatusPanelDateTime: TTimer
    OnTimer = tmrStatusPanelDateTimeTimer
    Left = 512
    Top = 232
  end
end

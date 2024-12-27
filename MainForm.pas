//////////////////////////////////////////////////////////////////
//  Эмулятор микроконтроллера                                   //
//                                                              //
//  Версия от 6 сентября 2009 г.                                //
//                                                              //
//  Copyright (c) 2007, 2009 by Рукавишников Илья Владимирович  //
//                                                              //
//  All rights reserved                                         //
//////////////////////////////////////////////////////////////////
unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ToolWin, ComCtrls, StdCtrls, Buttons, ExtCtrls, ActnList,
  XPMan;

type
  TErrorCode = 1..13;   // Errors: 13

  TBitNum = 0..7;       // Bits: 8

  TPortName = 'A'..'B'; // Ports: 2

  TFormMain = class(TForm)
    ImagesList:                     TImageList;

    ActionsList:                    TActionList;

    FileCreateNew:                  TAction;
    FileOpen:                       TAction;
    FileSave:                       TAction;
    FileSaveAs:                     TAction;
    FileExit:                       TAction;

    ProgramCompile:                 TAction;
    ProgramRun:                     TAction;
    ProgramRunCommand:              TAction;
    ProgramStop:                    TAction;

    MicrocontrollerReset:           TAction;
    MicrocontrollerEditDM:          TAction;

    ReferenceAboutProgram:          TAction;

    MenuMain:                       TMainMenu;

    MenuFile:                       TMenuItem;

    MenuFileCreateNew:              TMenuItem;
    MenuFileOpen:                   TMenuItem;
    MenuFileSave:                   TMenuItem;
    MenuFileSaveAs:                 TMenuItem;
    MenuFileSeparator:              TMenuItem;
    MenuFileExit:                   TMenuItem;

    MenuProgram:                    TMenuItem;

    MenuProgramCompile:             TMenuItem;
    MenuProgramSeparator:           TMenuItem;
    MenuProgramRun:                 TMenuItem;
    MenuProgramRunCommand:          TMenuItem;
    MenuProgramStop:                TMenuItem;

    MenuMicrocontroller:            TMenuItem;

    MenuMicrocontrollerReset:       TMenuItem;
    MenuMicrocontrollerEditDM:      TMenuItem;

    MenuReference:                  TMenuItem;

    MenuReferenceAboutProgram:      TMenuItem;

    ToolBar:                        TToolBar;

    ToolButtonFileCreateNew:        TToolButton;
    ToolButtonFileOpen:             TToolButton;
    ToolButtonFileSave:             TToolButton;

    ToolButtonSeparator_1:          TToolButton;

    ToolButtonProgramCompile:       TToolButton;

    ToolButtonSeparator_2:          TToolButton;

    ToolButtonProgramRun:           TToolButton;
    ToolButtonProgramRunCommand:    TToolButton;
    ToolButtonProgramStop:          TToolButton;

    ToolButtonSeparator_3:          TToolButton;

    ToolButtonMicrocontrollerReset: TToolButton;

    LabelProgram:                   TLabel;
    MemoProgram:                    TMemo;

    LabelPM:                        TLabel;
    MemoPM:                         TMemo;

    LabelMessage:                   TLabel;
    MemoMessage:                    TMemo;

    RadioGroup:                     TRadioGroup;

    RadioButtonRegisters:           TRadioButton;
    RadioButtonDM:                  TRadioButton;

    MemoRegisters:                  TMemo; // ???
    MemoDM:                         TMemo; // ???

    GroupBoxInOut:                  TGroupBox;

    LabelPortA:                     TLabel;

    SpeedButtonA7:                  TSpeedButton;
    SpeedButtonA6:                  TSpeedButton;
    SpeedButtonA5:                  TSpeedButton;
    SpeedButtonA4:                  TSpeedButton;
    SpeedButtonA3:                  TSpeedButton;
    SpeedButtonA2:                  TSpeedButton;
    SpeedButtonA1:                  TSpeedButton;
    SpeedButtonA0:                  TSpeedButton;

    LabelPortB:                     TLabel;

    SpeedButtonB7:                  TSpeedButton;
    SpeedButtonB6:                  TSpeedButton;
    SpeedButtonB5:                  TSpeedButton;
    SpeedButtonB4:                  TSpeedButton;
    SpeedButtonB3:                  TSpeedButton;
    SpeedButtonB2:                  TSpeedButton;
    SpeedButtonB1:                  TSpeedButton;
    SpeedButtonB0:                  TSpeedButton;

    OpenDialog:                     TOpenDialog;
    SaveDialog:                     TSaveDialog;

    Timer:                          TTimer;

    XPManifest:                     TXPManifest;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FileCreateNewExecute(Sender: TObject);
    procedure FileOpenExecute(Sender: TObject);
    procedure FileSaveExecute(Sender: TObject);
    procedure FileSaveAsExecute(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);

    procedure ProgramCompileExecute(Sender: TObject);
    procedure ProgramRunExecute(Sender: TObject);
    procedure ProgramRunCommandExecute(Sender: TObject);
    procedure ProgramStopExecute(Sender: TObject);

    procedure MicrocontrollerResetExecute(Sender: TObject);
    procedure MicrocontrollerEditDMExecute(Sender: TObject);

    procedure ReferenceAboutProgramExecute(Sender: TObject);

    procedure SpeedButtonA7Click(Sender: TObject);
    procedure SpeedButtonA6Click(Sender: TObject);
    procedure SpeedButtonA5Click(Sender: TObject);
    procedure SpeedButtonA4Click(Sender: TObject);
    procedure SpeedButtonA3Click(Sender: TObject);
    procedure SpeedButtonA2Click(Sender: TObject);
    procedure SpeedButtonA1Click(Sender: TObject);
    procedure SpeedButtonA0Click(Sender: TObject);

    procedure SpeedButtonB7Click(Sender: TObject);
    procedure SpeedButtonB6Click(Sender: TObject);
    procedure SpeedButtonB5Click(Sender: TObject);
    procedure SpeedButtonB4Click(Sender: TObject);
    procedure SpeedButtonB3Click(Sender: TObject);
    procedure SpeedButtonB2Click(Sender: TObject);
    procedure SpeedButtonB1Click(Sender: TObject);
    procedure SpeedButtonB0Click(Sender: TObject);

    procedure TimerTimer(Sender: TObject);

    procedure MemoProgramChange(Sender: TObject);

    procedure RadioButtonClick(Sender: TObject);

  protected // Protected declarations
    procedure PrintErrorMessage(const ErrorCode: TErrorCode; const Msg: AnsiString);

    function ShortProgName(ProgName: AnsiString): AnsiString;

    function DecNumToHexStr(DecNum: Word; const LenStr: Byte): AnsiString;
    function DecNumToBinStr(DecNum: Word; const LenStr: Byte): AnsiString;

    function TestBitBin(const AddressDM: Byte; const BitNum: TBitNum): Boolean;
    function TestBitChr(const AddressDM: Byte; const BitNum: TBitNum): Char;

    procedure SetBit(const AddressDM: Byte; const BitNum: TBitNum);
    procedure ClearBit(const AddressDM: Byte; const BitNum: TBitNum);

    function AddressDM_ByRegName(const RegName: AnsiString): Byte;

    procedure ActivateObjects;

    procedure ClearStack;
    procedure ClearPM_MemoPM;

    procedure AppSettingByDefault;

    procedure UpDateMemoPM;
    procedure UpDateMemoRegistersMemoDM;
    procedure UpDatePortsA_B;

    procedure UpDateRegTimerCounter;

    function RunCommand: Boolean;

    procedure PortInterrupt(const PortName: TPortName; const Pin: TBitNum);
  end;

// --------------------------------------------------------

const // Main parameters (Part 1)
  AppTitle = 'Эмулятор микроконтроллера';      // Application title
  AppVersion = 'Версия от 6 сентября 2009 г.'; // Application version

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

uses
  AboutForm;

type
  // System register
  TSysReg = record
    Name:      AnsiString; // Name
    AddressDM: Byte;       // Address DM
    DefValue:  Byte;       // Default value
  end;

  // Command format
  TCommandFormat = record
    Code: AnsiString; // Code
    Op1:  AnsiString; // Operand 1
    Op2:  AnsiString; // Operand 2
  end;

  // Command
  TCommand = record
    Code: AnsiString; // Code
    Op1:  Word;       // Operand 1
    Op2:  Byte;       // Operand 2
  end;

const // Main parameters (Part 2)
  DefProgName   = 'Default.asm'; // Default program name (short)
  TimerInterval = 5;             // Timer interval (ms)
  ProgMem       = 4096;          // Program memory (commands) - Max. value 4096 (12 bit address)
  DataMem       = 256;           // Data memory (byte) - Max. value 256 (8 bit address)
  StackSize     = 32;            // Stack size (levels) - Max. value 128
  IntVector     = $0004;         // Interrupt vector - Max. value ($ProgMem - 1)

  BitMask: array [0..7] of Byte = ($01, $02, $04, $08, $10, $20, $40, $80);

  // 11 microcontroller's system registers
  MC_SysRegs: array [0..10] of TSysReg = (
    (Name: 'Status';       AddressDM: $00;  DefValue: $00),
    (Name: 'PCHi';         AddressDM: $01;  DefValue: $00),
    (Name: 'PCLo';         AddressDM: $02;  DefValue: $00),
    (Name: 'ConfigA';      AddressDM: $03;  DefValue: $00),
    (Name: 'PortA';        AddressDM: $04;  DefValue: $00),
    (Name: 'ConfigB';      AddressDM: $05;  DefValue: $00),
    (Name: 'PortB';        AddressDM: $06;  DefValue: $00),
    (Name: 'ConfigTimer';  AddressDM: $07;  DefValue: $00),
    (Name: 'TimerCounter'; AddressDM: $08;  DefValue: $00),
    (Name: 'ConfigInt';    AddressDM: $09;  DefValue: $00),
    (Name: 'Int';          AddressDM: $0A;  DefValue: $00)
  );

  // 24 microcontroller's commands
  MC_Commands: array [0..23] of TCommandFormat = (
    (Code: 'ADDWF';  Op1: 'f';   Op2: 'd'),
    (Code: 'ADDW';   Op1: 'k8';  Op2: ''),
    (Code: 'SUBWF';  Op1: 'f';   Op2: 'd'),
    (Code: 'SUBW';   Op1: 'k8';  Op2: ''),
    (Code: 'INCF';   Op1: 'f';   Op2: 'd'),
    (Code: 'DECF';   Op1: 'f';   Op2: 'd'),
    (Code: 'ANDWF';  Op1: 'f';   Op2: 'd'),
    (Code: 'ANDW';   Op1: 'k8';  Op2: ''),
    (Code: 'ORWF';   Op1: 'f';   Op2: 'd'),
    (Code: 'ORW';    Op1: 'k8';  Op2: ''),
    (Code: 'NOTF';   Op1: 'f';   Op2: 'd'),
    (Code: 'CLRF';   Op1: 'f';   Op2: ''),
    (Code: 'MOVFW';  Op1: 'f';   Op2: ''),
    (Code: 'MOVWF';  Op1: 'f';   Op2: ''),
    (Code: 'MOVW';   Op1: 'k8';  Op2: ''),
    (Code: 'BCF';    Op1: 'f';   Op2: 'b'),
    (Code: 'BSF';    Op1: 'f';   Op2: 'b'),
    (Code: 'BTFC';   Op1: 'f';   Op2: 'b'),
    (Code: 'BTFS';   Op1: 'f';   Op2: 'b'),
    (Code: 'CALL';   Op1: 'k12'; Op2: ''),
    (Code: 'RETURN'; Op1: '';    Op2: ''),
    (Code: 'GOTO';   Op1: 'k12'; Op2: ''),
    (Code: 'RETI';   Op1: '';    Op2: ''),
    (Code: 'NOP';    Op1: '';    Op2: '')
  );

var
  PM:    array [0..ProgMem - 1]   of TCommand; // Microcontroller program memory array
  DM:    array [0..DataMem - 1]   of Byte;     // Microcontroller data memory array
  Stack: array [0..StackSize - 1] of Word;     // Microcontroller stack array

  RegW:       Byte; // Microcontroller register W
  StackPoint: Byte; // Microcontroller stack point
  TimerValue: Word; // Microcontroller timer value

  ProgName:   AnsiString; // Full program name

  // Program status
  ProgLoaded:         Boolean; // Program loaded
  ProgSaved:          Boolean; // Program saved
  ProgCompiled:       Boolean; // Program compiled
  ProgRunning:        Boolean; // Program running
  ProgRunningCommand: Boolean; // Program running command

procedure TFormMain.PrintErrorMessage(const ErrorCode: TErrorCode; const Msg: AnsiString);
begin // Print error message to MemoMessage
  with MemoMessage.Lines do
    case ErrorCode of // Find ErrorCode
       1: Add('Регистр с именем <' + Msg + '> не найден!');
       2: Add('Метка с именем <' + Msg + '> не найдена!');
       3: Add('Несуществующая команда <' + Msg + '>!');
       4: Add('Недопустимое значение программного счетчика <' + Msg + '>!');
       5: Add('Переполнение стека!');
       6: Add('Строка не распознана <' + Msg + '>!');
       7: Add('Ошибка в метке <' + Msg + '>!');
       8: Add('Ошибка в адресе <' + Msg + '>!');
       9: Add('Неверный формат команды <' + Msg + '>!');
      10: Add('Ошибка в директиве <' + Msg + '>!');
      11: Add('Переполнение программного счетчика!');
      12: Add('Несуществующий адрес программной памяти!');
      13: Add('  Строка <' + Msg + '>!');
    end;
end;

function TFormMain.ShortProgName(ProgName: AnsiString): AnsiString;

var
  Ps: Integer;

begin // Converting full program name to short program name
  Ps := Pos('\', ProgName); // Find first position of char '\' in ProgName

  while Ps > 0 do // Char '\' found
    begin
      ProgName := Copy(ProgName, Ps + 1, Length(ProgName) - Ps);

      Ps := Pos('\', ProgName); // Find next position of char '\' in ProgName
    end;

  ShortProgName := ProgName;
end;

function TFormMain.DecNumToHexStr(DecNum: Word; const LenStr: Byte): AnsiString;

const
  HexStr = '0123456789ABCDEF';

var
  Buf: AnsiString;

begin // Decimal number to hex string
  Buf := '';

  while DecNum > 15 do
    begin
      Buf := HexStr[(DecNum mod 16) + 1] + Buf;

      DecNum := DecNum div 16;
    end;

  Buf := HexStr[DecNum + 1] + Buf;

  while Length(Buf) < LenStr do
    Buf := '0' + Buf;

  DecNumToHexStr := Buf;
end;

function TFormMain.DecNumToBinStr(DecNum: Word; const LenStr: Byte): AnsiString;

const
  BinStr = '01';

var
  Buf: AnsiString;

begin // Decimal number to bin string
  Buf := '';

  while DecNum > 1 do
    begin
      Buf := BinStr[(DecNum mod 2) + 1] + Buf;

      DecNum := DecNum div 2;
    end;

  Buf := BinStr[DecNum + 1] + Buf;

  while Length(Buf) < LenStr do
    Buf := '0' + Buf;

  DecNumToBinStr := Buf;
end;

function TFormMain.TestBitBin(const AddressDM: Byte; const BitNum: TBitNum): Boolean;
begin // Test bit - result boolean
  if (DM[AddressDM] and BitMask[BitNum]) = 0 then
    TestBitBin := False
  else // <> 0
    TestBitBin := True;
end;

function TFormMain.TestBitChr(const AddressDM: Byte; const BitNum: TBitNum): Char;
begin // Test bit - result char
  if TestBitBin(AddressDM, BitNum) then // True
    TestBitChr := '1'
  else // False
    TestBitChr := '0';
end;

procedure TFormMain.SetBit(const AddressDM: Byte; const BitNum: TBitNum);
begin // Set bit
  DM[AddressDM] := DM[AddressDM] or BitMask[BitNum];
end;

procedure TFormMain.ClearBit(const AddressDM: Byte; const BitNum: TBitNum);
begin // Clear bit
  DM[AddressDM] := DM[AddressDM] and (not BitMask[BitNum]);
end;

function TFormMain.AddressDM_ByRegName(const RegName: AnsiString): Byte;

var
  I: Byte;

begin // Address DM by register name
  // Find system register by name
  for I := 0 to Length(MC_SysRegs) - 1 do
    with MC_SysRegs[I] do
      if UpperCase(Name) = UpperCase(RegName) then // Register found
        begin
          AddressDM_ByRegName := AddressDM;

          Exit;
        end;

  // System register not found
  PrintErrorMessage(1, UpperCase(Name));

  AddressDM_ByRegName := $FF; // Address DM = -1 // ???
end;

procedure TFormMain.ActivateObjects;
begin // Active objects
  if ProgRunning and (not ProgRunningCommand) then // Program running in real mode
    begin
      RadioButtonRegisters.Enabled := False;
      RadioButtonDM.Enabled := False;

      MemoRegisters.Enabled := False;
      MemoDM.Enabled := False;
    end
  else // Other situation
    begin
      RadioButtonRegisters.Enabled := True;
      RadioButtonDM.Enabled := True;

      MemoRegisters.Enabled := True;
      MemoDM.Enabled := True;
    end;

  if ProgLoaded then // Program loaded
    if ProgRunning then // Program running
      begin
        FileCreateNew.Enabled := False;
        FileOpen.Enabled := False;

        if ProgSaved then // Program saved
          FileSave.Enabled := False
        else // Program no saved
          FileSave.Enabled := True;

        FileSaveAs.Enabled := True;

        ProgramCompile.Enabled := False;
        ProgramRun.Enabled := False;
        ProgramRunCommand.Enabled := False;
        ProgramStop.Enabled := True;

        MicrocontrollerReset.Enabled := False;
        MicrocontrollerEditDM.Enabled := False;
      end
    else // Program no running
      begin
        FileCreateNew.Enabled := True;
        FileOpen.Enabled := True;

        if ProgSaved then // Program saved
          FileSave.Enabled := False
        else // Program no saved
          FileSave.Enabled := True;

        FileSaveAs.Enabled := True;

        if ProgCompiled then // Program compiled
          begin
            ProgramCompile.Enabled := False;
            ProgramRun.Enabled := True;
            ProgramRunCommand.Enabled := True;
          end
        else // Program no compiled
          begin
            ProgramCompile.Enabled := True;
            ProgramRun.Enabled := False;
            ProgramRunCommand.Enabled := False;
          end;

        ProgramStop.Enabled := False;

        MicrocontrollerReset.Enabled := True;
        MicrocontrollerEditDM.Enabled := True;
      end
  else // Program no loaded
    begin
      FileCreateNew.Enabled := True;
      FileOpen.Enabled := True;
      FileSave.Enabled := False;
      FileSaveAs.Enabled := False;

      ProgramCompile.Enabled := False;
      ProgramRun.Enabled := False;
      ProgramRunCommand.Enabled := False;
      ProgramStop.Enabled := False;

      MicrocontrollerReset.Enabled := True;
      MicrocontrollerEditDM.Enabled := True;
    end;
end;

procedure TFormMain.ClearStack;

var
  I: Byte;

begin // Clear stack
  for I := 0 to StackSize - 1 do
    Stack[I] := $0000;

  StackPoint := $FF; // StackPoint = -1
end;

procedure TFormMain.ClearPM_MemoPM;

var
  I: Word;

begin // Clear PM and MemoPM
  // Clear PM
  for I := 0 to ProgMem - 1 do
    with PM[I] do
      begin
        Code := '';   // Code
        Op1 := $0000; // Operand 1
        Op2 := $00;   // Operand 2
      end;

  MemoPM.Lines.Clear; // Clear MemoPM
end;

procedure TFormMain.AppSettingByDefault;
begin // Application setting by default
  ProgLoaded         := False; // Program no loaded
  ProgSaved          := False; // Program no saved
  ProgCompiled       := False; // Program no compiled
  ProgRunning        := False; // Program no running
  ProgRunningCommand := False; // Program no running command

  ActivateObjects; // Activate objects

  // MemoRegisters visible by default
  RadioButtonRegisters.Checked := True;
  RadioButtonClick(Self);  // RadioButton click

  MemoProgram.Lines.Clear; // Clear MemoProgram
  MemoMessage.Lines.Clear; // Clear MemoMessage

  Timer.Enabled := False;          // Timer disable
  Timer.Interval := TimerInterval; // Set timer interval

  ClearPM_MemoPM; // Clear PM and MemoPM

  MicrocontrollerResetExecute(Self); // Reset microcontroller

  if ParamStr(1) = '' then // Application running by default
    begin
      ProgName := DefProgName; // Program name by default
      FormMain.Caption := AppTitle + '. ' + AppVersion + ' - ' + DefProgName; // UpDate form header
    end
  else // ParamStr(1) <> '' - Application running with file (open file)
    begin
      ProgName := ParamStr(1); // Open file name (full)
      FormMain.Caption := AppTitle + '. ' + AppVersion + ' - ' + ShortProgName(ProgName); // UpDate form header

      MemoProgram.Lines.LoadFromFile(ProgName); // Loading program from file

      // Event: MemoProgramChange

      ProgSaved := True; // Program saved

      ActivateObjects;
    end;
end;

procedure TFormMain.UpDateMemoPM;

var
  I:         Word;
  J:         Byte;
  Buf:       AnsiString;
  FormatOp1: AnsiString;
  FormatOp2: AnsiString;

begin // Update PM
  MemoPM.Lines.Clear; // Clear MemoPM

  for I := 0 to ProgMem - 1 do
    if PM[I].Code <> '' then // Command is not null
      begin // Print command
        FormatOp1 := '';
        FormatOp2 := '';

        // Find command
        for J := 0 to Length(MC_Commands) - 1 do
          with MC_Commands[J] do
            if PM[I].Code = UpperCase(Code) then
              begin // Command found
                FormatOp1 := UpperCase(Op1);
                FormatOp2 := UpperCase(Op2);

                Break;
              end;

        Buf := '0x' + DecNumToHexStr(I, 3) + ': '; // Command address
        Buf := Buf + PM[I].Code; // Code

        if FormatOp1 = 'F' then // Code f...
          begin
            Buf := Buf + ' 0x' + DecNumToHexStr(PM[I].Op1, 2); // f

            if (FormatOp2 = 'D') or (FormatOp2 = 'B') then // Code f, d/b
              Buf := Buf + ', ' + IntToStr(PM[I].Op2); // d/b
          end
        else // Not Code f...
          if FormatOp1 = 'K8' then // Code k8
            Buf := Buf + ' 0x' + DecNumToHexStr(PM[I].Op1, 2) // k8
          else // Not Code k8
            if FormatOp1 = 'K12' then // Code k12
              Buf := Buf + ' 0x' + DecNumToHexStr(PM[I].Op1, 3); // k12

        MemoPM.Lines.Add(Buf);
      end;
end;

procedure TFormMain.UpDateMemoRegistersMemoDM;

var
  I, J: Byte;
  PCHi: Byte;
  PCLo: Byte;
  PC:   Word;
  Buf:  AnsiString;

begin // Update MemoRegisters and MemoDM
  // Update MemoRegisters
  MemoRegisters.Lines.Clear; // Clear MemoRegisters

  Buf := 'Status:';
  Buf := Buf + '   Z=' + TestBitChr(AddressDM_ByRegName('Status'), 0);
  Buf := Buf + '   C=' + TestBitChr(AddressDM_ByRegName('Status'), 1);

  PCHi := DM[AddressDM_ByRegName('PCHi')];
  PCLo := DM[AddressDM_ByRegName('PCLo')];
  PC := (PCHi shl 8) + PCLo;
  Buf := Buf + '         PC = 0x' + DecNumToHexStr(PC, 3);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'ConfigA = b#' + DecNumToBinStr(DM[AddressDM_ByRegName('ConfigA')], 8);
  Buf := Buf + '        PortA = b#' + DecNumToBinStr(DM[AddressDM_ByRegName('PortA')], 8);

  MemoRegisters.Lines.Add(Buf);

  Buf := 'ConfigB = b#' + DecNumToBinStr(DM[AddressDM_ByRegName('ConfigB')], 8);
  Buf := Buf + '        PortB = b#' + DecNumToBinStr(DM[AddressDM_ByRegName('PortB')], 8);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'ConfigTimer:';
  Buf := Buf + '   TMRE=' + TestBitChr(AddressDM_ByRegName('ConfigTimer'), 0);
  Buf := Buf + '   DIVE=' + TestBitChr(AddressDM_ByRegName('ConfigTimer'), 1);
  Buf := Buf + '   D2=' + TestBitChr(AddressDM_ByRegName('ConfigTimer'), 4);
  Buf := Buf + '   D1=' + TestBitChr(AddressDM_ByRegName('ConfigTimer'), 3);
  Buf := Buf + '   D0=' + TestBitChr(AddressDM_ByRegName('ConfigTimer'), 2);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'TimerCounter = 0x' + DecNumToHexStr(DM[AddressDM_ByRegName('TimerCounter')], 2);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'ConfigInt:';
  Buf := Buf + '   GIE=' + TestBitChr(AddressDM_ByRegName('ConfigInt'), 0);
  Buf := Buf + '   TMRIE=' + TestBitChr(AddressDM_ByRegName('ConfigInt'), 1);
  Buf := Buf + '   PAIE=' + TestBitChr(AddressDM_ByRegName('ConfigInt'), 2);
  Buf := Buf + '   PBIE=' + TestBitChr(AddressDM_ByRegName('ConfigInt'), 3);

  MemoRegisters.Lines.Add(Buf);

  Buf := 'Int:';
  Buf := Buf + '                  TMRI=' + TestBitChr(AddressDM_ByRegName('Int'), 0);
  Buf := Buf + '    PAI=' + TestBitChr(AddressDM_ByRegName('Int'), 1);
  Buf := Buf + '    PBI=' + TestBitChr(AddressDM_ByRegName('Int'), 2);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'Register W = 0x' + DecNumToHexStr(RegW, 2);

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'Hardware stack [Top-of-stack pointer = 0x' + DecNumToHexStr(StackPoint, 2) + ']:';

  MemoRegisters.Lines.Add(Buf);

  MemoRegisters.Lines.Add(''); // Empty string

  for I := 0 to (StackSize div 8) - 1 do
    begin
      Buf := '  ';

      for J := 0 to 7 do
        Buf := Buf + ' 0x' + DecNumToHexStr(Stack[I * 8 + J], 3);

      MemoRegisters.Lines.Add(Buf);
    end;

  MemoRegisters.Lines.Add(''); // Empty string

  Buf := 'Timer value = 0x' + DecNumToHexStr(TimerValue, 4);

  MemoRegisters.Lines.Add(Buf);

  // Update MemoDM
  MemoDM.Lines.Clear; // Clear MemoDM

  // DM header
  Buf := '    00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F';

  MemoDM.Lines.Add(Buf);

  // DM content
  for I := 0 to (DataMem div 16) - 1 do
    begin
      Buf := DecNumToHexStr(I * 16, 2) + ':'; // DM address

      for J := 0 to 15 do
        Buf := Buf + ' ' + DecNumToHexStr(DM[I * 16 + J], 2); // DM value

      MemoDM.Lines.Add(Buf);
    end;
end;

procedure TFormMain.UpDatePortsA_B;

procedure UpDatePin(SpeedButton: TSpeedButton; PortName: Char; Pin: Byte);

const
  ImageNum: array [0..7] of Byte = (12, 11, 10, 9, 12, 11, 10, 9); // 12: Blue, 11: Green, 10: Yellow, 9: Red

begin // Update pin
  with SpeedButton do
    if TestBitBin(AddressDM_ByRegName('Config' + PortName), Pin) then // Pin input
      if Flat then // LED indicator
        begin
          Flat := False; // Button
          Enabled := True;

          SpeedButton.Glyph := Nil; // No Image
        end
      else // Button
    else // Pin output
      begin
        if not Flat then // Button
          begin
            Flat := True; // LED indicator

            if Pin <= 7 then // 0 <= Pin <= 7
              ImagesList.GetBitmap(ImageNum[Pin], SpeedButton.Glyph)
          end;

        Enabled := TestBitBin(AddressDM_ByRegName('Port' + PortName), Pin);
      end;
end;

begin // Update ports
  UpDatePin(SpeedButtonA7, 'A', 7);
  UpDatePin(SpeedButtonA6, 'A', 6);
  UpDatePin(SpeedButtonA5, 'A', 5);
  UpDatePin(SpeedButtonA4, 'A', 4);
  UpDatePin(SpeedButtonA3, 'A', 3);
  UpDatePin(SpeedButtonA2, 'A', 2);
  UpDatePin(SpeedButtonA1, 'A', 1);
  UpDatePin(SpeedButtonA0, 'A', 0);

  UpDatePin(SpeedButtonB7, 'B', 7);
  UpDatePin(SpeedButtonB6, 'B', 6);
  UpDatePin(SpeedButtonB5, 'B', 5);
  UpDatePin(SpeedButtonB4, 'B', 4);
  UpDatePin(SpeedButtonB3, 'B', 3);
  UpDatePin(SpeedButtonB2, 'B', 2);
  UpDatePin(SpeedButtonB1, 'B', 1);
  UpDatePin(SpeedButtonB0, 'B', 0);
end;

procedure TFormMain.UpDateRegTimerCounter;

const
  TimerDivArray: array [0..7] of Word = (2, 4, 8, 16, 32, 64, 128, 256);

var
  Val:      Byte;
  TimerDiv: Word;

begin // Update TimerCounter
  if TestBitBin(AddressDM_ByRegName('ConfigTimer'), 0) then // Timer enable
    begin
      if TimerValue = $FFFF then // Max. value
        TimerValue := $0000      // Reset TimerValue
      else
        Inc(TimerValue);         // Increment TimerValue

      if TestBitBin(AddressDM_ByRegName('ConfigTimer'), 1) then // Timer divider enable
        begin
          Val := 0;

          if TestBitBin(AddressDM_ByRegName('ConfigTimer'), 2) then // D0
            Val := Val + 1;

          if TestBitBin(AddressDM_ByRegName('ConfigTimer'), 3) then // D1
            Val := Val + 2;

          if TestBitBin(AddressDM_ByRegName('ConfigTimer'), 4) then // D2
            Val := Val + 4;

          TimerDiv := TimerDivArray[Val];
        end
      else // Timer divider disable
        TimerDiv := 1; // Timer divider value by default

      if (TimerValue mod TimerDiv) = 0 then
        begin // Increment TimerCounter
          Val := DM[AddressDM_ByRegName('TimerCounter')]; // Read TimerCounter

          if Val = $FF then // Max. value
            begin
              Val := $00;   // Reset Val

              SetBit(AddressDM_ByRegName('Int'), 0); // Timer interrupt
            end
          else
            Inc(Val); // Increment Val

          DM[AddressDM_ByRegName('TimerCounter')] := Val; // Write TimerCounter
        end;
    end;
end;

function TFormMain.RunCommand: Boolean;

var
  Code: AnsiString;
  Op1:  Word;
  Op2:  Byte;

  PCHi: Byte;
  PCLo: Byte;
  PC:   Word;

  Val:  Word;

procedure UpDateZeroBit(Val: Word);
begin // Update zero bit - Status[0]
  if Lo(Val) = 0 then
    SetBit(AddressDM_ByRegName('Status'), 0)    // Z = 1
  else
    ClearBit(AddressDM_ByRegName('Status'), 0); // Z = 0
end;

procedure UpDateCarryBit(Val: Word);
begin // Update carry bit - Status[1]
  if Hi(Val) = 0 then
    ClearBit(AddressDM_ByRegName('Status'), 1)  // C = 0
  else
    SetBit(AddressDM_ByRegName('Status'), 1);   // C = 1
end;

procedure IncPC(N: Byte);
begin // Increment PC
  if (PC + N) < ProgMem then // PC in program memory
    PC := PC + N // Increment PC
  else // PC out of program memory
    begin
      PrintErrorMessage(11, '');

      RunCommand := False; // Run command error

      Exit;
    end;

  DM[AddressDM_ByRegName('PCHi')] := Hi(PC);
  DM[AddressDM_ByRegName('PCLo')] := Lo(PC);
end;

begin // Run command
  RunCommand := True; // Run command (no error default)

  PCHi := DM[AddressDM_ByRegName('PCHi')];
  PCLo := DM[AddressDM_ByRegName('PCLo')];

  PC := (PCHi shl 8) + PCLo;

  if PC >= ProgMem then
    begin // PC out of program memory
      PrintErrorMessage(4, '0x' + DecNumToHexStr(PC, 4));

      RunCommand := False; // Run command error

      Exit;
    end;

  // Decode command
  Code := PM[PC].Code;
  Op1  := PM[PC].Op1;
  Op2  := PM[PC].Op2;

  // Find and run command
  if Code = 'ADDWF' then
    begin // (W + f) -> d; PC + 1; UpDate flags Z & C
      Val := RegW + DM[Op1];

      if Op2 = 0 then // d = 0
        RegW := Lo(Val)
      else            // d = 1
        DM[Op1] := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'ADDW' then
    begin // (W + k8) -> W; PC + 1; UpDate flags Z & C
      Val := RegW + Op1;

      RegW := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'SUBWF' then
    begin // (W - f) -> d; PC + 1; UpDate flags Z & C
      Val := RegW - DM[Op1];

      if Op2 = 0 then // d = 0
        RegW := Lo(Val)
      else            // d = 1
        DM[Op1] := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'SUBW' then
    begin // (W - k8) -> W; PC + 1; UpDate flags Z & C
      Val := RegW - Op1;

      RegW := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'INCF' then
    begin // (f + 1) -> d; PC + 1; UpDate flags Z & C
      Val := DM[Op1] + 1;

      if Op2 = 0 then // d = 0
        RegW := Lo(Val)
      else            // d = 1
        DM[Op1] := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'DECF' then
    begin // (f - 1) -> d; PC + 1; UpDate flags Z & C
      Val := DM[Op1] - 1;

      if Op2 = 0 then // d = 0
        RegW := Lo(Val)
      else            // d = 1
        DM[Op1] := Lo(Val);

      UpDateZeroBit(Val);  // Update flag Z
      UpDateCarryBit(Val); // Update flag C

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'ANDWF' then
    begin // (W and f) -> d; PC + 1; UpDate flag Z
      Val := RegW and DM[Op1];

      if Op2 = 0 then // d = 0
        RegW := Val
      else            // d = 1
        DM[Op1] := Val;

      UpDateZeroBit(Val); // Update flag Z

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'ANDW' then
    begin // (W and k8) -> W; PC + 1; UpDate flag Z
      Val := RegW and Op1;

      RegW := Val;

      UpDateZeroBit(Val); // Update flag Z

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'ORWF' then
    begin // (W or f) -> d; PC + 1; UpDate flag Z
      Val := RegW or DM[Op1];

      if Op2 = 0 then // d = 0
        RegW := Val
      else            // d = 1
        DM[Op1] := Val;

      UpDateZeroBit(Val); // Update flag Z

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'ORW' then
    begin // (W or k8) -> W; PC + 1; UpDate flag Z
      Val := RegW or Op1;

      RegW := Val;

      UpDateZeroBit(Val); // Update flag Z

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'NOTF' then
    begin // not f -> d; PC + 1; UpDate flag Z
      Val := not DM[Op1];

      if Op2 = 0 then // d = 0
        RegW := Val
      else            // d = 1
        DM[Op1] := Val;

      UpDateZeroBit(Val); // Update flag Z

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'CLRF' then
    begin // 0x00 -> f; PC + 1
      DM[Op1] := $00;

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'MOVFW' then
    begin // f -> W; PC + 1
      RegW := DM[Op1];

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'MOVWF' then
    begin // W -> f; PC + 1
      DM[Op1] := RegW;

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'MOVW' then
    begin // k8 -> W; PC + 1
      RegW := Op1;

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'BCF' then
    begin // '0' -> f[b]; PC + 1
      ClearBit(Op1, Op2); // f[b] = 0

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'BSF' then
    begin // '1' -> f[b]; PC + 1
      SetBit(Op1, Op2); // f[b] = 1

      IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'BTFC' then
    begin // if f[b] = '0' then PC + 2 else PC + 1
      if not TestBitBin(Op1, Op2) then // f[b] = '0'
        IncPC(2)  // PC + 2
      else
        IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'BTFS' then
    begin // if f[b] = '1' then PC + 2 else PC + 1
      if TestBitBin(Op1, Op2) then // f[b] = '1'
        IncPC(2)  // PC + 2
      else
        IncPC(1); // PC + 1

      Exit;
    end;

  if Code = 'CALL' then
    begin // (PC + 1) -> Stack; k12 -> PC
      Inc(StackPoint); // Increment StackPoint

      if StackPoint < StackSize then
        begin // Call
          IncPC(1); // PC + 1

          Stack[StackPoint] := PC;

          DM[AddressDM_ByRegName('PCHi')] := Hi(Op1);
          DM[AddressDM_ByRegName('PCLo')] := Lo(Op1);
        end
      else // Stack overflow
        begin
          PrintErrorMessage(5, '');

          RunCommand := False; // Run command error
        end;

      Exit;
    end;

  if Code = 'RETURN' then
    begin // Stack -> PC
      DM[AddressDM_ByRegName('PCHi')] := Hi(Stack[StackPoint]);
      DM[AddressDM_ByRegName('PCLo')] := Lo(Stack[StackPoint]);

      Dec(StackPoint); // Decrement StackPoint

      Exit;
    end;

  if Code = 'GOTO' then
    begin // k12 -> PC
      DM[AddressDM_ByRegName('PCHi')] := Hi(Op1);
      DM[AddressDM_ByRegName('PCLo')] := Lo(Op1);

      Exit;
    end;

  if Code = 'RETI' then
    begin // '1' -> GIE; Stack -> PC
      SetBit(AddressDM_ByRegName('ConfigInt'), 0); // Global iterrupt enable

      DM[AddressDM_ByRegName('PCHi')] := Hi(Stack[StackPoint]);
      DM[AddressDM_ByRegName('PCLo')] := Lo(Stack[StackPoint]);

      Dec(StackPoint); // Decrement StackPoint

      Exit;
    end;

  if Code = 'NOP' then
    begin // PC + 1
      IncPC(1); // PC + 1

      Exit;
    end;
end; // End of Run command

procedure TFormMain.PortInterrupt(const PortName: TPortName; const Pin: TBitNum);

var
  IntBit:       TBitNum;
  ConfigIntBit: TBitNum;

begin // Port interrupt
  if PortName = 'A' then // Port A
    begin
      ConfigIntBit := 2; // PAIE
      IntBit       := 1; // PAI
    end
  else                   // Port B
    begin
      ConfigIntBit := 3; // PBIE
      IntBit       := 2; // PBI
    end;

  if TestBitBin(AddressDM_ByRegName('Config' + PortName), Pin) and // Port A/B[Pin] input
  TestBitBin(AddressDM_ByRegName('ConfigInt'), ConfigIntBit) then  // Port A/B interrupt enable
    begin // Port A/B interrupt
      SetBit(AddressDM_ByRegName('Int'), IntBit); // Port A/B interrupt

      SetBit(AddressDM_ByRegName('Port' + PortName), Pin); // Set Port A/B[Pin]

      UpDateMemoRegistersMemoDM; // Update MemoRegisters & MemoDM
    end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin // Create form
  AppSettingByDefault;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin // Close form
  if ProgRunning then // Program running
    ProgramStopExecute(Self); // Stop program

  if ProgLoaded and (not ProgSaved) then // Program loaded and not saved
    if MessageDlg('Сохранить изменения в файле ' + ProgName + '?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      FileSaveExecute(Self); // Save file
end;

procedure TFormMain.FileCreateNewExecute(Sender: TObject);
begin // Create new file
  if ProgLoaded and (not ProgSaved) then // Program loaded and not saved
    if MessageDlg('Сохранить изменения в файле ' + ProgName + '?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      FileSaveExecute(Self); // Save file

  AppSettingByDefault;
end;

procedure TFormMain.FileOpenExecute(Sender: TObject);
begin // Open file
  if OpenDialog.Execute then // Open file dialog
    begin // Load program
      FileCreateNewExecute(Self); // Create new file

      ProgName := OpenDialog.FileName; // Open file name
      FormMain.Caption := AppTitle + '. ' + AppVersion + ' - ' + ShortProgName(ProgName); // UpDate form header

      MemoProgram.Lines.LoadFromFile(ProgName); // Loading program from file

      // Event: Memo program change!

      ProgSaved := True; // Program saved

      ActivateObjects; // Active objects
    end;
end;

procedure TFormMain.FileSaveExecute(Sender: TObject);
begin // Save file
  if ProgName = DefProgName then // Default program name
    FileSaveAsExecute(Self) // Save file as
  else // Save program
    begin
      MemoProgram.Lines.SaveToFile(ProgName); // Save program to file

      ProgSaved := True; // Program saved

      ActivateObjects;   // Active objects
    end;
end;

procedure TFormMain.FileSaveAsExecute(Sender: TObject);
begin // Save file as
  if SaveDialog.Execute then // Save file dialog
    begin // Save program
      ProgName := SaveDialog.FileName; // Save file name
      FormMain.Caption := AppTitle + '. ' + AppVersion + ' - ' + ShortProgName(ProgName); // UpDate form header

      MemoProgram.Lines.SaveToFile(ProgName); // Saving program to file

      ProgSaved := True; // Program saved

      ActivateObjects;   // Active objects
    end;
end;

procedure TFormMain.FileExitExecute(Sender: TObject);
begin // File exit
  FormMain.Close; // Form close
end;

procedure TFormMain.ProgramCompileExecute(Sender: TObject);

type
  LabelFormat = record
    Name:    AnsiString; // Label name
    Address: Word;       // Label (command) address
  end;

var
  WordsArray: array [1..6] of AnsiString; // Code; ' '; Op1; ','; Op2; Null
  LabelArray: array of LabelFormat;       // Dynamic array of Label name and Label adress
  GoToArray:  array of LabelFormat;       // Dynamic array of Label name and Command address

  I, J:          Word;
  CurAddress:    Word;
  ErrorCompiled: Boolean;
  CommandFound:  Boolean;
  LabelFound:    Boolean;
  CurString:     AnsiString;
  FormatOp1:     AnsiString;
  FormatOp2:     AnsiString;

function DeleteComment(Str: AnsiString): AnsiString;

var
  Ps:  Integer;
  Tmp: AnsiString;

begin // Delete comment
  Ps := Pos(';', Str); // Find comment

  if Ps > 0 then // Comment found
    if Ps = 1 then // Comment only
      Tmp := ''
    else // Delete comment and trim string
      Tmp := Trim(Copy(Str, 1, Ps - 1))
  else // No comment in string
    Tmp := Str;

  DeleteComment := Tmp;
end;

function AnalyseString(Str: AnsiString): Boolean;

const
  MaxStrLen    = 30; // Chars
  MaxWords     = 6;  // Words
  CharSet      = ['A'..'Z', '0'..'9', '_'];
  SeparatorSet = [',', ':'];

var
  I:          Byte;
  NumWord:    Byte;
  CurWord:    AnsiString;
  FirstSpace: Boolean;

begin // Analyse string
  NumWord    := 1;
  CurWord    := '';
  FirstSpace := True;

  // Clear WordsArray
  for I := 1 to 6 do
    WordsArray[I] := '';

  AnalyseString := True; // No error by default

  if Length(Str) > MaxStrLen then
    begin // Length input string out of range
      AnalyseString := False;

      Exit;
    end;

  for I := 1 to Length(Str) do // Scanning string
    if Str[I] = ' ' then
      if FirstSpace then
        if CurWord <> '' then
          begin
            if NumWord > MaxWords then
              begin // Words number out of range
                AnalyseString := False;

                Exit;
              end;

            WordsArray[NumWord] := CurWord; // Save CurWord
            Inc(NumWord);  // Next word
            CurWord := ''; // Reset CurWord

            if NumWord > MaxWords then
              begin // Words number out of range
                AnalyseString := False;

                Exit;
              end;

            WordsArray[NumWord] := ' '; // Save space
            Inc(NumWord); // Next word

            FirstSpace := False;
          end
        else // CurWord = ''
      else // Not FirstSpace
    else // Not Space
      begin
        FirstSpace := True;

        if Str[I] in SeparatorSet then
          begin // Separator
            if CurWord <> '' then
              begin
                if NumWord > MaxWords then
                  begin // Words number out of range
                    AnalyseString := False;

                    Exit;
                  end;

                WordsArray[NumWord] := CurWord; // Save CurWord
                Inc(NumWord); // Next word
                CurWord := ''; // Reset CurWord
              end;

            if (I > 1) and (WordsArray[NumWord - 1] = ' ') then // Last char is space
              WordsArray[NumWord - 1] := Str[I] // Readjust last saved char
            else // (First char) or (Last saved char (word) <> ' ')
              begin
                if NumWord > MaxWords then
                  begin // Words number out of range
                    AnalyseString := False;

                    Exit;
                  end;

                WordsArray[NumWord] := Str[I]; // Save separator
                Inc(NumWord); // Next word
              end;
          end // Separator
        else // Not (Space or Separator)
          if Str[I] in CharSet then // Char
            CurWord := CurWord + Str[I] // Add char to CurWord
          else // Not (Space or Separator or Char)
            begin // Error
              AnalyseString := False;

              Exit;
            end
      end;

  if CurWord <> '' then
    begin
      if NumWord > MaxWords then
        begin // Words number out of range
          AnalyseString := False;

          Exit;
        end;

      WordsArray[NumWord] := CurWord; // Save CurWord
    end;
end; // End of Analyse string

function HexStrToDec(Str: AnsiString): Word;

var
  I:          Byte;
  Val:        Word;
  Multiplier: Word;

begin // Hex string to dec
  Val := $0000;

  Multiplier := 1;

  for I := Length(Str) downto 3 do
    begin
      case Str[I] of
        '0'..'9': Val := Val + StrToInt(Str[I]) * Multiplier;
             'A': Val := Val + 10 * Multiplier;
             'B': Val := Val + 11 * Multiplier;
             'C': Val := Val + 12 * Multiplier;
             'D': Val := Val + 13 * Multiplier;
             'E': Val := Val + 14 * Multiplier;
             'F': Val := Val + 15 * Multiplier;
      else // Hex string format error
        begin
          Val := $FFFF; // Val = -1

          Break;
        end;
      end;

      Multiplier := Multiplier * 16;
    end;

  HexStrToDec := Val;
end;

begin // Program compile
  MemoMessage.Lines.Clear;  // Clear MemoMessage

  MemoMessage.Lines.Add('Компиляция программы...');

  ClearPM_MemoPM;           // Clear PM

  ErrorCompiled := False;   // No compiled error (default)

  CurAddress := $0000;      // Start address (default)

  SetLength(LabelArray, 0); // Clear LabelArray
  SetLength(GoToArray, 0);  // Clear GoToArray

  for I := 0 to MemoProgram.Lines.Count - 1 do
    begin // Compile all strings
      CurString := Trim(MemoProgram.Lines.Strings[I]); // Trim string

      CurString := DeleteComment(CurString); // Delete comment

      if CurString = '' then // Empty string
        Continue;            // Next string

      CurString := UpperCase(CurString); // Convert CurString to uppercase

      // Analyse CurString
      if not AnalyseString(CurString) then // Error in current string
        begin
          PrintErrorMessage(6, CurString);
          PrintErrorMessage(13, CurString);

          ErrorCompiled := True;

          Continue; // Next string
        end;

      if WordsArray[2] = ':' then // Label
        begin
          if WordsArray[3] = '' then // Correct Label format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                SetLength(LabelArray, Length(LabelArray) + 1);

                LabelArray[Length(LabelArray) - 1].Name := WordsArray[1]; // Label name
                LabelArray[Length(LabelArray) - 1].Address := CurAddress; // Label address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Label format error
            begin
              PrintErrorMessage(7, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      if WordsArray[1] = 'ORG' then // Directive 'ORG'
        begin
          if (WordsArray[2] = ' ') and (WordsArray[3] <> '') and (WordsArray[4] = '') and (Pos('0X', WordsArray[3]) = 1) then // Correct Directive 'ORG' format
            if HexStrToDec(WordsArray[3]) < ProgMem then // Address in ProgMem
              CurAddress := HexStrToDec(WordsArray[3]) // New CurAddress
            else // Address error
              begin
                PrintErrorMessage(8, CurString);
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Directive 'ORG' format error
            begin
              PrintErrorMessage(10, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      // Command
      FormatOp1 := '';
      FormatOp2 := '';

      CommandFound := False; // Not found (default)

      // Find command
      for J := 0 to Length(MC_Commands) - 1 do
        with MC_Commands[J] do
          if WordsArray[1] = UpperCase(Code) then
            begin // Command found
              FormatOp1 := UpperCase(Op1);
              FormatOp2 := UpperCase(Op2);

              CommandFound := True;

              Break;
            end;

      if not CommandFound then // Command not found
        begin
          PrintErrorMessage(6, CurString);
          PrintErrorMessage(13, CurString);

          ErrorCompiled := True;

          Continue; // Next string
        end;

      if (FormatOp1 = '') and (FormatOp2 = '') then // Code
        begin
          if WordsArray[2] = '' then // Correct Code format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                PM[CurAddress].Code := WordsArray[1]; // Code

                Inc(CurAddress); // Next address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Code format error
            begin
              PrintErrorMessage(9, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      if (FormatOp1 = 'F') and ((FormatOp2 = 'D') or (FormatOp2 = 'B')) then // Code f, d/b
        begin
          if (WordsArray[2] = ' ') and (WordsArray[3] <> '') and (WordsArray[4] = ',') and (WordsArray[5] <> '') and (WordsArray[6] = '') and
          (Length(WordsArray[5]) = 1) and (((FormatOp2 = 'D') and (WordsArray[5][1] in ['0', '1'])) or ((FormatOp2 = 'B') and (WordsArray[5][1] in ['0'..'7']))) then // Correct Code f, d/b format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                PM[CurAddress].Code := WordsArray[1]; // Code

                if Pos('0X', WordsArray[3]) = 1 then // Hex address
                  PM[CurAddress].Op1 := Lo(HexStrToDec(WordsArray[3])) // Op1
                else // Register name
                  PM[CurAddress].Op1 := AddressDM_ByRegName(WordsArray[3]); // Op1

                PM[CurAddress].Op2 := StrToInt(WordsArray[5][1]); // Op2

                Inc(CurAddress); // Next address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Code f, d/b format error
            begin
              PrintErrorMessage(9, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      if (FormatOp1 = 'F') and (FormatOp2 = '') then // Code f
        begin
          if (WordsArray[2] = ' ') and (WordsArray[3] <> '') and (WordsArray[4] = '') then // Correct Code f format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                PM[CurAddress].Code := WordsArray[1]; // Code

                if Pos('0X', WordsArray[3]) = 1 then // Hex address
                  PM[CurAddress].Op1 := Lo(HexStrToDec(WordsArray[3])) // Op1
                else // Register name
                  PM[CurAddress].Op1 := AddressDM_ByRegName(WordsArray[3]); // Op1

                Inc(CurAddress); // Next address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Code f format error
            begin
              PrintErrorMessage(9, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      if (FormatOp1 = 'K8') and (FormatOp2 = '') then // Code k8
        begin
          if (WordsArray[2] = ' ') and (WordsArray[3] <> '') and (WordsArray[4] = '') and (Pos('0X', WordsArray[3]) = 1) then // Correct Code k8 format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                PM[CurAddress].Code := WordsArray[1]; // Code
                PM[CurAddress].Op1 := Lo(HexStrToDec(WordsArray[3])); // Op1

                Inc(CurAddress); // Next address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Code k8 format error
            begin
              PrintErrorMessage(9, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      if (FormatOp1 = 'K12') and (FormatOp2 = '') then // Code k12
        begin
          if (WordsArray[2] = ' ') and (WordsArray[3] <> '') and (WordsArray[4] = '') then // Correct Code k12 format
            if CurAddress < ProgMem then
              begin // CurAddress in ProgMem
                PM[CurAddress].Code := WordsArray[1]; // Code

                if Pos('0X', WordsArray[3]) = 1 then // Hex address
                  if HexStrToDec(WordsArray[3]) < ProgMem then // Address in ProgMem
                    PM[CurAddress].Op1 := HexStrToDec(WordsArray[3]) // Op1
                  else // Address error
                    begin
                      PrintErrorMessage(8, CurString);
                      PrintErrorMessage(13, CurString);

                      ErrorCompiled := True;
                    end
                else // Label
                  begin
                    SetLength(GoToArray, Length(GoToArray) + 1);

                    GoToArray[Length(GoToArray) - 1].Name := WordsArray[3]; // Label name
                    GoToArray[Length(GoToArray) - 1].Address := CurAddress; // Command address
                  end;

                Inc(CurAddress); // Next address
              end
            else // CurAddress out of ProgMem
              begin
                PrintErrorMessage(12, '');
                PrintErrorMessage(13, CurString);

                ErrorCompiled := True;
              end
          else // Code k12 format error
            begin
              PrintErrorMessage(9, CurString);
              PrintErrorMessage(13, CurString);

              ErrorCompiled := True;
            end;

          Continue; // Next string
        end;

      // Command format error
      PrintErrorMessage(9, CurString);
      PrintErrorMessage(13, CurString);

      ErrorCompiled := True;
    end; // End of Compile all strings

  // Set label address
  if Length(GoToArray) > 0 then // GoToArray is not empty
    for I := 0 to Length(GoToArray) - 1 do
      begin
        LabelFound := False; // Not found (default)

        // Find label address by name
        if Length(LabelArray) > 0 then // LabelArray is not empty
          for J := 0 to Length(LabelArray) - 1 do
            if GoToArray[I].Name = LabelArray[J].Name then
              begin // Label found
                PM[GoToArray[I].Address].Op1 := LabelArray[J].Address; // Op1

                LabelFound := True;

                Break;
              end;

        if not LabelFound then
          begin // Label is not found
            PrintErrorMessage(2, GoToArray[I].Name);

            ErrorCompiled := True;
          end;
      end;

  if not ErrorCompiled then // No compiled errors
    begin
      UpDateMemoPM; // Update PM

      MicrocontrollerResetExecute(Self); // Reset microcontroller

      ProgCompiled := True;

      ActivateObjects; // Activate objects

      MemoMessage.Lines.Clear; // Clear MemoMessage
      MemoMessage.Lines.Add('Компиляция программы завершена успешно.');
    end;
end;

procedure TFormMain.ProgramRunExecute(Sender: TObject);
begin // Run program
  ProgRunning        := True;
  ProgRunningCommand := False;  // Real mode

  ActivateObjects;              // Active objects

  MemoProgram.ReadOnly := True; // MemoProgram disable

  Timer.Enabled := True;        // Run program
end;

procedure TFormMain.ProgramRunCommandExecute(Sender: TObject);
begin // Run command
  ProgRunning        := True;
  ProgRunningCommand := True;   // Step-by-step mode

  ActivateObjects;              // Active objects

  MemoProgram.ReadOnly := True; // MemoProgram disable

  Timer.Enabled := True;        // Run command
end;

procedure TFormMain.ProgramStopExecute(Sender: TObject);
begin // Stop program/command
  Timer.Enabled := False;        // Stop program/command

  MemoProgram.ReadOnly := False; // MemoProgram enable

  ProgRunning        := False;
  ProgRunningCommand := False;

  ActivateObjects;               // Active objects

  UpDateMemoRegistersMemoDM;     // Update DM
  UpDatePortsA_B;                // Update ports
end;

procedure TFormMain.MicrocontrollerResetExecute(Sender: TObject);

var
  I: Byte;

begin // Reset microcontroller
  ClearStack;                // Clear stack

  RegW := $00;               // Reset register W

  TimerValue := $0000;       // Reset TimerValue

  // Set system registers (default values)
  for I := 0 to Length(MC_SysRegs) - 1 do
    DM[MC_SysRegs[I].AddressDM] := MC_SysRegs[I].DefValue;

  // Clear user DM
  for I := Length(MC_SysRegs) to DataMem - 1 do
    DM[I] := $00;

  UpDateMemoRegistersMemoDM; // Update DM
  UpDatePortsA_B;            // Update ports
end;

procedure TFormMain.MicrocontrollerEditDMExecute(Sender: TObject);
begin // Edit DM
  ShowMessage('В данной версии программы эта функция не доступна!'); // ???
end;

procedure TFormMain.ReferenceAboutProgramExecute(Sender: TObject);
begin // About program
  FormAbout.ShowModal;
end;

procedure TFormMain.SpeedButtonA7Click(Sender: TObject);
begin // Click A7
  PortInterrupt('A', 7);
end;

procedure TFormMain.SpeedButtonA6Click(Sender: TObject);
begin // Click A6
  PortInterrupt('A', 6);
end;

procedure TFormMain.SpeedButtonA5Click(Sender: TObject);
begin // Click A5
  PortInterrupt('A', 5);
end;

procedure TFormMain.SpeedButtonA4Click(Sender: TObject);
begin // Click A4
  PortInterrupt('A', 4);
end;

procedure TFormMain.SpeedButtonA3Click(Sender: TObject);
begin // Click A3
  PortInterrupt('A', 3);
end;

procedure TFormMain.SpeedButtonA2Click(Sender: TObject);
begin // Click A2
  PortInterrupt('A', 2);
end;

procedure TFormMain.SpeedButtonA1Click(Sender: TObject);
begin // Click A1
  PortInterrupt('A', 1);
end;

procedure TFormMain.SpeedButtonA0Click(Sender: TObject);
begin // Click A0
  PortInterrupt('A', 0);
end;

procedure TFormMain.SpeedButtonB7Click(Sender: TObject);
begin // Click B7
  PortInterrupt('B', 7);
end;

procedure TFormMain.SpeedButtonB6Click(Sender: TObject);
begin // Click B6
  PortInterrupt('B', 6);
end;

procedure TFormMain.SpeedButtonB5Click(Sender: TObject);
begin // Click B5
  PortInterrupt('B', 5);
end;

procedure TFormMain.SpeedButtonB4Click(Sender: TObject);
begin // Click B4
  PortInterrupt('B', 4);
end;

procedure TFormMain.SpeedButtonB3Click(Sender: TObject);
begin // Click B3
  PortInterrupt('B', 3);
end;

procedure TFormMain.SpeedButtonB2Click(Sender: TObject);
begin // Click B2
  PortInterrupt('B', 2);
end;

procedure TFormMain.SpeedButtonB1Click(Sender: TObject);
begin // Click B1
  PortInterrupt('B', 1);
end;

procedure TFormMain.SpeedButtonB0Click(Sender: TObject);
begin // Click B0
  PortInterrupt('B', 0);
end;

procedure TFormMain.TimerTimer(Sender: TObject);

var
  PCHi: Byte;
  PCLo: Byte;

begin // Timer
  if ProgRunningCommand then // Program run command
    Timer.Enabled := False;  // Stop run command (Part 1)

  UpDateRegTimerCounter;     // Update TimerCounter

  if TestBitBin(AddressDM_ByRegName('ConfigInt'), 0) and // Global iterrupt enable
  (TestBitBin(AddressDM_ByRegName('Int'), 0) or          // Timer iterrupt
   TestBitBin(AddressDM_ByRegName('Int'), 1) or          // Port A iterrupt
   TestBitBin(AddressDM_ByRegName('Int'), 2)) then       // Port B iterrupt
    begin // Interrupt
      Inc(StackPoint);       // Increment StackPoint

      if StackPoint < StackSize then
        begin // Interrupt vector
          ClearBit(AddressDM_ByRegName('ConfigInt'), 0); // Global iterrupt disable

          PCHi := DM[AddressDM_ByRegName('PCHi')];
          PCLo := DM[AddressDM_ByRegName('PCLo')];

          Stack[StackPoint] := (PCHi shl 8) + PCLo; // Current PC

          DM[AddressDM_ByRegName('PCHi')] := Hi(IntVector);
          DM[AddressDM_ByRegName('PCLo')] := Lo(IntVector);
        end
      else // Stack overflow
        begin
          PrintErrorMessage(5, '');

          ProgramStopExecute(Self); // Program stop

          Exit;
        end;
    end
  else // No interrupt
    if not RunCommand then // Run command
      begin // Run command error
        ProgramStopExecute(Self); // Program stop

        Exit;
      end;

  UpDatePortsA_B; // Update ports A & B

  if ProgRunningCommand then // Program run command
    begin // Stop run command (Part 2)
      MemoProgram.ReadOnly := False; // MemoProgram enable

      ProgRunning        := False;
      ProgRunningCommand := False;

      ActivateObjects; // Activate objects

      UpDateMemoRegistersMemoDM; // Update MemoRegisters & MemoDM
    end;
end;

procedure TFormMain.MemoProgramChange(Sender: TObject);
begin // MemoProgram change
  if MemoProgram.Lines.Count = 0 then // MemoProgram is empty
    ProgLoaded := False               // Program no loaded
  else                                // MemoProgram is not empty
    ProgLoaded := True;               // Program loaded

  ProgSaved    := False;              // Program no saved
  ProgCompiled := False;              // Program no compiled

  ActivateObjects;                    // Activate objects
end;

procedure TFormMain.RadioButtonClick(Sender: TObject);
begin // RadioButton click
  // Visible MemoRegisters or MemoDM
  MemoRegisters.Visible := RadioButtonRegisters.Checked;
  MemoDM.Visible        := RadioButtonDM.Checked;
end;

end.

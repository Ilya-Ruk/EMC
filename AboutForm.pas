//////////////////////////////////////////////////////////////////
//  Эмулятор микроконтроллера                                   //
//                                                              //
//  Версия от 6 сентября 2009 г.                                //
//                                                              //
//  Copyright (c) 2007, 2009 by Рукавишников Илья Владимирович  //
//                                                              //
//  All rights reserved                                         //
//////////////////////////////////////////////////////////////////
unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormAbout = class(TForm)
    GroupBox:    TGroupBox;

    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;

    ButtonClose: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure ButtonCloseClick(Sender: TObject);
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.DFM}

uses
  MainForm;

procedure TFormAbout.FormCreate(Sender: TObject);
begin // Form create
  StaticText1.Caption := AppTitle;   // Application title
  StaticText2.Caption := AppVersion; // Application version
end;

procedure TFormAbout.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin // Form key down
  if Shift = [] then
    if Key = VK_ESCAPE then // Press Esc.
      FormAbout.Close;      // Form close
end;

procedure TFormAbout.ButtonCloseClick(Sender: TObject);
begin // Button "Close" click
  FormAbout.Close; // Form close
end;

end.

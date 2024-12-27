//////////////////////////////////////////////////////////////////
//  Эмулятор микроконтроллера                                   //
//                                                              //
//  Версия от 6 сентября 2009 г.                                //
//                                                              //
//  Copyright (c) 2007, 2009 by Рукавишников Илья Владимирович  //
//                                                              //
//  All rights reserved                                         //
//////////////////////////////////////////////////////////////////
program EMC;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AboutForm in 'AboutForm.pas' {FormAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Эмулятор МК';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.

//////////////////////////////////////////////////////////////////
//  �������� ����������������                                   //
//                                                              //
//  ������ �� 6 �������� 2009 �.                                //
//                                                              //
//  Copyright (c) 2007, 2009 by ������������ ���� ������������  //
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
  Application.Title := '�������� ��';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.

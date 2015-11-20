unit kantu_simulation;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ExtDlgs, kantu_definitions, Math, dateutils, Grids,
  Buttons, CheckLst;

type

  { TSimulationForm }

  TSimulationForm = class(TForm)
    AsymmetryCheck: TCheckBox;
    autoSaveGraphsOnWFACheck: TCheckBox;
    BeginInSampleCalendar: TCalendarDialog;
    BeginInSampleEdit: TEdit;
    Button1: TButton;
    EndInSampleCalendar: TCalendarDialog;
    EndInSampleEdit: TEdit;
    EndOutOfSampleCalendar: TCalendarDialog;
    EndOutOfSampleEdit: TEdit;
    FixComplexityCheck: TCheckBox;
    Label1: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LROriginCheck: TCheckBox;
    OptionsGrid: TStringGrid;
    OptionsPanel: TPanel;
    OptTargetComboBox: TComboBox;
    SaveAllResults: TCheckBox;
    SaveSummaryCheck: TCheckBox;
    UseAlwaysUpTLCheck: TCheckBox;
    UseDayFilter: TCheckBox;
    UsedInputsList: TCheckListBox;
    UseFixedHour: TCheckBox;
    UseFixedSLTP: TCheckBox;
    UseHourFilter: TCheckBox;
    UseSLCheck: TCheckBox;
    UseTPCheck: TCheckBox;
    procedure BeginInSampleCalendarDayChanged(Sender: TObject);
    procedure BeginInSampleEditChange(Sender: TObject);
    procedure BeginInSampleEditClick(Sender: TObject);
    procedure EndInSampleEditClick(Sender: TObject);
    procedure EndOutOfSampleEditClick(Sender: TObject);
    procedure OptionsGridPrepareCanvas(sender: TObject; aCol, aRow: Integer;
      aState: TGridDrawState);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SimulationForm: TSimulationForm;

implementation

uses kantu_main;

{$R *.lfm}

procedure TSimulationForm.EndInSampleEditClick(Sender: TObject);
begin

    if EndInSampleCalendar.Execute then
    EndInSampleEdit.Text := DateTimeToStr(EndInSampleCalendar.Date);

end;


procedure TSimulationForm.EndOutOfSampleEditClick(Sender: TObject);
begin
  if EndOutOfSampleCalendar.Execute and (EndOutOfSampleCalendar.Date > EndInSampleCalendar.Date) then
  begin
    EndOutOfSampleEdit.Text := DateTimeToStr(EndOutOfSampleCalendar.Date);
  end;

  if (EndOutOfSampleCalendar.Date < EndInSampleCalendar.Date) then
  EndOutOfSampleCalendar.Date := Now;

end;

procedure TSimulationForm.OptionsGridPrepareCanvas(sender: TObject; aCol,
  aRow: Integer; aState: TGridDrawState);
begin
  If  (aRow = 1) or (aRow = 6) or (aRow = 10) or (aRow = 14) or (aRow = 16) then
    OptionsGrid.Canvas.Brush.Color := clLtGray;
end;

procedure TSimulationForm.BeginInSampleCalendarDayChanged(Sender: TObject);
begin
  BeginInSampleEdit.Text := DateTimeToStr(BeginInSampleCalendar.Date);
end;

procedure TSimulationForm.BeginInSampleEditChange(Sender: TObject);
begin

end;


procedure TSimulationForm.BeginInSampleEditClick(Sender: TObject);
begin

 if BeginInSampleCalendar.Execute then
    BeginInSampleEdit.Text := DateTimeToStr(BeginInSampleCalendar.Date);

end;



end.

//Временный TESTDatasource
//Демо загрузки TimeLine вызовов по бригадам
//в дальнейшем Заменяется на Datasource
//из API Calls
//или DB SQL datasource

unit mcrBrigadesCallsTimeLineTestData;


interface

uses
  System.SysUtils, System.Variants, Vcl.Graphics, cxScheduler, cxSchedulerStorage;

procedure LoadTimeLineTestData(ABrigadeID: Integer; Scheduler: TcxScheduler);

implementation

uses
  mcrUtils;

procedure LoadTimeLineTestData(ABrigadeID: Integer; Scheduler: TcxScheduler);
const
  COLOR_URGENT         = clRed;
  COLOR_TRANSPORTATION = clWebLightGreen;
  COLOR_ASSISTANCE     = clInfoBk;
  COLOR_CANCELLEDCALL  = clAqua;
var
  BaseDate: TDateTime;
  TStart, TEnd: TDateTime;
  Storage: TcxCustomSchedulerStorage;
begin
  Storage := Scheduler.Storage;
  Storage.Clear;
  Storage.Resources.Items.Clear;

  Storage.BeginUpdate;
  try
    case ABrigadeID of
      1: begin
        BaseDate := Date + EncodeTime(0, 30, 0 , 0);
        TStart := BaseDate + EncodeTime(0, 30, 0, 0);
        TEnd := TStart + EncodeTime(1, 45, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 21', TStart, TEnd, COLOR_URGENT);

        TStart := TEnd + EncodeTime(0, 10, 0, 0);
        TEnd := TStart + EncodeTime(2, 15, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 22 (Травма)', TStart, TEnd, COLOR_URGENT);
      end;

      2: begin
        BaseDate := Date + EncodeTime(0, 10, 0 , 0);
        TStart := BaseDate;
        TEnd := TStart + EncodeTime(2, 0, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 11 (ДТП)', TStart, TEnd, COLOR_URGENT);

        TStart := TEnd + EncodeTime(0, 15, 0, 0);
        TEnd := TStart + EncodeTime(1, 30, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 12 (Перевозка)', TStart, TEnd, COLOR_TRANSPORTATION);

        TStart := TEnd + EncodeTime(0, 20, 0, 0);
        TEnd := TStart + EncodeTime(0, 40, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 13 (ОТМЕНЕН)', TStart, TEnd, COLOR_CANCELLEDCALL);

        TStart := TEnd + EncodeTime(0, 20, 0, 0);
        TEnd := TStart + EncodeTime(0, 50, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 14 (Давление)', TStart, TEnd, COLOR_ASSISTANCE);
      end;


      3: begin
        BaseDate := Date + EncodeTime(0, 40, 0 , 0);
        TStart := BaseDate;
        TEnd := TStart + EncodeTime(2, 30, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 31 (Встреча с вокзала)', TStart, TEnd, COLOR_TRANSPORTATION);

        TStart := TEnd + EncodeTime(1, 0, 0, 0);
        TEnd := TStart + EncodeTime(2, 0, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 32 (Госпитализация)', TStart, TEnd, COLOR_TRANSPORTATION);
      end;

      4: begin
        BaseDate := Date + EncodeTime(0, 5, 0 , 0);
        TStart := BaseDate + EncodeTime(1, 0, 0, 0);
        TEnd := TStart + EncodeTime(0, 45, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 40 (Температура)', TStart, TEnd, COLOR_ASSISTANCE);

        TStart := TEnd + EncodeTime(0, 20, 0, 0);
        TEnd := TStart + EncodeTime(1, 15, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 41 (Отит)', TStart, TEnd, COLOR_ASSISTANCE);
      end;

      5: begin
        BaseDate := Date + EncodeTime(0, 50, 0 , 0);
        TStart := BaseDate + EncodeTime(0, 15, 0, 0);
        TEnd := TStart + EncodeTime(1, 0, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 51 (Аритмия)', TStart, TEnd, COLOR_URGENT);

        TStart := TEnd + EncodeTime(0, 15, 0, 0);
        TEnd := TStart + EncodeTime(2, 0, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 52 (Транспортировка)', TStart, TEnd, COLOR_TRANSPORTATION);
      end;

      6: begin
        BaseDate := Date + EncodeTime(0, 15, 0 , 0);
        TStart := BaseDate;
        TEnd := TStart + EncodeTime(0, 30, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 61 (Процедуры)', TStart, TEnd, COLOR_ASSISTANCE);

        TStart := TEnd + EncodeTime(0, 10, 0, 0);
        TEnd := TStart + EncodeTime(0, 50, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 62 ', TStart, TEnd, COLOR_URGENT);
      end;

      7: begin
        BaseDate := Date + EncodeTime(0, 25, 0 , 0);
        TStart := BaseDate + EncodeTime(2, 0, 0, 0);
        TEnd := TStart + EncodeTime(2, 30, 0, 0);
        CreateSchedulerEvent(Storage, 0, 'Вызов N 71', TStart, TEnd, COLOR_URGENT);
      end;
    else
      BaseDate := Date + EncodeTime(0, 40, 0 , 0);
      TStart := BaseDate;
      TEnd := TStart + EncodeTime(1, 30, 0, 0);
      CreateSchedulerEvent(Storage, 0, 'Дежурный вызов 103  ', TStart, TEnd, COLOR_ASSISTANCE);
    end;
  finally
    Storage.EndUpdate;
  end;

  ScrollToFirstEvent(Scheduler);
end;

end.


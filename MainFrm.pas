unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons,
  JvExButtons, JvBitBtn, Menus, JvExStdCtrls, JvMemo, UtilsUnit,Registry,db;

type
  TMainForm = class(TForm)
    JvDBGrid1: TJvDBGrid;
    FromDatabase: TEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Label1: TLabel;
    FromUserName: TEdit;
    Label2: TLabel;
    FromPassword: TEdit;
    Label3: TLabel;
    FromServerName: TEdit;
    Label4: TLabel;
    FromTable: TEdit;
    Label5: TLabel;
    JvBitBtn1: TJvBitBtn;
    Label6: TLabel;
    ToDatabase: TEdit;
    Label7: TLabel;
    ToUserName: TEdit;
    Label8: TLabel;
    ToPassword: TEdit;
    Label9: TLabel;
    ToServerName: TEdit;
    JvDBGrid2: TJvDBGrid;
    OutputLog: TJvMemo;
    JvBitBtn3: TJvBitBtn;
    JvBitBtn4: TJvBitBtn;
    FromUniqueField: TEdit;
    Label11: TLabel;
    SQLEdit: TMemo;
    Label10: TLabel;
    SQL: TMemo;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    Button3: TButton;
    About1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure JvBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
      uses datafrm, AboutFrm;

{$R *.dfm}

procedure TMainForm.About1Click(Sender: TObject);
begin
        Application.CreateForm(TAboutForm, AboutForm);
        AboutForm.showmodal;
        AboutForm.Free;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
            if Savedialog1.Execute then
            begin
              SQL.Lines.SaveToFile(SaveDialog1.FileName);
            end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
            if Savedialog1.Execute then
            begin
              Outputlog.Lines.SaveToFile(SaveDialog1.FileName);
            end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to Run this it cannot be undone!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Dataform.ToConnection.StartTransaction;
        try
          Dataform.ToQuery1.SQL.Clear;
          Dataform.ToQuery1.SQL.Add(SQL.Lines.Text);
          Dataform.ToQuery1.ExecSQL;
          Dataform.ToQuery1.SQL.Clear;
          Dataform.ToConnection.Commit;
          showmessage('Finished');
        finally
          if DataForm.ToConnection.InTransaction then
          begin
            Dataform.ToConnection.Rollback;
            showmessage('Something went wrong all changes were dropped!');
          end;
        end;
      end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
            Dataform.FromQuery1.Close;
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromDatabase', rdString, FromDatabase.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromUserName', rdString, FromUserName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromPassword', rdString, encrypt(FromPassword.Text));
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromServerName', rdString, FromServerName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromTable', rdString, FromTable.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromUniqueField', rdString, FromUniqueField.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToDatabase', rdString, ToDatabase.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToUserName', rdString, ToUserName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToPassword', rdString, encrypt(ToPassword.Text));
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToServerName', rdString, ToServerName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'SQLEdit', rdString, SQLEdit.Text);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
            try
              FromDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromDatabase');
            except
              FromDatabase.Text := '';
            end;
            try
              FromUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUserName');
            except
              FromUserName.Text := '';
            end;
            try
              FromPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromPassword'));
            except
              FromPassword.Text := '';
            end;
            try
              FromServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromServerName');
            except
              FromServerName.Text := '';
            end;
            try
              FromTable.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromTable');
            except
              FromTable.Text := '';
            end;
            try
              FromUniqueField.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUniqueField');
            except
              FromUniqueField.Text := '';
            end;
            try
              ToDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToDatabase');
            except
              ToDatabase.Text := '';
            end;
            try
              ToUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToUserName');
            except
              ToUserName.Text := '';
            end;
            try
              ToPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToPassword'));
            except
              ToPassword.Text := '';
            end;
            try
              ToServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToServerName');
            except
              ToServerName.Text := '';
            end;
            try
              SQLEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','SQLEdit');
            except
              SQLEdit.Text := '';
            end;
end;

procedure TMainForm.JvBitBtn1Click(Sender: TObject);
begin
          if POS(FromTable.Text,SQLEdit.Text) = 0 then
          begin
            showmessage('Table name must be present in Query');
            exit;
          end;
          try
            Dataform.FromConnection.Close;
            Dataform.FromConnection.Params.Clear;
            Dataform.FromConnection.Params.Add('DriverID=MSSQL');
            Dataform.FromConnection.Params.Add('Database=' + FromDatabase.Text);
            Dataform.FromConnection.Params.Add('User_Name=' + FromUserName.Text);
            Dataform.FromConnection.Params.Add('Password=' + FromPassword.Text);
            Dataform.FromConnection.Params.Add('Server=' + FromServerName.Text);
            Dataform.FromConnection.Open;
            DataForm.FromQuery1.close;
            with Dataform.FromQuery1.SQL do
            begin
              Clear;
              Text := SQLEdit.Text;
            end;
            Dataform.FromQuery1.Open;
          except
          begin
            ShowMessage('Unable to connect to MSSQL From Server, make sure the Database exist');
            Dataform.FromConnection.Close;
          end;
          raise;
          end;
          try
            Dataform.ToConnection.Close;
            Dataform.ToConnection.Params.Clear;
            Dataform.ToConnection.Params.Add('DriverID=MSSQL');
            Dataform.ToConnection.Params.Add('Database=' + ToDatabase.Text);
            Dataform.ToConnection.Params.Add('User_Name=' + ToUserName.Text);
            Dataform.ToConnection.Params.Add('Password=' + ToPassword.Text);
            Dataform.ToConnection.Params.Add('Server=' + ToServerName.Text);
            Dataform.ToConnection.Open;
            DataForm.ToQuery1.close;
            with Dataform.ToQuery1.SQL do
            begin
              Clear;
              Text := SQLEdit.Text;
            end;
            Dataform.ToQuery1.Open;
          except
          begin
            ShowMessage('Unable to connect to MSSQL To Server, make sure the Database exist');
            Dataform.ToConnection.Close;
          end;
          raise;
          end;

end;

procedure TMainForm.JvBitBtn4Click(Sender: TObject);
var
          I:Integer;
          s: String;
          RecordChanged: Boolean;
          FieldsString,ValuesString,QueryString:WideString;
begin
          Outputlog.Clear;
          SQL.Clear;
          FieldsString := '';
          ValuesString := '';
          OutputLog.Lines.Clear;
          Dataform.FromQuery1.First;
          Dataform.FromQuery1.DisableControls;
          while not Dataform.FromQuery1.EOF do
          begin
            DataForm.ToQuery2.close;
            with Dataform.ToQuery2.SQL do
            begin
              Clear;
              Add('select * from ' + FromTable.Text);
              Add('where ' + FROMUniquefield.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text)));
            end;
            Dataform.ToQuery2.Open;
            if Dataform.ToQuery2.RecordCount = 0 then
            begin
              OutputLog.Lines.Add('Insert ' + Dataform.FromQuery1.FieldByName(FromUniquefield.Text).asString);
              for I := 0 to Dataform.FromQuery1.Fields.Count - 1 do
              begin
                if FieldsString = '' then
                begin
                  FieldsString := DataForm.FromQuery1.Fields[I].FieldName;
                  ValuesString := ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end
                else
                begin
                  FieldsString := FieldsString + ',' + DataForm.FromQuery1.Fields[I].FieldName;
                  ValuesString := ValuesString + ',' + ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end;
              end;
              QueryString := 'insert into ' + FromTable.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
              SQL.Lines.Add(QueryString);
              FieldsString := '';
              ValuesString := '';
            end
            else
            begin
              s := 'Update ' + Dataform.FromQuery1.FieldByName(FromUniquefield.Text).asString;
              RecordChanged := False;
              for I := 0 to Dataform.FromQuery1.Fields.Count - 1 do
              begin
                if Dataform.ToQuery2.Fields[I].Value <> Dataform.FromQuery1.Fields[I].Value then
                begin
//                  showmessage(InttoStr(I));
                  RecordChanged := True;
                  if FieldsString = '' then
                    FieldsString := DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I])
                  else
                    FieldsString := FieldsString + ',' + DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end;
              end;
              if RecordChanged = true then
              begin
                QueryString := 'update ' + FromTable.Text + ' set ' + FieldsString + ' where ' + FromUniqueField.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text)) + ';';
                SQL.Lines.Add(QueryString);
                FieldsString := '';
                OutputLog.Lines.Add(s);
              end;
            end;
            Dataform.FromQuery1.Next;
          end;
          Dataform.FromQuery1.EnableControls;
          dataform.ToQuery2.close;
          showmessage('Finished');
end;


end.
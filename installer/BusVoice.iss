; BusVoice — установщик на Inno Setup (собирается автоматически в GitHub Actions, см. .github/workflows/inno.yml)
#define AppName "BusVoice"
#define AppVer GetEnv("BV_VERSION")
#if AppVer == ""
  #define AppVer "0.0.0"
#endif
#define PyVer "3.12.0"
#define PyExe "python-3.12.0-amd64.exe"
#define PyUrl "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe"
#define PyUrl2 "https://registry.npmmirror.com/-/binary/python/3.12.0/python-3.12.0-amd64.exe"
#define PyUrl3 "https://mirrors.huaweicloud.com/python/3.12.0/python-3.12.0-amd64.exe"
#define PySha "c6bdf93f4b2de6dfa1a3a847e7c24ae10edf7f6318653d452cd4381415700ada"

[Setup]
AppId={{6F0B3A57-3B1E-4C57-9D58-4B5575C0A1E2}
AppName={#AppName}
AppVersion={#AppVer}
AppVerName={#AppName} {#AppVer}
AppPublisher=THEIGOREK
AppPublisherURL=https://github.com/THEIGOREK/BusVoice
AppSupportURL=https://github.com/THEIGOREK/BusVoice/issues
DefaultDirName={autopf}\BusVoice
DefaultGroupName=BusVoice
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir=..\out
OutputBaseFilename=BusVoice_Setup
SetupIconFile=..\payload\icon.ico
UninstallDisplayIcon={app}\icon.ico
UninstallDisplayName={#AppName}
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
ShowLanguageDialog=yes
UsePreviousLanguage=no
CloseApplications=yes
RestartApplications=no
VersionInfoVersion={#AppVer}.0
VersionInfoCompany=THEIGOREK
VersionInfoDescription=BusVoice Setup
VersionInfoProductName=BusVoice

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
#if FileExists("Belarusian.isl")
Name: "belarusian"; MessagesFile: "Belarusian.isl"
#endif

[CustomMessages]
russian.TaskDefender=Добавить папку BusVoice в исключения Защитника Windows (Windows попросит подтверждение)
english.TaskDefender=Add the BusVoice folder to Windows Defender exclusions (Windows will ask for confirmation)
ukrainian.TaskDefender=Додати теку BusVoice до винятків Захисника Windows (Windows попросить підтвердження)
#if FileExists("Belarusian.isl")
belarusian.TaskDefender=Дадаць папку BusVoice у выключэнні Абаронцы Windows (Windows папросіць пацвярджэнне)
#endif
russian.DlPython=Скачивается Python {#PyVer} (нужен только для BusVoice)...
english.DlPython=Downloading Python {#PyVer} (used only by BusVoice)...
ukrainian.DlPython=Завантажується Python {#PyVer} (потрібен лише для BusVoice)...
#if FileExists("Belarusian.isl")
belarusian.DlPython=Спампоўваецца Python {#PyVer} (патрэбен толькі для BusVoice)...
#endif
russian.InstPython=Устанавливается Python {#PyVer} внутрь папки BusVoice...
english.InstPython=Installing Python {#PyVer} inside the BusVoice folder...
ukrainian.InstPython=Встановлюється Python {#PyVer} усередину теки BusVoice...
#if FileExists("Belarusian.isl")
belarusian.InstPython=Усталёўваецца Python {#PyVer} у папку BusVoice...
#endif
russian.InstLibs=Устанавливаются библиотеки (это может занять несколько минут)...
english.InstLibs=Installing libraries (this may take a few minutes)...
ukrainian.InstLibs=Встановлюються бібліотеки (це може тривати кілька хвилин)...
#if FileExists("Belarusian.isl")
belarusian.InstLibs=Усталёўваюцца бібліятэкі (гэта можа заняць некалькі хвілін)...
#endif
russian.DlFail=Не удалось скачать Python. Проверьте интернет и запустите установку снова.
english.DlFail=Could not download Python. Check your internet connection and run setup again.
ukrainian.DlFail=Не вдалося завантажити Python. Перевірте інтернет і запустіть встановлення знову.
#if FileExists("Belarusian.isl")
belarusian.DlFail=Не атрымалася спампаваць Python. Праверце інтэрнэт і запусціце ўсталёўку зноў.
#endif
russian.PyFail=Не удалось установить Python. Подробности: %1
english.PyFail=Could not install Python. Details: %1
ukrainian.PyFail=Не вдалося встановити Python. Деталі: %1
#if FileExists("Belarusian.isl")
belarusian.PyFail=Не атрымалася ўсталяваць Python. Падрабязнасці: %1
#endif
russian.LibFail=Не удалось установить библиотеки. Проверьте интернет и запустите установку снова.
english.LibFail=Could not install libraries. Check your internet connection and run setup again.
ukrainian.LibFail=Не вдалося встановити бібліотеки. Перевірте інтернет і запустіть встановлення знову.
#if FileExists("Belarusian.isl")
belarusian.LibFail=Не атрымалася ўсталяваць бібліятэкі. Праверце інтэрнэт і запусціце ўсталёўку зноў.
#endif
russian.VenvFail=Не удалось создать окружение Python. Код: %1
english.VenvFail=Could not create the Python environment. Code: %1
ukrainian.VenvFail=Не вдалося створити середовище Python. Код: %1
russian.AskData=Удалить также ваши данные (карты, маршруты, настройки, звуки)?
english.AskData=Also delete your data (maps, routes, settings, sounds)?
ukrainian.AskData=Видалити також ваші дані (мапи, маршрути, налаштування, звуки)?
#if FileExists("Belarusian.isl")
belarusian.AskData=Выдаліць таксама вашы даныя (мапы, маршруты, налады, гукі)?
#endif

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "defender"; Description: "{cm:TaskDefender}"

[Files]
Source: "..\payload\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{autoprograms}\BusVoice"; Filename: "{app}\venv\Scripts\pythonw.exe"; Parameters: """{app}\busvoice.py"""; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"
Name: "{autodesktop}\BusVoice"; Filename: "{app}\venv\Scripts\pythonw.exe"; Parameters: """{app}\busvoice.py"""; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"; Tasks: desktopicon
Name: "{app}\BusVoice"; Filename: "{app}\venv\Scripts\pythonw.exe"; Parameters: """{app}\busvoice.py"""; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"

[Run]
Filename: "{app}\venv\Scripts\pythonw.exe"; Parameters: """{app}\busvoice.py"""; WorkingDir: "{app}"; Description: "{cm:LaunchProgram,BusVoice}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{app}\_setup\{#PyExe}"; Parameters: "/uninstall /quiet"; RunOnceId: "RemovePython"; Flags: waituntilterminated runhidden; Check: FileExists(ExpandConstant('{app}\_setup\{#PyExe}'))

[Code]
var
  Dl: TDownloadWizardPage;
  PyTmp: String;
  SysPy: String;

procedure InitializeWizard;
begin
  Dl := CreateDownloadPage(SetupMessage(msgWizardPreparing), ExpandConstant('{cm:DlPython}'), nil);
end;

function FindSystemPython: String;
var
  Vers: array[0..5] of String;
  Roots: array[0..2] of Integer;
  i, r: Integer;
  Dir, Exe: String;
begin
  Result := '';
  Vers[0] := '3.12'; Vers[1] := '3.13'; Vers[2] := '3.11'; Vers[3] := '3.14'; Vers[4] := '3.10'; Vers[5] := '3.15';
  Roots[0] := HKCU; Roots[1] := HKLM64; Roots[2] := HKLM32;
  for i := 0 to 5 do
    for r := 0 to 2 do
    begin
      Dir := '';
      if RegQueryStringValue(Roots[r], 'Software\Python\PythonCore\' + Vers[i] + '\InstallPath', '', Dir) and (Dir <> '') then
      begin
        Exe := AddBackslash(Dir) + 'python.exe';
        if FileExists(Exe) then
        begin
          Result := Exe;
          Exit;
        end;
      end;
    end;
end;

function PyAlreadyHere: Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\python\python.exe'));
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  Ok: Boolean;
  Urls: array[0..2] of String;
  i: Integer;
begin
  Result := True;
  if CurPageID = wpReady then
  begin
    PyTmp := '';
    SysPy := FindSystemPython;
    if SysPy <> '' then Exit;
    if PyAlreadyHere then Exit;
    Urls[0] := '{#PyUrl}';
    Urls[1] := '{#PyUrl2}';
    Urls[2] := '{#PyUrl3}';
    Ok := False;
    Dl.Show;
    try
      for i := 0 to 2 do
      begin
        if Ok then Break;
        Dl.Clear;
        Dl.Add(Urls[i], '{#PyExe}', '{#PySha}');
        try
          Dl.Download;
          Ok := True;
        except
          Ok := False;
        end;
      end;
    finally
      Dl.Hide;
    end;
    if Ok then
      PyTmp := ExpandConstant('{tmp}\{#PyExe}')
    else
    begin
      MsgBox(ExpandConstant('{cm:DlFail}'), mbError, MB_OK);
      Result := False;
    end;
  end;
end;

function RunHidden(const Exe, Params, Dir: String; var Code: Integer): Boolean;
begin
  Result := Exec(Exe, Params, Dir, SW_HIDE, ewWaitUntilTerminated, Code);
end;

procedure AddDefender(Add: Boolean; const Path: String);
var
  Code: Integer;
  Verb: String;
begin
  if Add then Verb := 'Add-MpPreference' else Verb := 'Remove-MpPreference';
  ShellExec('runas', 'powershell.exe',
    '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "' + Verb + ' -ExclusionPath ''' + Path + '''"',
    '', SW_HIDE, ewWaitUntilTerminated, Code);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  App, Py, Base, Venv, VPy, Req, Setup, Extra: String;
  Code, i: Integer;
  Ok: Boolean;
begin
  if CurStep <> ssPostInstall then Exit;
  App := ExpandConstant('{app}');
  Py := App + '\python\python.exe';
  Venv := App + '\venv';
  VPy := Venv + '\Scripts\python.exe';
  Setup := App + '\_setup';
  ForceDirectories(Setup);
  Code := 0;
  Base := SysPy;
  if (Base = '') and (PyTmp <> '') and not FileExists(Py) then
  begin
    WizardForm.StatusLabel.Caption := ExpandConstant('{cm:InstPython}');
    Ok := False;
    for i := 1 to 3 do
    begin
      RunHidden(PyTmp, '/quiet InstallAllUsers=0 "TargetDir=' + App + '\python" PrependPath=0 Shortcuts=0 Include_launcher=0 InstallLauncherAllUsers=0 Include_test=0 Include_doc=0 Include_dev=0 AssociateFiles=0 CompileAll=0', App, Code);
      if FileExists(Py) then begin Ok := True; Break; end;
      if Code = 1638 then Break;
      Sleep(3000 * i);
    end;
    if not Ok then
    begin
      Base := FindSystemPython;
      if Base = '' then
      begin
        MsgBox(FmtMessage(ExpandConstant('{cm:PyFail}'), [IntToStr(Code)]), mbError, MB_OK);
        Exit;
      end;
    end;
  end;
  if Base = '' then Base := Py;
  if not FileExists(VPy) then
  begin
    if not (RunHidden(Base, '-m venv "' + Venv + '"', App, Code) and (Code = 0) and FileExists(VPy)) then
    begin
      MsgBox(FmtMessage(ExpandConstant('{cm:VenvFail}'), [IntToStr(Code)]), mbError, MB_OK);
      Exit;
    end;
  end;
  WizardForm.StatusLabel.Caption := ExpandConstant('{cm:InstLibs}');
  Req := App + '\requirements.txt';
  Ok := False;
  for i := 0 to 3 do
  begin
    if i = 2 then Extra := ' -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com'
    else if i = 3 then Extra := ' -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn'
    else Extra := '';
    if RunHidden(VPy, '-m pip install --no-cache-dir --disable-pip-version-check --retries 5 --timeout 30' + Extra + ' -r "' + Req + '"', App, Code) and (Code = 0) then
    begin
      Ok := True;
      Break;
    end;
    Sleep(3000);
  end;
  if not Ok then
    MsgBox(ExpandConstant('{cm:LibFail}'), mbError, MB_OK);
  if WizardIsTaskSelected('defender') then
  begin
    AddDefender(True, App);
    SaveStringToFile(Setup + '\defender.txt', App, False);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  App: String;
  S: AnsiString;
begin
  App := ExpandConstant('{app}');
  if CurUninstallStep = usUninstall then
  begin
    if LoadStringFromFile(App + '\_setup\defender.txt', S) then
      AddDefender(False, Trim(String(S)));
  end;
  if CurUninstallStep = usPostUninstall then
  begin
    if MsgBox(ExpandConstant('{cm:AskData}'), mbConfirmation, MB_YESNO) = IDYES then
      DelTree(App, True, True, True)
    else
    begin
      DelTree(App + '\venv', True, True, True);
      DelTree(App + '\python', True, True, True);
      DelTree(App + '\_setup', True, True, True);
      DelTree(App + '\bin', True, True, True);
      DelTree(App + '\icons', True, True, True);
      DelTree(App + '\plugin', True, True, True);
    end;
  end;
end;

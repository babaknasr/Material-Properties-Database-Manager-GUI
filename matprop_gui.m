function varargout = matprop_gui(varargin)
% MATPROP_GUI MATLAB code for matprop_gui.fig
%      MATPROP_GUI, by itself, creates a new MATPROP_GUI or raises the existing
%      singleton*.
%
%      H = MATPROP_GUI returns the handle to a new MATPROP_GUI or the handle to
%      the existing singleton*.
%
%      MATPROP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATPROP_GUI.M with the given input arguments.
%
%      MATPROP_GUI('Property','Value',...) creates a new MATPROP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matprop_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matprop_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matprop_gui

% Last Modified by GUIDE v2.5 10-Mar-2015 14:13:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matprop_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @matprop_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before matprop_gui is made visible.
function matprop_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matprop_gui (see VARARGIN)

% Choose default command line output for matprop_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matprop_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.uipanel2,'Visible','off');


% --- Outputs from this function are returned to the command line.
function varargout = matprop_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in pop_proptype.
function pop_proptype_Callback(hObject, eventdata, handles)
% hObject    handle to pop_proptype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_proptype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_proptype
global matdata typevar
contents = cellstr(get(hObject,'String'));
conti = get(hObject,'Value');
list = cellstr(matdata.(typevar{conti})(2,:));
set(handles.list_items,'String',list,'Value',1);
set(handles.panel_prop,'Title',contents{conti});
list_items_Callback(handles.list_items, [], handles)

% --- Executes during object creation, after setting all properties.
function pop_proptype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_proptype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in list_items.
function list_items_Callback(hObject, eventdata, handles)
% hObject    handle to list_items (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_items contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_items
global matdata typevar matstruct
conti = get(hObject,'Value');
contents = cellstr(get(hObject,'String'));
typei = get(handles.pop_proptype,'Value');
ind = find(strcmpi(matdata.(typevar{typei})(2,:),contents{conti}));
set(handles.table_prop,'Data',matdata.(typevar{typei}){1,conti},...
    'ColumnEditable',[false, true, false],...
    'ColumnName',{'Property','Value','Unit'});


% --- Executes during object creation, after setting all properties.
function list_items_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_items (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_new.
function pb_new_Callback(hObject, eventdata, handles)
% hObject    handle to pb_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matstruct matdata typevar
prti = get(handles.pop_proptype,'Value');
prtl = cellstr(get(handles.pop_proptype,'String'));
vart = typevar{prti};
%check conflict here
un = 'untitled';
matdata.(vart){1,end+1} = matstruct.(vart);
matdata.(vart){2,end} = un;
prv = cellstr(get(handles.list_items,'String'));
set(handles.list_items,'String',[prv;{un}])
set(handles.list_items,'Value',length(prv)+1)
set(handles.table_prop,'Data',matstruct.(vart))


% --- Executes on button press in pb_delete.
function pb_delete_Callback(hObject, eventdata, handles)
% hObject    handle to pb_delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matdata typevar
button = questdlg('Are you sure you want to delete this item','Delete','Yes','No','No');
if strcmpi(button,'Yes')
    ind = get(handles.list_items,'Value');
    matdata.(typevar{get(handles.pop_proptype,'Value')})(:,ind) = [];
    update_gui(handles)
end %if


% --- Executes on button press in pb_save.
function pb_save_Callback(hObject, eventdata, handles)
% hObject    handle to pb_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullfile matdata typevar
button = questdlg('Are you sure to save the current database on current file',...
    'Delete','Yes','No','No');
if strcmpi(button,'Yes')
    for i=1:length(typevar)
        save(fullfile,'-struct','matdata',typevar{i},'-append','-mat');
    end %if
end %if
assignin('base','matdata',matdata);

% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_load_Callback(hObject, eventdata, handles)
% hObject    handle to m_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matdata typevar matstruct fullfile ostate
if isempty(ostate) || (ostate == 0)
    [filename, filepath] = uigetfile('*.mat','Select Material Database File');
    if (filename == 0)
        return
    end %if
    fullfile = [filepath, filename];
end %if
[typelist, typevar, matstruct] = mattypelist();
matdata = load(fullfile);
matdata = matdb_reorder(matdata);
matdata = matdb_setname(matdata);
matdata = matdb_sort(matdata);
set(handles.pop_proptype,'String',typelist,'Value',1);
pop_proptype_Callback(handles.pop_proptype, [], handles)
set(handles.text1,'String',fullfile);
set(handles.uipanel2,'Visible','on');


% --------------------------------------------------------------------
function m_saveas_Callback(hObject, eventdata, handles)
% hObject    handle to m_saveas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matdata typevar fullfile
[filename,fpath] = uiputfile('*.mat','Save Database As');
newfullfile = [fpath, filename];
for i=1:length(typevar)
        save(newfullfile,'-struct','matdata',typevar{i},'-append','-mat');
end %if
fullfile = newfullfile;
set(handles.text1,'String',fullfile);
% uisave('matdata',fullfile);


% --- Executes when entered data in editable cell(s) in table_prop.
function table_prop_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_prop (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global matdata matstruct typevar
ind = get(handles.list_items,'Value');
matdata.(typevar{get(handles.pop_proptype,'Value')}){1,ind} = ...
    get(handles.table_prop,'Data');
matdata = matdb_setname(matdata);



% --------------------------------------------------------------------
function m_load_default_Callback(hObject, eventdata, handles)
% hObject    handle to m_load_default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ostate fullfile
% fullfile = 'C:\Users\nasrb.AD\Dropbox\Clarkson\Research\MATLAB\My_Toolbox\Properties\material_database.mat';
fullfile = 'material_database.mat';
e = exist(fullfile,'file');
if (e == 2)
    ostate = 1;
    msgbox('The following default file is loaded','Load Default');
    m_load_Callback(handles.m_load, eventdata, handles)
    ostate = 0;
end %if


% ********** My own functions **********
function update_gui(handles)
global matdata typevar
indtype = get(handles.pop_proptype,'Value');
list = cellstr(matdata.(typevar{indtype})(2,:));
set(handles.list_items,'String',list,'Value',1);
set(handles.panel_prop,'Title',typevar{indtype});
list_items_Callback(handles.list_items, [], handles)

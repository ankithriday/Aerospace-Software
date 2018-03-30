function varargout = midtermGUI(varargin)
% MIDTERMGUI MATLAB code for midtermGUI.fig
%      MIDTERMGUI, by itself, creates a new MIDTERMGUI or raises the existing
%      singleton*.
%
%      H = MIDTERMGUI returns the handle to a new MIDTERMGUI or the handle to
%      the existing singleton*.
%
%      MIDTERMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MIDTERMGUI.M with the given input arguments.
%
%      MIDTERMGUI('Property','Value',...) creates a new MIDTERMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before midtermGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to midtermGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help midtermGUI

% Last Modified by GUIDE v2.5 29-Mar-2018 20:03:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @midtermGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @midtermGUI_OutputFcn, ...
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


% --- Executes just before midtermGUI is made visible.
function midtermGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to midtermGUI (see VARARGIN)

% Choose default command line output for midtermGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes midtermGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = midtermGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double
l1 = get(handles.l1,'string');
assignin('base','l1',l1);

% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double
l2 = get(handles.l2,'string');
assignin('base','l1',l2);

% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1_Callback(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1 as text
%        str2double(get(hObject,'String')) returns contents of m1 as a double
m1 = get(handles.m1,'string');
assignin('base','m1',m1);

% --- Executes during object creation, after setting all properties.
function m1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta1_Callback(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1 as text
%        str2double(get(hObject,'String')) returns contents of theta1 as a double
theta1 = get(handles.theta1,'string');
assignin('base','theta1',theta1);

% --- Executes during object creation, after setting all properties.
function theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_Callback(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2 as text
%        str2double(get(hObject,'String')) returns contents of theta2 as a double
theta2 = get(handles.theta2,'string');
assignin('base','theta2',theta2);

% --- Executes during object creation, after setting all properties.
function theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m2_Callback(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m2 as text
%        str2double(get(hObject,'String')) returns contents of m2 as a double
m2 = get(handles.m2,'string');
assignin('base','m2',m2);

% --- Executes during object creation, after setting all properties.
function m2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tdot2_Callback(hObject, eventdata, handles)
% hObject    handle to tdot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tdot2 as text
%        str2double(get(hObject,'String')) returns contents of tdot2 as a double
theta_dot2 = get(handles.tdot2,'string');
assignin('base','theta_dot2',theta_dot2);

% --- Executes during object creation, after setting all properties.
function tdot2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tdot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tdot1_Callback(hObject, eventdata, handles)
% hObject    handle to tdot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tdot1 as text
%        str2double(get(hObject,'String')) returns contents of tdot1 as a double
theta_dot1 = get(handles.tdot1,'string');
assignin('base','theta_dot1',theta_dot1);

% --- Executes during object creation, after setting all properties.
function tdot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tdot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tspan_Callback(hObject, eventdata, handles)
% hObject    handle to tspan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tspan as text
%        str2double(get(hObject,'String')) returns contents of tspan as a double
timespan = get(handles.timespan,'string');
assignin('base','timespan',timespan);

% --- Executes during object creation, after setting all properties.
function tspan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tspan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in integrate.
function integrate_Callback(hObject, eventdata, handles)
theta1 = str2num(get(handles.theta1,'string')); %theta1
theta1 = theta1*(pi/180);
theta2 = str2num(get(handles.theta2,'string')); %theta2
theta2 = theta2*(pi/180);
theta_dot1 = str2num(get(handles.tdot1,'string')); %thetad1
theta_dot2 = str2num(get(handles.tdot2,'string')); %thetad2
l1 = str2num(get(handles.l1,'string')); %l1
l2 = str2num(get(handles.l2,'string')); %l2
m1 = str2num(get(handles.m1,'string')); %m1
m2 = str2num(get(handles.m2,'string')); %m2
tspan = str2num(get(handles.tspan,'string')); %timespa
% First check for empty slides
empty1=0;empty2=0;empty3=0;empty4=0;empty5=0;empty6=0;
empty7=0;empty8=0;empty9=0;

if isempty(theta1) == 1;
    empty1 = 1;
end
if isempty(theta2) == 1;
    empty2=1;
end
if isempty(theta_dot1) == 1;
    empty3 =1;
end
if isempty(theta_dot2) == 1;
    empty4 =1;
end
if isempty(l1) == 1;
    empty5 =1;
end
if isempty(l2) == 1;
    empty6 =1;
end
if isempty(m1) == 1;
    empty7 =1;
end
if isempty(m2) == 1;
    empty8 =1;
end
if isempty(tspan) == 1;
    empty9 =1;
end

emptymat = [empty1,empty2,empty3,empty4,empty5,empty6,empty7,empty8,empty9];
 
zer = find(emptymat==1); %Find which ones are empty

if zer==1
error = sprintf('"Enter a Theta 1 value"');
set(handles.disp, 'String', error);
elseif zer==2
error = sprintf('"Enter a Theta 2 Value"');
set(handles.disp, 'String', error);
elseif zer==3
error = sprintf('"Enter a Angular Velocity 1 Value"');
set(handles.disp, 'String', error);
elseif zer==4
error = sprintf('"Enter a Angular Velocity 2 Value"');
set(handles.disp, 'String', error);
elseif zer==5
error = sprintf('"Enter a l1 Value"');
set(handles.disp, 'String', error);
elseif zer==6
error = sprintf('"Enter a l2 Value"');
set(handles.disp, 'String', error);
elseif zer==7
error = sprintf('"Enter a m1 Value"');
set(handles.disp, 'String', error);
elseif zer==8
error = sprintf('"Enter a m2 Value"');
set(handles.disp, 'String', error);
elseif zer==9
error = sprintf('"Enter a timespan"');
set(handles.disp, 'String', error);
elseif length(zer>1)
error = sprintf('"Enter the Values Above First!"');
set(handles.disp, 'String', error);
else
%% Else run the ode 
 % dis = sprintf('Integrating...');
 % set(handles.disp, 'String',dis);
% Intial conditions
y0 = [theta1 theta_dot1 theta2 theta_dot2];

%% Call ode45
%[t,y] = simulate_pendulum(tspan,y0,l1,l2,m1,m2)
[t,y] = simulate_pendulum(tspan,y0,1,2,1,2);
setappdata(0,'t',t);
setappdata(0,'y',y);

pause(1)
%dis = sprintf('DONE!');
%set(handles.disp, 'String',dis);
set(handles.pt1vt,'Enable','on');
set(handles.pt1vt,'BackgroundColor','blue'); 
set(handles.pt2vt,'Enable','on');
set(handles.pt2vt,'BackgroundColor','blue'); 
set(handles.pzvx,'Enable','on');
set(handles.pzvx,'BackgroundColor','blue');
end

% --- Executes on button press in pt1vt.
function pt1vt_Callback(hObject, eventdata, handles)
% hObject    handle to pt1vt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(0,'t');
y = getappdata(0,'y');
axes(handles.t1vt);
plot(t,y(:,1),'LineWidth',2);
set(gca,'fontsize',4,'fontweight','bold');
grid on
grid minor
xlabel('Time [s]')
ylabel('\theta_{1} [rads]')
title('\theta_{1} vs Time')
set(gca,'fontsize',8,'fontweight','bold')

% --- Executes on button press in pt2vt.
function pt2vt_Callback(hObject, eventdata, handles)
% hObject    handle to pt2vt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(0,'t');
y = getappdata(0,'y');
axes(handles.t2vt);
plot(t,y(:,2),'LineWidth',2);
set(gca,'fontsize',4,'fontweight','bold')
grid on
grid minor
xlabel('Time [s]')
ylabel('\theta_{2} [rads]')
title('\theta_{2} vs Time')
set(gca,'fontsize',8,'fontweight','bold')

% --- Executes on button press in pzvx.
function pzvx_Callback(hObject, eventdata, handles)
% hObject    handle to pzvx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta1 = str2num(get(handles.theta1,'string')); %theta1
theta1 = theta1*(pi/180);
theta2 = str2num(get(handles.theta2,'string')); %theta1
theta2 = theta2*(pi/180);
theta_dot1 = str2num(get(handles.tdot1,'string')); %thetad1
theta_dot2 = str2num(get(handles.tdot2,'string')); %thetad2
l1 = str2num(get(handles.l1,'string')); %l1
l2 = str2num(get(handles.l2,'string')); %l2
m1 = str2num(get(handles.m1,'string')); %m1
m2 = str2num(get(handles.m2,'string')); %m2
tspan = str2num(get(handles.tspan,'string')); %timespan
t = getappdata(0,'t');
y = getappdata(0,'y');
x1 = l1*sin(y(:,1));
z1 = -l1*cos(y(:,1));
x2 = l1*sin(y(:,1))+l2*sin(y(:,3));
z2 = -l1*cos(y(:,1))-l2*cos(y(:,3));

% Plot z1, z2 vs. x1, x2
axes(handles.xvz);
plot(x1,z1);
hold on
plot(x2,z2);
hold off
xlabel('x-position [m]');
grid on
grid minor
ylabel('z-position [m]');
title('z vs. x')
legend('Pendulum 1','Pendulum 2','Location','northeastoutside')

% --- Executes on button press in clearplot.
function clearplot_Callback(hObject, eventdata, handles)
% hObject    handle to clearplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.t1vt);
cla reset
axes(handles.t2vt);
cla reset
axes(handles.xvz);
cla reset

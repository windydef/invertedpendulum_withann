unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TATools, TAGraph, TASeries,
  TAFuncSeries, TAMultiSeries, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, EditBtn, ComCtrls, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries1: TLineSeries;
    Chart5: TChart;
    Chart5LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure plot;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure inisialisasiarray;
    procedure rungekutta;
    procedure ANN;
    procedure INISIALISASIAWAL;
  private

  public

  end;

const
  h=0.02;
  g=9.8;
  phi= 3.14;

var
  Form1: TForm1;
  teta,teta_rad,tetadot,x,v,alpha:extended;// declare untuk rungekutta dan konstanta sigmoid
  l,mbenda,mtongkat,gain:integer;//delcare untuk varibel pada lingkungan
  a,b,c,d,F,flama,error,errorMSE:extended;
  m,n,o,p,iterasi:integer; //declare untuk ANN
  miu:extended; //declare untuk Miu pengupdate beban
  input:array of extended;//input ANN dan treshold
  //w1,w2,w3,wt1,wt2,wt3:array of array of extended; //beban ANN
  //v1,v2,v3,y1,y2,y3,g1,g2,g3,delta1,delta2,delta3:array of extended; // v,y,delta,g ANN
  tetadt,xdt,dx,dteta:extended;
  w1,w2: array of array of extended;
  w3,v1,v2,xo1,xo2,we_3,w_e2,w_e3,g1,g2,e1,e2,th1,th2:array of extended;
  v3,xo3,g3,e3,th3:extended;
  errorbaru,ierror,derror,sudut,dsudut,isudut:extended;

implementation

{$R *.frm}

{ TForm1 }



procedure TForm1.FormCreate(Sender: TObject);
begin
   timer1.Enabled:= false;
   timer2.Enabled:= false;
  l:=strtoint(edit1.text);
  mbenda:=strtoint(edit2.Text);
  mtongkat:=strtoint(edit3.Text);
  teta:=strtofloat(edit4.Text);
  alpha:=strtofloat(edit6.Text);
  gain:=strtoint(edit5.Text);
  a:=-(3*mtongkat*g)/(0.5*l*(mtongkat+4*mbenda));
  b:=4/(0.5*l*(mtongkat+4*mbenda));
  c:=(3*g*(mbenda+mtongkat))/(0.5*l*(mtongkat+4*mbenda));
  d:=(-3*g)/(0.5*l*(mtongkat+4*mbenda));
  F:=0;
  x:=0;
  chart1lineseries1.addXY(0,0);
  chart1lineseries3.AddXY(0,1);
  chart1lineseries3.AddXY(0,1+l);
  chart1lineseries2.AddXY(-1,-1);
  chart1lineseries2.AddXY(1,-1);
end;


procedure Tform1.INISIALISASIAWAL;
begin
  edit4.Text:=inttostr(trackbar1.position);
  //teta:=trackbar1.position;
  l:=strtoint(edit1.text);
  mbenda:=strtoint(edit2.Text);
  mtongkat:=strtoint(edit3.Text);
  teta:=trackbar1.position*pi/180;
  alpha:=strtofloat(edit6.Text);
  gain:=strtoint(edit5.Text);
  a:=-(3*mtongkat*g)/(0.5*l*(mtongkat+4*mbenda));
  b:=4/(0.5*l*(mtongkat+4*mbenda));
  c:=(3*g*(mbenda+mtongkat))/(0.5*l*(mtongkat+4*mbenda));
  d:=(-3*g)/(0.5*l*(mtongkat+4*mbenda));
  x:= 0;
  F:=0;

  m:=3;    //input awal
  n:= 10;  //hidden layer
  o:= 10;  //hidden layer
  p:=1;    //output

  miu:=0.5;
  tetadot:=0;
  xdt:=0;
  dx:=0;
  tetadt:=0;
  inisialisasiarray;
  error:=0-teta;
  {errorMSE:=1/2*(sqr(error));
  input[1]:=errorMSE;
  input[2]:=0;
  input[3]:=0;}
  plot;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 l:=strtoint(edit1.text);
  mbenda:=strtoint(edit2.Text);
  mtongkat:=strtoint(edit3.Text);
  teta:=strtofloat(edit4.Text)*pi/180;
  alpha:=strtofloat(edit6.Text);
  gain:=strtoint(edit5.Text);
  a:=-(3*mtongkat*g)/(0.5*l*(mtongkat+4*mbenda));
  b:=4/(0.5*l*(mtongkat+4*mbenda));
  c:=(3*g*(mbenda+mtongkat))/(0.5*l*(mtongkat+4*mbenda));
  d:=(-3*g)/(0.5*l*(mtongkat+4*mbenda));
  F:=0;

  m:=3;
  n:=10;
  o:=10;
  p:=1;

  miu:=0.5;
  tetadot:=0;
  xdt:=0;
  dx:=0;
  tetadt:=0;
  inisialisasiarray;
  error:=0-teta;
  plot;
end;

procedure TForm1.Button2Click(Sender: TObject);
  begin
  edit7.Clear;
  chart2lineseries1.Clear;
  chart3lineseries1.Clear;
  chart4lineseries1.Clear;
 if button2.Caption='Start PID' then
  begin
    {button2.Caption:= 'Stop PID';
    if checkbox1.Checked= true then begin
    checkbox2.Checked:= false;
    f:= 0;
   timer1.Enabled:= true;
   //application.ProcessMessages;
  end;
  end else begin
  if checkbox2.Checked= true then begin
   checkbox1.Checked:= false;
    timer2.Enabled:= true;
  end else
  if button2.Caption= 'Stop PID' then begin
  button2.Caption :='Start PID';
  timer1.Enabled:= false;
  timer2.Enabled:= false;
  end;
  end; }
     button2.Caption:='Stop PID';
   end
   else begin
    button2.Caption:='Start PID';
    end;
   //repeat
  if checkbox1.Checked= true then begin
    checkbox2.Checked:= false;
    f:= 0;
   timer1.Enabled:= true;
   //application.ProcessMessages;
  end;

  if checkbox2.Checked= true then begin
   checkbox1.Checked:= false;
    timer2.Enabled:= true;
    //application.ProcessMessages;
  end;
    //application.ProcessMessages;
   //until button2.Caption='Start PID';
   end;
  //end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  timer1.Enabled:= false;
  timer2.Enabled:= false;
end;


procedure tform1.plot;
var
  xp,yp:extended;
begin
  chart1lineseries1.Clear;
  chart1lineseries2.Clear;
  chart1lineseries3.Clear;

  if x>10 then x:=-10;
  if x<-10 then x:=10;

   xp:=l*sin(teta);//x=r*sin(teta)
   yp:=l*cos(teta);//y=r*cos(teta)
   chart1lineseries1.addXY(x,0); //badan
   chart1lineseries3.AddXY(x,1);  //tongkat
   chart1lineseries3.AddXY(xp+x,1+yp);
   chart1lineseries2.AddXY(x-1,-1);  //roda
   chart1lineseries2.AddXY(x+1,-1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  rungekutta;
  plot;
  iterasi:= iterasi +1;
  chart2lineseries1.addxy(iterasi,error);
  chart3lineseries1.addxy(iterasi,ierror);
  chart4lineseries1.addxy(iterasi,derror);
  chart5lineseries1.AddXY(iterasi, xo3 * gain);
  chart6lineseries1.AddXY(iterasi, x);
  edit7.Text:= inttostr(iterasi);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   ANN;
    rungekutta;
    plot;
    iterasi:= iterasi +1;
          chart2lineseries1.addxy(iterasi,error);
          chart3lineseries1.addxy(iterasi,ierror);
          chart4lineseries1.addxy(iterasi,derror);
          chart5lineseries1.AddXY(iterasi, f+(xo3 * gain));
          chart6lineseries1.AddXY(iterasi, x);
          edit7.Text:= inttostr(iterasi);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  INISIALISASIAWAL;
end;

procedure tform1.inisialisasiarray;
var i,j:integer;
begin
  setlength(input,m+1);
  setlength(w1,m+1,n+1);
  setlength(w2,n+1,o+1);
  setlength(w3,o+1);
  setlength(v1,n+1);
  setlength(v2,o+1);
  setlength(xo1,n+1);
  setlength(xo2,o+1);
  setlength(w_e3,o+1);
  setlength(w_e2,n+1);
  setlength(g1,n+1);
  setlength(g2,o+1);
  setlength(e2,o+1);
  setlength(e1,n+1);
  setlength(e2,o+1);
  setlength(th1,n+1);
  setlength(th2,o+1);
  for i:=1 to m do
	begin
	  for j:=1 to n do
    begin
			w1[i,j] := random;
    end;
  end;

  for i:=1 to n do
	begin
	  for j:=1 to o do
    begin
			w2[i,j] := random;
    end;
  end;

  for i:=1 to o do
	begin
		w3[i] := random;
  end;

  for i := 1 to n do
  begin
    th1[i]:=randg(0,0.01);
  end;
  for i := 1 to o do
  begin
    th2[o]:=randg(0,0.01);
  end;
  th3:=randg(0,0.01);
end;


procedure tform1.rungekutta;
var
  kt1,kt2,kt3,kt4:extended;
begin
      if checkbox1.Checked= true then teta:= phi - teta;
      kt1:=h/2*((-c*teta)-d*f);
      kt2:=h/2*((-c*(teta+h/2*(tetadt+kt1/2))-d*(f+h/2)));
      kt3:=h/2*((-c*(teta+h/2*(tetadt+kt1/2))-d*(f+h/2)));
      kt4:=h/2*((-c*(teta+h*(tetadt+kt3))-d*(f+h)));
      tetadt:=tetadt+(kt1+2*kt2+2*kt3+kt4)/3;
      teta:=teta+h*(tetadt+(kt1+kt2+kt3)/3);
      kt1:=h/2*((-a*teta)-(b*f));
      kt2:=h/2*((-a*teta)-(b*f));
      kt3:=h/2*((-a*teta)-(b*f));
      kt4:=h/2*((-a*teta)-(b*f));
      x:=x+h*(xdt+(kt1+kt2+kt3)/3);
      xdt:=xdt+(kt1+(2*kt2)+(2*kt3)+kt4)/3;

    if checkbox1.Checked= true then teta:= phi - teta;
       //grafikerror;
    errorbaru :=error;                // <------ ERROR
    error  := 0-teta;
  	  ierror := (error-errorbaru);
  	  derror := error+errorbaru;

  	  sudut :=error*180 / phi;
  	  dsudut:=derror*180 / phi;
  	  isudut:=ierror*180 / phi;
      //3 input awal-----------------
  	  input[1]:=sudut;
  	  input[2]:=dsudut;
  	  input[3]:=isudut;
end;


procedure tform1.ANN;
var
i,j:integer;
temp: extended;
begin
  errorbaru:=0-teta;
  errorMSE:=1/2*(sqr(error));
  //errorbaruMSE:=1/2*(sqr(errorbaru));
  input[1]:=errorbaru;
  input[2]:=errorbaru+error;
  input[3]:=errorbaru-error;
  error:=errorbaru;
  //akhir training
  for i:=1 to n do //satu
	begin
		v1[i]:=0;
		for j:=1 to m do
		begin
			v1[i]:= v1[i] + w1[j,i]*input[j]
		end;
    //v1[i]:=v1[i]+th1[i];
		xo1[i]:= (1-exp((-2*alpha)*v1[i]))/(1+exp((-2*alpha)*v1[i])); // out 1
		g1[i]:= alpha*(1+xo1[i])*(1-xo1[i]);  // turunan
		end;

	for i:=1 to o do // dua
	begin
		v2[i]:=0;
		for j:=1 to n do
		begin
			v2[i]:= v2[i] + w2[j,i]*xo1[j]
		end;
    //v2[i]:=v2[i]+th2[i];
		xo2[i]:= (1-exp((-2*alpha)*v2[i]))/(1+exp((-2*alpha)*v2[i])); // output
		g2[i]:= alpha*(1+xo2[i])*(1-xo2[i]);  // turunan
	end;

	v3:=0;            //tiga
	temp:=0;
	for j:=1 to o do
	begin
		v3:= v3 + w3[j]*xo2[j]
	end;
  //v3:=v3+th3;
  xo3:= (1-exp((-2*alpha)*v3))/(1+exp((-2*alpha)*v3)); // output
	g3:= alpha*(1+xo3)*(1-xo3);  // turunan
  flama:= xo3*gain;
  f:= flama + (xo3*gain);
	e3:=error*g3*(5*h*d/6)+(0.5*h*h*c*d)+(h*h*h*c*c*c*d/6)+(h*h*h*h*c*c*c*d/24); //error

	//mulai BackProp
	for i:=1 to o do
	begin
		e2[i] := e3*w3[i]*g2[i];
	end;

	for i:=1 to n do
	begin
		w_e2[i]:=0;
		for j:=1 to o do
		begin
			w_e2[i] := w_e2[i] + w2[i][j]*e2[j];
		end;
		e1[i] := w_e2[i]*g1[i]
	end;

  //update weight
	for i:=1 to o do //     <-- update 3
	begin
		w3[i]:= w3[i]+miu*e3*xo2[i];
	end;

	for i:=1 to n do      //     <-- update 2
	begin
		for j:=1 to o do
		begin
			w2[i][j]:= w2[i][j]+miu*e2[j]*xo1[i];
		end;
	end;

	for i:=1 to m do     //     <-- update 1
	begin
		for j:=1 to n do
		begin
			w1[i][j]:= w1[i][j]+miu*e1[j]*input[i];
		end;
	end;
end;



end.

object Form1: TForm1
  Left = 286
  Height = 690
  Top = 195
  Width = 893
  Caption = 'Form1'
  ClientHeight = 690
  ClientWidth = 893
  Color = clWhite
  OnCreate = FormCreate
  LCLVersion = '6.3'
  object TrackBar1: TTrackBar
    Left = 232
    Height = 25
    Top = 376
    Width = 624
    Max = 180
    Min = -180
    OnChange = TrackBar1Change
    Position = 0
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 128
    Height = 23
    Top = 40
    Width = 80
    TabOrder = 1
    Text = '2'
  end
  object Edit2: TEdit
    Left = 128
    Height = 23
    Top = 80
    Width = 80
    TabOrder = 2
    Text = '8'
  end
  object Chart1: TChart
    Left = 232
    Height = 312
    Top = 40
    Width = 624
    AxisList = <    
      item
        Grid.Visible = False
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Grid.Visible = False
        Alignment = calBottom
        Minors = <>
      end>
    BackColor = clWhite
    Extent.UseXMax = True
    Extent.UseXMin = True
    Extent.UseYMax = True
    Extent.UseYMin = True
    Extent.XMax = 10
    Extent.XMin = -10
    Extent.YMax = 5
    Extent.YMin = -5
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.Color = clBlue
    Title.Text.Strings = (
      'TAChart'
    )
    Color = clWhite
    object Chart1LineSeries1: TLineSeries
      LinePen.Color = clNone
      LineType = ltFromOrigin
      Pointer.Brush.Color = clMenuHighlight
      Pointer.HorizSize = 50
      Pointer.VertSize = 25
      ShowPoints = True
    end
    object Chart1LineSeries2: TLineSeries
      LinePen.Color = clForm
      Pointer.Brush.Color = clFuchsia
      Pointer.HorizSize = 8
      Pointer.Style = psCircle
      Pointer.VertSize = 8
      ShowPoints = True
    end
    object Chart1LineSeries3: TLineSeries
      LinePen.Color = clRed
      LinePen.Width = 4
      Pointer.Brush.Color = clYellow
      ShowPoints = True
    end
  end
  object Edit3: TEdit
    Left = 128
    Height = 23
    Top = 120
    Width = 80
    TabOrder = 4
    Text = '1'
  end
  object Edit4: TEdit
    Left = 128
    Height = 23
    Top = 160
    Width = 80
    TabOrder = 5
    Text = '0'
  end
  object Edit5: TEdit
    Left = 128
    Height = 23
    Top = 200
    Width = 80
    TabOrder = 6
    Text = '10'
  end
  object Edit6: TEdit
    Left = 128
    Height = 23
    Top = 240
    Width = 80
    TabOrder = 7
    Text = '2'
  end
  object Label1: TLabel
    Left = 24
    Height = 15
    Top = 46
    Width = 90
    Caption = 'Panjang tongkat:'
    ParentColor = False
  end
  object Label2: TLabel
    Left = 24
    Height = 15
    Top = 88
    Width = 72
    Caption = 'Massa benda:'
    ParentColor = False
  end
  object Label3: TLabel
    Left = 24
    Height = 15
    Top = 128
    Width = 80
    Caption = 'Massa tongkat:'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 24
    Height = 15
    Top = 168
    Width = 25
    Caption = 'Teta:'
    ParentColor = False
  end
  object Label5: TLabel
    Left = 24
    Height = 15
    Top = 208
    Width = 34
    Caption = 'Alpha:'
    ParentColor = False
  end
  object Label6: TLabel
    Left = 24
    Height = 15
    Top = 248
    Width = 27
    Caption = 'Gain:'
    ParentColor = False
  end
  object Label7: TLabel
    Left = 232
    Height = 26
    Top = 8
    Width = 500
    Caption = 'INVERTED PENDULUM WITH ANN AND PID CONTROL'
    Font.CharSet = SHIFTJIS_CHARSET
    Font.Height = -21
    Font.Name = '@Adobe Fan Heiti Std B'
    Font.Pitch = fpVariable
    Font.Quality = fqDraft
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object CheckBox1: TCheckBox
    Left = 376
    Height = 19
    Top = 352
    Width = 84
    Caption = 'Without PID'
    TabOrder = 8
  end
  object CheckBox2: TCheckBox
    Left = 640
    Height = 19
    Top = 352
    Width = 66
    Caption = 'With PID'
    TabOrder = 9
  end
  object Chart2: TChart
    Left = 24
    Height = 144
    Top = 408
    Width = 268
    AxisList = <    
      item
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Alignment = calBottom
        Minors = <>
        Title.Visible = True
        Title.Caption = 'iteration'
      end>
    BackColor = clInactiveBorder
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.CharSet = SHIFTJIS_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = '@Adobe Fan Heiti Std B'
    Title.Font.Pitch = fpVariable
    Title.Font.Quality = fqDraft
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Proportional Error'
    )
    Title.Visible = True
    Color = clWhite
    object Chart2LineSeries1: TLineSeries
      LinePen.Color = clRed
    end
  end
  object Chart3: TChart
    Left = 312
    Height = 144
    Top = 408
    Width = 272
    AxisList = <    
      item
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Alignment = calBottom
        Minors = <>
        Title.Visible = True
        Title.Caption = 'iteration'
      end>
    BackColor = clInactiveBorder
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.CharSet = SHIFTJIS_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = '@Adobe Fan Heiti Std B'
    Title.Font.Pitch = fpVariable
    Title.Font.Quality = fqDraft
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Integration Error'
    )
    Title.Visible = True
    Color = clWhite
    object Chart3LineSeries1: TLineSeries
      LinePen.Color = clBlue
    end
  end
  object Chart4: TChart
    Left = 608
    Height = 144
    Top = 408
    Width = 264
    AxisList = <    
      item
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Alignment = calBottom
        Minors = <>
        Title.Visible = True
        Title.Caption = 'iteration'
      end>
    BackColor = clInactiveBorder
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.CharSet = SHIFTJIS_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = '@Adobe Fan Heiti Std B'
    Title.Font.Pitch = fpVariable
    Title.Font.Quality = fqDraft
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Derivative Error'
    )
    Title.Visible = True
    Color = clWhite
    object Chart4LineSeries1: TLineSeries
      LinePen.Color = clFuchsia
    end
  end
  object Button1: TButton
    Left = 128
    Height = 25
    Top = 280
    Width = 80
    Caption = 'Set'
    OnClick = Button1Click
    TabOrder = 13
  end
  object Button2: TButton
    Left = 128
    Height = 50
    Top = 312
    Width = 80
    Caption = 'START'
    OnClick = Button2Click
    TabOrder = 14
  end
  object Button3: TButton
    Left = 32
    Height = 49
    Top = 312
    Width = 75
    Caption = 'STOP'
    OnClick = Button3Click
    TabOrder = 15
  end
  object Edit7: TEdit
    Left = 128
    Height = 23
    Top = 376
    Width = 80
    TabOrder = 16
  end
  object Label8: TLabel
    Left = 80
    Height = 15
    Top = 384
    Width = 47
    Caption = 'Iteration:'
    ParentColor = False
  end
  object Chart5: TChart
    Left = 32
    Height = 136
    Top = 554
    Width = 378
    AxisList = <    
      item
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Alignment = calBottom
        Minors = <>
      end>
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.Color = clBlue
    Title.Text.Strings = (
      'Gaya (F)'
    )
    Title.Visible = True
    Color = clWhite
    object Chart5LineSeries1: TLineSeries
    end
  end
  object Chart6: TChart
    Left = 448
    Height = 128
    Top = 554
    Width = 392
    AxisList = <    
      item
        Minors = <>
        Title.LabelFont.Orientation = 900
      end    
      item
        Alignment = calBottom
        Minors = <>
      end>
    Foot.Brush.Color = clBtnFace
    Foot.Font.Color = clBlue
    Title.Brush.Color = clBtnFace
    Title.Font.Color = clBlue
    Title.Text.Strings = (
      'Jarak (m)'
    )
    Title.Visible = True
    Color = clWhite
    object Chart6LineSeries1: TLineSeries
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 48
    Top = 8
  end
end

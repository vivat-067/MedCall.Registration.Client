inherited fraMap: TfraMap
  Width = 932
  Height = 677
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 932
    Height = 574
    object webBrowser: TEdgeBrowser [0]
      Left = 284
      Top = 17
      Width = 715
      Height = 274
      TabOrder = 1
      OnCreateWebViewCompleted = webBrowserCreateWebViewCompleted
      OnNavigationCompleted = webBrowserNavigationCompleted
      OnWebMessageReceived = webBrowserWebMessageReceived
    end
    object grNotifications: TcxGrid [1]
      Left = 892
      Top = 340
      Width = 97
      Height = 200
      TabOrder = 8
      object gvNotifications: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object gvNotificationsColumn1: TcxGridColumn
          Caption = #1044#1072#1090#1072
          Width = 96
        end
        object gvNotificationsColumn2: TcxGridColumn
          Caption = #1042#1088#1077#1084#1103
          Width = 70
        end
        object gvNotificationsColumn3: TcxGridColumn
          Caption = #1042#1080#1076
          Width = 63
        end
        object gvNotificationsColumn4: TcxGridColumn
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 415
        end
      end
      object glNotifications: TcxGridLevel
        GridView = gvNotifications
      end
    end
    object memChat: TcxMemo [2]
      Left = 570
      Top = 340
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Height = 200
      Width = 300
    end
    object nbMain: TdxNavBar [3]
      Left = 58
      Top = 18
      Width = 215
      Height = 521
      ActiveGroupIndex = 0
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      View = 21
      ViewStyle.SkinName = 'Office2019Colorful'
      ViewStyle.SkinNameAssigned = True
      OptionsBehavior.Common.AllowChildGroups = True
      OptionsBehavior.Common.AllowExpandAnimation = True
      OptionsBehavior.Common.AllowSelectLinks = True
      OptionsBehavior.Common.DragDropFlags = []
      OptionsBehavior.Common.EachGroupHasSelectedLink = True
      OptionsImage.SmallImages = dmResources.ilNavBar24
      object nbgSMP: TdxNavBarGroup
        Caption = #1057#1052#1055
        Hint = #1042#1099#1079#1086#1074' '#1057#1052#1055
        LargeImageIndex = 0
        SelectedLinkIndex = -1
        SmallImageIndex = 16
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = nbiCommunication
            Position = 0
          end
          item
            Item = nbiLocateOnMap
            Position = 1
          end>
        ParentGroupIndex = -1
        Position = 0
      end
      object nbgPND: TdxNavBarGroup
        Caption = #1055#1053#1044
        Hint = #1055#1086#1084#1086#1097#1100' '#1085#1072' '#1076#1086#1084#1091
        LargeImageIndex = 1
        SelectedLinkIndex = -1
        SmallImageIndex = 2
        TopVisibleLinkIndex = 0
        Links = <>
        ParentGroupIndex = -1
        Position = 1
      end
      object nbgSettings: TdxNavBarGroup
        Align = vaBottom
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
        SelectedLinkIndex = -1
        SmallImageIndex = 15
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = nbiOptions
            Position = 0
          end>
        ParentGroupIndex = -1
        Position = 2
      end
      object nbgFilter: TdxNavBarGroup
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1085#1072' '#1082#1072#1088#1090#1077
        SelectedLinkIndex = -1
        ShowCaption = False
        SmallImageIndex = 17
        TopVisibleLinkIndex = 0
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        OptionsExpansion.ShowExpandButton = False
        Links = <>
        ParentGroupIndex = 0
        Position = 2
      end
      object nbiCommunication: TdxNavBarItem
        Caption = #1057#1074#1103#1079#1100' '#1089' '#1073#1088#1080#1075#1072#1076#1086#1081
        SmallImageIndex = 0
        OnClick = nbiCommunicationClick
      end
      object nbiLocateOnMap: TdxNavBarItem
        Caption = #1053#1072#1081#1090#1080' '#1085#1072' '#1082#1072#1088#1090#1077
        SmallImageIndex = 4
        OnClick = nbiLocateOnMapClick
      end
      object nbiOptions: TdxNavBarItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        SmallImageIndex = 15
        Visible = False
        OnClick = nbiOptionsClick
      end
      object nbgFilterControl: TdxNavBarGroupControl
        Left = 1
        Top = 132
        Width = 213
        Height = 197
        TabOrder = 0
        UseStyle = True
        GroupIndex = 3
        OriginalHeight = 197
        object dxLayoutControl3: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 213
          Height = 197
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = True
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OptionsImage.Images = dmResources.ilNavBar24
          object chkNoConnection: TcxCheckBox
            Tag = 5
            Left = 17
            Top = 167
            Caption = #1041#1077#1079' '#1089#1074#1103#1079#1080
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            StyleFocused.TextColor = clWindowText
            TabOrder = 4
            Transparent = True
            OnClick = chkStatusFilterClick
          end
          object chkWorking: TcxCheckBox
            Tag = 4
            Left = 17
            Top = 138
            Caption = #1042' '#1088#1072#1073#1086#1090#1077
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 3
            Transparent = True
            OnClick = chkStatusFilterClick
          end
          object chkArrived: TcxCheckBox
            Tag = 3
            Left = 17
            Top = 109
            Caption = #1055#1088#1080#1073#1099#1083#1072
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 2
            Transparent = True
            OnClick = chkStatusFilterClick
          end
          object chkConfirming: TcxCheckBox
            Tag = 2
            Left = 17
            Top = 80
            Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1074#1099#1079#1086#1074#1072
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            StyleFocused.TextColor = clWindow
            TabOrder = 1
            Transparent = True
            OnClick = chkStatusFilterClick
          end
          object chkAvailable: TcxCheckBox
            Tag = 1
            Left = 17
            Top = 51
            Caption = #1057#1074#1086#1073#1086#1076#1085#1072
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindow
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            StyleFocused.TextColor = clWindowText
            TabOrder = 0
            Transparent = True
            OnClick = chkStatusFilterClick
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            AlignHorz = ahClient
            AlignVert = avClient
            LayoutLookAndFeel = dmResources.dxLayoutCxLookAndFeelNavy
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem2: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Text = #1057#1074#1086#1073#1086#1076#1085#1072
            CaptionOptions.Visible = False
            Control = chkNoConnection
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 89
            ControlOptions.ShowBorder = False
            Index = 5
          end
          object dxLayoutItem4: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Visible = False
            Control = chkWorking
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 66
            ControlOptions.ShowBorder = False
            Index = 4
          end
          object dxLayoutItem5: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Visible = False
            Control = chkArrived
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object dxLayoutItem6: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Visible = False
            Control = chkConfirming
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object dxLayoutItem7: TdxLayoutItem
            Tag = 1
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Visible = False
            Control = chkAvailable
            ControlOptions.OriginalHeight = 19
            ControlOptions.OriginalWidth = 121
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLayoutLabeledItem1: TdxLayoutLabeledItem
            Parent = dxLayoutControl3Group_Root
            CaptionOptions.Glyph.SourceDPI = 96
            CaptionOptions.Glyph.SourceHeight = 24
            CaptionOptions.Glyph.SourceWidth = 24
            CaptionOptions.Glyph.Data = {
              3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
              462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
              61796572312220786D6C6E733D22687474703A2F2F7777772E77332E6F72672F
              323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777
              772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D22
              307078222076696577426F783D2230203020333220333222207374796C653D22
              656E61626C652D6261636B67726F756E643A6E6577203020302033322033323B
              2220786D6C3A73706163653D227072657365727665223E262331333B26233130
              3B20203C7374796C6520747970653D22746578742F6373732220786D6C3A7370
              6163653D227072657365727665223E2E5768697465262331333B262331303B20
              2020207B262331333B262331303B20202020202066696C6C3A23464646464646
              3B262331333B262331303B202020202020666F6E742D66616D696C793A266170
              6F733B64782D666F6E742D69636F6E732661706F733B3B262331333B26233130
              3B202020202020666F6E742D73697A653A333270783B262331333B262331303B
              202020207D262331333B262331303B20203C2F7374796C653E0D0A3C74657874
              20783D22302220793D2233322220636C6173733D225768697465223EEE9C9C3C
              2F746578743E0D0A3C2F7376673E0D0A}
            CaptionOptions.Text = #1057#1090#1072#1090#1091#1089
            CaptionOptions.VisibleElements = [cveImage]
            Index = 0
          end
        end
      end
    end
    object edBrigadeNumber: TcxTextEdit [4]
      Left = 370
      Top = 348
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Height = 23
      Width = 180
    end
    object edBrigadeStatus: TcxTextEdit [5]
      Left = 370
      Top = 381
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Height = 23
      Width = 180
    end
    object edBrigadeDoctor: TcxTextEdit [6]
      Left = 370
      Top = 414
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Height = 23
      Width = 180
    end
    object edBrigadeParaMedic: TcxTextEdit [7]
      Left = 370
      Top = 447
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Height = 23
      Width = 180
    end
    object edBrigadeDriver: TcxTextEdit [8]
      Left = 370
      Top = 480
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Height = 23
      Width = 180
    end
    inherited dxLayoutControl1Group_Root: TdxLayoutGroup
      ItemIndex = 2
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      ItemIndex = 1
      Index = 2
    end
    inherited lgBackButton: TdxLayoutGroup
      Visible = False
    end
    inherited liiBackButton: TdxLayoutImageItem
      Visible = False
    end
    object liWebBrowser: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Layout = clTop
      Control = webBrowser
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liNotifications: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      CaptionOptions.Layout = clTop
      Control = grNotifications
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liChat: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #1063#1072#1090
      CaptionOptions.Layout = clTop
      Control = memChat
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 300
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liNavBar: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      Control = nbMain
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 300
      ControlOptions.OriginalWidth = 215
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lgBottom
      AlignHorz = ahClient
      AlignVert = avClient
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lgBottom: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #1050#1086#1084#1084#1091#1085#1080#1082#1072#1094#1080#1103
      Offsets.Right = 10
      Offsets.Top = 10
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      Padding.Left = 10
      Padding.AssignedValues = [lpavLeft]
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = lgBottom
      AlignHorz = ahLeft
      AlignVert = avCenter
      Offsets.Right = 10
      ItemIndex = 4
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1041#1088#1080#1075#1072#1076#1072':'
      Control = edBrigadeNumber
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liBrigadeStatus: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1090#1072#1090#1091#1089':'
      Control = edBrigadeStatus
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liBrigadeDoctor: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1042#1088#1072#1095':'
      Control = edBrigadeDoctor
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liBrigadeParaMedic: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1060#1077#1083#1100#1076#1096#1077#1088':'
      Control = edBrigadeParaMedic
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object liBrigadeDriver: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1042#1086#1076#1080#1090#1077#1083#1100':'
      Control = edBrigadeDriver
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutSplitterItem1: TdxLayoutSplitterItem
      Parent = dxLayoutGroup1
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      CaptionOptions.Text = 'Splitter'
      Index = 1
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Top = 574
    Width = 932
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 928
      object btnLoadData: TcxButton [0]
        Left = 400
        Top = 17
        Width = 128
        Height = 65
        Action = acFileLoadData
        OptionsImage.Images = dmResources.ilButtons
        OptionsImage.Layout = blGlyphTop
        SpeedButtonOptions.Flat = True
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      inherited dxLayoutGroup4: TdxLayoutGroup
        Index = 1
      end
      object dxLayoutItem1: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        AlignHorz = ahCenter
        AlignVert = avCenter
        CaptionOptions.Visible = False
        Control = btnLoadData
        ControlOptions.OriginalHeight = 65
        ControlOptions.OriginalWidth = 128
        ControlOptions.ShowBorder = False
        Index = 0
      end
    end
  end
  object ActionList1: TActionList
    Images = dmResources.ilButtons
    Left = 793
    Top = 491
    object acFileLoadData: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' ...'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 33
      OnExecute = acFileLoadDataExecute
      OnUpdate = acFileLoadDataUpdate
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 22
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
    end
    object asStatusAssign: TAction
      Caption = #1042#1099#1079#1086#1074
      ImageIndex = 39
    end
    object asRequestCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 42
    end
  end
end

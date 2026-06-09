inherited fraMap: TfraMap
  Width = 932
  Height = 677
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 932
    Height = 574
    object webBrowser: TEdgeBrowser [0]
      Left = 219
      Top = 17
      Width = 696
      Height = 291
      TabOrder = 1
      OnCreateWebViewCompleted = webBrowserCreateWebViewCompleted
      OnNavigationCompleted = webBrowserNavigationCompleted
      OnWebMessageReceived = webBrowserWebMessageReceived
    end
    object grNotifications: TcxGrid [1]
      Left = 651
      Top = 357
      Width = 254
      Height = 200
      TabOrder = 7
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
      Left = 456
      Top = 357
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
      Height = 200
      Width = 185
    end
    object nbMain: TdxNavBar [3]
      Left = 58
      Top = 18
      Width = 150
      Height = 538
      ActiveGroupIndex = 0
      TabOrder = 0
      View = 21
      ViewStyle.SkinName = 'WXICompact'
      ViewStyle.SkinNameAssigned = True
      OptionsImage.SmallImages = dmResources.ilNavBar24
      object nbMainGroup1: TdxNavBarGroup
        Caption = #1057#1052#1055
        Hint = #1042#1099#1079#1086#1074' '#1057#1052#1055
        LargeImageIndex = 0
        SelectedLinkIndex = -1
        SmallImageIndex = 2
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = nbMainItem1
          end
          item
            Item = nbMainItem2
          end>
      end
      object nbMainGroup3: TdxNavBarGroup
        Caption = 'nbMainGroup3'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Visible = False
        OptionsGroupControl.ShowControl = True
        OptionsGroupControl.UseControl = True
        Links = <>
      end
      object nbMainGroup2: TdxNavBarGroup
        Caption = #1055#1053#1044
        Hint = #1055#1086#1084#1086#1097#1100' '#1085#1072' '#1076#1086#1084#1091
        LargeImageIndex = 1
        SelectedLinkIndex = -1
        SmallImageIndex = 5
        TopVisibleLinkIndex = 0
        Links = <>
      end
      object nbMainItem1: TdxNavBarItem
        Caption = #1057#1074#1103#1079#1100' '#1089' '#1073#1088#1080#1075#1072#1076#1086#1081
        SmallImageIndex = 0
      end
      object nbMainItem2: TdxNavBarItem
        Caption = #1053#1072#1081#1090#1080' '#1085#1072' '#1082#1072#1088#1090#1077
        SmallImageIndex = 4
      end
      object nbMainGroup3Control: TdxNavBarGroupControl
        Left = 0
        Top = 0
        Width = 150
        Height = 538
        Caption = 'nbMainGroup3Control'
        TabOrder = 0
        GroupIndex = 1
        OriginalHeight = 41
      end
    end
    object edBrigadeNumber: TcxTextEdit [4]
      Left = 315
      Top = 328
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Height = 23
      Width = 121
    end
    object edBrigadeStatus: TcxTextEdit [5]
      Left = 315
      Top = 361
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Height = 23
      Width = 121
    end
    object cxTextEdit1: TcxTextEdit [6]
      Left = 315
      Top = 394
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Height = 23
      Width = 121
    end
    object edBrigadeParaMedic: TcxTextEdit [7]
      Left = 315
      Top = 427
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Height = 23
      Width = 121
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
      Index = 1
    end
    object liChat: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #1063#1072#1090
      CaptionOptions.Layout = clTop
      Control = memChat
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liNavBar: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      Control = nbMain
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 300
      ControlOptions.OriginalWidth = 150
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
      Offsets.Left = 10
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
      AlignVert = avClient
      Offsets.Right = 10
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1041#1088#1080#1075#1072#1076#1072':'
      Control = edBrigadeNumber
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liBrigadeStatus: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1090#1072#1090#1091#1089':'
      Control = edBrigadeStatus
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liBrigadeDoctor: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1042#1088#1072#1095':'
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liBrigadeParaMedic: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = #1060#1077#1083#1100#1076#1096#1077#1088':'
      Control = edBrigadeParaMedic
      ControlOptions.OriginalHeight = 23
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Top = 574
    Width = 932
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 928
      object btnLoadData: TcxButton [0]
        Left = 409
        Top = 17
        Width = 110
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
        ControlOptions.OriginalWidth = 110
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

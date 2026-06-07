inherited fraMap: TfraMap
  inherited dxLayoutControl1: TdxLayoutControl
    object webBrowser: TEdgeBrowser [0]
      Left = 219
      Top = 46
      Width = 649
      Height = 121
      TabOrder = 1
      OnCreateWebViewCompleted = webBrowserCreateWebViewCompleted
      OnNavigationCompleted = webBrowserNavigationCompleted
      OnWebMessageReceived = webBrowserWebMessageReceived
    end
    object grNotifications: TcxGrid [1]
      Left = 240
      Top = 226
      Width = 607
      Height = 200
      TabOrder = 2
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
      Left = 10000
      Top = 10000
      Lines.Strings = (
        'memChat')
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Visible = False
      Height = 200
      Width = 647
    end
    object nbMain: TdxNavBar [3]
      Left = 58
      Top = 18
      Width = 150
      Height = 428
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
      CaptionOptions.Text = #1050#1072#1088#1090#1072
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
      CaptionOptions.Visible = False
      Control = grNotifications
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liChat: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #1063#1072#1090
      CaptionOptions.Visible = False
      Control = memChat
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
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
      Parent = dxLayoutGroup2
      AlignVert = avBottom
      LayoutDirection = ldTabbed
      ShowBorder = False
      Index = 1
    end
  end
end

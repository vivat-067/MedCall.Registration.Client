object frmMain: TfrmMain
  Left = 20
  Top = 104
  BorderStyle = bsSingle
  Caption = #1052#1077#1076#1042#1099#1079#1086#1074': '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1079#1072#1103#1074#1086#1082' '#1074#1099#1079#1086#1074#1072' '#1057#1052#1055
  ClientHeight = 528
  ClientWidth = 1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object tbMain: TdxTileBar
    Left = 0
    Top = 17
    Width = 1042
    Height = 113
    FocusedItem = tbiCallsLog
    Images = dmResources.ilMainNavigation
    OptionsDetailAnimate.AnimationMode = damScrollFade
    OptionsView.IndentVert = 10
    OptionsView.ItemWidth = 70
    Style.GradientBeginColor = 15263976
    TabOrder = 0
    object tmMainLogGroup: TdxTileControlGroup
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clMedGray
      Caption.Font.Height = -16
      Caption.Font.Name = 'Segoe UI'
      Caption.Font.Style = []
      Caption.Text = #1046#1059#1056#1053#1040#1051
      Index = 0
    end
    object tbMainReportsGroup: TdxTileControlGroup
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clMedGray
      Caption.Font.Height = -16
      Caption.Font.Name = 'Segoe UI'
      Caption.Font.Style = []
      Caption.Text = #1054#1058#1063#1045#1058#1067
      Index = 1
    end
    object tbHiddenItemsGroup: TdxTileControlGroup
      Visible = False
      Index = 2
    end
    object tbMainSetupGroup: TdxTileControlGroup
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clMedGray
      Caption.Font.Height = -16
      Caption.Font.Name = 'Segoe UI'
      Caption.Font.Style = []
      Caption.Text = #1057#1048#1057#1058#1045#1052#1040
      Index = 3
    end
    object tbiCallsLog: TdxTileBarItem
      Tag = 1
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 1
      GroupIndex = 0
      IndexInGroup = 0
      Size = tbisLarge
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1047#1072#1103#1074#1082#1080
      Text4.AssignedValues = []
      OnActivateDetail = tbiMainTileBarActivateDetail
      OnClick = tbiMainTileBarItemClick
    end
    object tbiTasksPrint: TdxTileBarItem
      Tag = 2
      GroupIndex = 0
      IndexInGroup = 1
      Size = tbisRegular
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiBrigades: TdxTileBarItem
      Tag = 3
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 2
      GroupIndex = 0
      IndexInGroup = 2
      Size = tbisLarge
      Style.GradientBeginColor = 2064338
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1041#1088#1080#1075#1072#1076#1099
      Text4.AssignedValues = []
      OnActivateDetail = tbiMainTileBarActivateDetail
      OnClick = tbiMainTileBarItemClick
      PopupOptions.BorderColor = clRed
      PopupOptions.PopupControl = ptcBrigadesView
    end
    object tbiBrigadeEdit: TdxTileBarItem
      Tag = 4
      GroupIndex = 0
      IndexInGroup = 3
      Size = tbisRegular
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiRepordDesigner: TdxTileBarItem
      Tag = 5
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 3
      GroupIndex = 1
      IndexInGroup = 0
      Size = tbisLarge
      Style.GradientBeginColor = 12420127
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
      Text4.AssignedValues = []
    end
    object tbiReportEdit: TdxTileBarItem
      Tag = 6
      GroupIndex = 1
      IndexInGroup = 1
      Size = tbisLarge
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiReportPartners: TdxTileBarItem
      Tag = 7
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 4
      GroupIndex = 1
      IndexInGroup = 2
      Size = tbisLarge
      Style.GradientBeginColor = 5723991
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1055#1072#1088#1090#1085#1077#1088#1099
      Text4.AssignedValues = []
    end
    object tbiCallsLogEdit: TdxTileBarItem
      Tag = 2
      GroupIndex = 1
      IndexInGroup = 3
      Size = tbisLarge
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiReportsPriceLists: TdxTileBarItem
      Tag = 9
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 5
      GroupIndex = 1
      IndexInGroup = 4
      Size = tbisLarge
      Style.GradientBeginColor = 5275989
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090#1099
      Text4.AssignedValues = []
    end
    object tbiSaleView: TdxTileBarItem
      Tag = 10
      GroupIndex = 1
      IndexInGroup = 5
      Size = tbisRegular
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiSalesPrint: TdxTileBarItem
      Tag = 11
      GroupIndex = 1
      IndexInGroup = 6
      Size = tbisLarge
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
    object tbiSystemSetup: TdxTileBarItem
      Tag = 8
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 7
      GroupIndex = 3
      IndexInGroup = 0
      Size = tbisLarge
      Style.GradientBeginColor = 12615808
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Text4.AssignedValues = []
      PopupOptions.PopupControl = ptcSystemSetup
    end
    object tbiMAP: TdxTileBarItem
      Tag = 4
      Glyph.Align = oaTopLeft
      Glyph.ImageIndex = 6
      GroupIndex = 0
      IndexInGroup = 4
      Size = tbisLarge
      Style.GradientBeginColor = clGray
      Text1.AssignedValues = []
      Text2.AssignedValues = []
      Text3.AssignedValues = [avFont]
      Text3.Font.Charset = DEFAULT_CHARSET
      Text3.Font.Color = clDefault
      Text3.Font.Height = -16
      Text3.Font.Name = 'Segoe UI'
      Text3.Font.Style = []
      Text3.Value = #1050#1072#1088#1090#1072
      Text4.AssignedValues = []
      OnActivateDetail = tbiMainTileBarActivateDetail
      OnClick = tbiMainTileBarItemClick
    end
  end
  object ptcBrigadesView: TdxTileControl
    Left = 23
    Top = 280
    Width = 600
    Height = 96
    Align = alNone
    OptionsBehavior.ItemCheckMode = tcicmNone
    OptionsBehavior.ItemFocusMode = tcifmOuterFrame
    OptionsBehavior.ItemHotTrackMode = tcihtmNone
    OptionsBehavior.ItemMoving = False
    OptionsBehavior.ItemPressAnimation = False
    OptionsBehavior.ScrollMode = smScrollButtons
    OptionsView.FixedIndentHorz = True
    OptionsView.GroupBlockMaxColumnCount = 4
    OptionsView.GroupIndent = 64
    OptionsView.GroupLayout = glVertical
    OptionsView.GroupMaxRowCount = 1
    OptionsView.IndentHorz = 16
    OptionsView.IndentVert = 8
    OptionsView.ItemHeight = 40
    OptionsView.ItemWidth = 64
    Style.GradientBeginColor = clFuchsia
    TabOrder = 1
    Transparent = True
    object ptcBrigadesRegisterGroup: TdxTileControlGroup
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWhite
      Caption.Font.Height = -16
      Caption.Font.Name = 'Segoe UI'
      Caption.Font.Style = []
      Caption.Text = #1042#1048#1044' '#1054#1058#1054#1041#1056#1040#1046#1045#1053#1048#1071
      Index = 0
    end
    object ptiBrigadesCards: TdxTileControlItem
      Tag = 1
      GroupIndex = 0
      IndexInGroup = 0
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1057#1090#1072#1090#1091#1089
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnClick = ptiSubMenuClick
    end
    object ptiBrigadesWorkLoad: TdxTileControlItem
      Tag = 2
      GroupIndex = 0
      IndexInGroup = 1
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1043#1088#1072#1092#1080#1082' '#1076#1077#1078#1091#1088#1089#1090#1074
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnActiveFrameChanged = ptiSubMenuClick
    end
    object ptiRemoteControl: TdxTileControlItem
      Tag = 3
      GroupIndex = 0
      IndexInGroup = 2
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = 'Remote Control'
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      Visible = False
    end
  end
  object ptcSystemSetup: TdxTileControl
    Left = 23
    Top = 394
    Width = 721
    Height = 96
    Align = alNone
    OptionsBehavior.ItemCheckMode = tcicmNone
    OptionsBehavior.ItemFocusMode = tcifmOuterFrame
    OptionsBehavior.ItemHotTrackMode = tcihtmNone
    OptionsBehavior.ItemMoving = False
    OptionsBehavior.ItemPressAnimation = False
    OptionsBehavior.ScrollMode = smScrollButtons
    OptionsView.FixedIndentHorz = True
    OptionsView.FixedIndentVert = True
    OptionsView.IndentHorz = 24
    OptionsView.IndentVert = 7
    OptionsView.ItemHeight = 40
    OptionsView.ItemIndent = 13
    OptionsView.ItemWidth = 72
    TabOrder = 2
    Transparent = True
    object ptcSystemSetupGroup: TdxTileControlGroup
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWhite
      Caption.Font.Height = -16
      Caption.Font.Name = 'Segoe UI'
      Caption.Font.Style = []
      Caption.Text = #1057#1055#1056#1040#1042#1054#1063#1053#1048#1050#1048
      Index = 0
    end
    object ptiSetupUsers: TdxTileControlItem
      GroupIndex = 0
      IndexInGroup = 0
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnClick = ptiSetupClick
    end
    object ptiSetupHospitals: TdxTileControlItem
      Tag = 1
      GroupIndex = 0
      IndexInGroup = 1
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1041#1086#1083#1100#1085#1080#1094#1099
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnClick = ptiSetupClick
    end
    object ptiSetupCustomers: TdxTileControlItem
      Tag = 2
      GroupIndex = 0
      IndexInGroup = 3
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1047#1072#1082#1072#1079#1095#1080#1082#1080
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnClick = ptiSetupClick
    end
    object ptiSetupAssistanceCategories: TdxTileControlItem
      Tag = 3
      GroupIndex = 0
      IndexInGroup = 2
      Size = tcisLarge
      Style.GradientBeginColor = clWhite
      Text1.Align = oaMiddleCenter
      Text1.AssignedValues = [avFont]
      Text1.Font.Charset = DEFAULT_CHARSET
      Text1.Font.Color = clBlack
      Text1.Font.Height = -16
      Text1.Font.Name = 'Segoe UI'
      Text1.Font.Style = []
      Text1.Value = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1086#1084#1086#1097#1080
      Text2.AssignedValues = []
      Text3.AssignedValues = []
      Text4.AssignedValues = []
      OnClick = ptiSetupClick
    end
  end
  object gbTop: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Color = 4144959
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Height = 17
    Width = 1042
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'HybridApp'
    Left = 872
    Top = 400
  end
end

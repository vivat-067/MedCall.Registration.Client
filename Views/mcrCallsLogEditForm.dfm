object frmCallsLogEdit: TfrmCallsLogEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1040#1056#1058#1040' '#1042#1067#1047#1054#1042#1040
  ClientHeight = 541
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnCreate = dxFormCreate
  OnShow = dxFormShow
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 852
    Height = 541
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dmResources.dxLayoutCxLookAndFeel1
    OptionsItem.AutoControlTabOrders = False
    OptionsItem.SizableHorz = True
    OptionsItem.SizableVert = True
    object edCallDetailsPatient: TcxTextEdit
      Left = 161
      Top = 46
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 18
      OnEditing = edCallDetailsEditing
      Width = 202
    end
    object edDetailsAddress: TcxTextEdit
      Left = 161
      Top = 110
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 24
      OnEditing = edCallDetailsEditing
      Width = 202
    end
    object edDetailsContact: TcxTextEdit
      Left = 161
      Top = 174
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
      OnEditing = edCallDetailsEditing
      Width = 202
    end
    object edDetailsInsuranceNumber: TcxTextEdit
      Left = 505
      Top = 174
      AutoSize = False
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 21
      OnEditing = edCallDetailsEditing
      Height = 22
      Width = 121
    end
    object edDetailsReceptionTime: TcxTextEdit
      Left = 317
      Top = 274
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
      Width = 49
    end
    object edDetailsDepartureTime: TcxTextEdit
      Left = 376
      Top = 274
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 45
    end
    object edDetailsArrivalTime: TcxTextEdit
      Left = 431
      Top = 274
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 42
    end
    object edDetailsCompletionTime: TcxTextEdit
      Left = 483
      Top = 274
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Width = 51
    end
    object edDetailsWorkDuration: TcxTextEdit
      Left = 544
      Top = 274
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 51
    end
    object edDetailsDiagnosis: TcxMemo
      Left = 127
      Top = 325
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 10
      OnEditing = edCallDetailsEditing
      Height = 70
      Width = 323
    end
    object edDetailsConclusion: TcxMemo
      Left = 127
      Top = 405
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      OnEditing = edCallDetailsEditing
      Height = 46
      Width = 323
    end
    object edDetailsBrigade: TcxButtonEdit
      Left = 546
      Top = 325
      AutoSize = False
      Properties.Buttons = <>
      Properties.ReadOnly = False
      Properties.OnButtonClick = edDetailsBrigadePropertiesButtonClick
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 11
      OnEditing = edCallDetailsEditing
      Height = 22
      Width = 289
    end
    object edDetailsDoctor: TcxTextEdit
      Left = 546
      Top = 357
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 12
      OnEditing = edCallDetailsEditing
      Width = 289
    end
    object btnSave: TcxButton
      Left = 472
      Top = 482
      Width = 187
      Height = 42
      Action = acSave
      ModalResult = 1
      OptionsImage.Images = dmResources.ilButtons
      OptionsImage.Spacing = 16
      TabOrder = 6
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnCancel: TcxButton
      Left = 669
      Top = 482
      Width = 166
      Height = 42
      Action = acCancel
      OptionsImage.Images = dmResources.ilButtons
      OptionsImage.Spacing = 10
      TabOrder = 7
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnClose: TcxButton
      Left = 17
      Top = 482
      Width = 120
      Height = 42
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 8
      OptionsImage.ImageIndex = 31
      OptionsImage.Images = dmResources.ilButtons
      OptionsImage.Spacing = 10
      TabOrder = 8
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edCallNumber: TcxTextEdit
      Left = 695
      Top = 46
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = clWindow
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 13
      Height = 22
      Width = 121
    end
    object dtCallDate: TcxDateEdit
      Left = 505
      Top = 46
      AutoSize = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 20
      OnEditing = edCallDetailsEditing
      Height = 22
      Width = 121
    end
    object cmbCallStatus: TcxComboBox
      Left = 505
      Top = 78
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 14
      OnEditing = edCallDetailsEditing
      Width = 311
    end
    object edDriver: TcxTextEdit
      Left = 546
      Top = 421
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 16
      OnEditing = edCallDetailsEditing
      Width = 289
    end
    object edParamedic: TcxTextEdit
      Left = 546
      Top = 389
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 15
      OnEditing = edCallDetailsEditing
      Width = 289
    end
    object edAddress2: TcxTextEdit
      Left = 161
      Top = 142
      Properties.ReadOnly = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 17
      OnEditing = edCallDetailsEditing
      Width = 202
    end
    object edCustomer: TcxButtonEdit
      Left = 505
      Top = 110
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 22
      OnEditing = edCallDetailsEditing
      Width = 311
    end
    object edCost: TcxCurrencyEdit
      Left = 720
      Top = 142
      AutoSize = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 19
      OnEditing = edCallDetailsEditing
      Height = 22
      Width = 96
    end
    object edBirthDate: TcxDateEdit
      Left = 161
      Top = 78
      AutoSize = False
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 25
      OnEditing = edCallDetailsEditing
      Height = 22
      Width = 87
    end
    object edAge: TcxSpinEdit
      Left = 325
      Top = 78
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 26
      Width = 38
    end
    object cmbPaymentType: TcxComboBox
      Left = 505
      Top = 142
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 23
      Text = #1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081
      OnEditing = edCallDetailsEditing
      Width = 117
    end
    object lgDetails: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      Hidden = True
      ItemIndex = 1
      Padding.AssignedValues = [lpavTop]
      ShowBorder = False
      Index = -1
    end
    object lgDetailsPatient: TdxLayoutGroup
      Parent = lgTopSection
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #1055#1072#1094#1080#1077#1085#1090
      Offsets.Bottom = 20
      SizeOptions.Width = 300
      ItemIndex = 1
      Padding.AssignedValues = [lpavLeft]
      Index = 0
    end
    object liCallDetailsPatient: TdxLayoutItem
      Parent = lgDetailsPatient
      SizeOptions.Width = 262
      CaptionOptions.Text = #1060#1048#1054':'
      Control = edCallDetailsPatient
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 215
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lgDetailTimeAndDiagnosis: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #1054#1082#1072#1079#1072#1085#1085#1072#1103' '#1087#1086#1084#1086#1097#1100
      Offsets.Left = 10
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = True
      SizeOptions.Width = 300
      ItemIndex = 1
      Padding.AssignedValues = [lpavLeft, lpavRight]
      ShowBorder = False
      Index = 0
    end
    object lgDetailsBrigade: TdxLayoutGroup
      Parent = lgDetails
      Offsets.Bottom = 20
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object liDetailsAddress: TdxLayoutItem
      Parent = lgDetailsPatient
      CaptionOptions.Text = #1040#1076#1088#1077#1089' ('#1091#1083'/'#1076#1086#1084'):'
      Control = edDetailsAddress
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDetailsContact: TdxLayoutItem
      Parent = lgDetailsPatient
      AlignHorz = ahClient
      CaptionOptions.Text = #1050#1086#1085#1090#1072#1082#1090#1099':'
      Control = edDetailsContact
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liDetailsInsuranceNumber: TdxLayoutItem
      Parent = lgTopRight
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'N '#1087#1086#1083#1080#1089#1072':'
      Control = edDetailsInsuranceNumber
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liDetailsReceptionTime: TdxLayoutItem
      Parent = lgDetailsTime
      CaptionOptions.Text = #1055#1088#1080#1077#1084
      CaptionOptions.Layout = clTop
      Control = edDetailsReceptionTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 49
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liDetailsDepartureTime: TdxLayoutItem
      Parent = lgDetailsTime
      CaptionOptions.Text = #1042#1099#1077#1079#1076
      CaptionOptions.Layout = clTop
      Control = edDetailsDepartureTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 45
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDetailsArrivalTime: TdxLayoutItem
      Parent = lgDetailsTime
      CaptionOptions.Text = #1055#1088#1080#1073'.'
      CaptionOptions.Layout = clTop
      Control = edDetailsArrivalTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 42
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object liDetailsCompletionTime: TdxLayoutItem
      Parent = lgDetailsTime
      CaptionOptions.Text = #1054#1082#1086#1085#1095'.'
      CaptionOptions.Layout = clTop
      Control = edDetailsCompletionTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 51
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liDetailsWorkDuration: TdxLayoutItem
      Parent = lgDetailsTime
      CaptionOptions.Text = #1056#1072#1073#1086#1090#1072
      CaptionOptions.Layout = clTop
      Control = edDetailsWorkDuration
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 51
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lgDetailsTime: TdxLayoutGroup
      Parent = lgDetailsBrigade
      AlignHorz = ahCenter
      AlignVert = avClient
      CaptionOptions.Layout = clLeft
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object liDetailsDiagonosis: TdxLayoutItem
      Parent = lgDetailTimeAndDiagnosis
      CaptionOptions.Text = #1044#1080#1072#1075#1085#1086#1079':'
      Control = edDetailsDiagnosis
      ControlOptions.OriginalHeight = 70
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDetailsConclusion: TdxLayoutItem
      Parent = lgDetailTimeAndDiagnosis
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077':'
      Control = edDetailsConclusion
      ControlOptions.OriginalHeight = 37
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liDetailsBrigade: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #1041#1088#1080#1075#1072#1076#1072':'
      Control = edDetailsBrigade
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDetailsDoctor: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #1042#1088#1072#1095':'
      Control = edDetailsDoctor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 209
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      SizeOptions.Width = 130
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.MinHeight = 21
      ControlOptions.MinWidth = 21
      ControlOptions.OriginalHeight = 42
      ControlOptions.OriginalWidth = 150
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      SizeOptions.Width = 116
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.MinHeight = 21
      ControlOptions.MinWidth = 21
      ControlOptions.OriginalHeight = 42
      ControlOptions.OriginalWidth = 116
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgBottom: TdxLayoutGroup
      Parent = lgDetails
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      Offsets.Top = 5
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lgBottom
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      SizeOptions.Width = 363
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = lgBottom
      CaptionOptions.Visible = False
      Control = btnClose
      ControlOptions.OriginalHeight = 42
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgTopSection: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lgTopRight: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = #1042#1099#1079#1086#1074
      SizeOptions.Width = 394
      ItemIndex = 3
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lgDetails
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = lgDetails
      AlignVert = avClient
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahRight
      CaptionOptions.Text = #1041#1088#1080#1075#1072#1076#1072
      SizeOptions.Width = 375
      ItemIndex = 3
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #1053#1086#1084#1077#1088':'
      Control = edCallNumber
      ControlOptions.OriginalHeight = 22
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liCallDate: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = #1044#1072#1090#1072':'
      Control = dtCallDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liCallStatus: TdxLayoutItem
      Parent = lgTopRight
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #1057#1090#1072#1090#1091'c:'
      Control = cmbCallStatus
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = #1042#1086#1076#1080#1090#1077#1083#1100':'
      Control = edDriver
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #1060#1077#1083#1100#1076#1096#1077#1088':'
      Control = edParamedic
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDetailsAddress2: TdxLayoutItem
      Parent = lgDetailsPatient
      CaptionOptions.Text = #1040#1076#1088#1077#1089' ('#1082#1074'/'#1087#1076'/'#1101#1090')'
      Control = edAddress2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = lgTopRight
      AlignHorz = ahLeft
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = lgTopRight
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #1047#1072#1082#1072#1079#1095#1080#1082':'
      Control = edCustomer
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = lgDetails
      AlignVert = avBottom
      CaptionOptions.Text = 'Separator'
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup6
      AlignHorz = ahClient
      AlignVert = avClient
      SizeOptions.Width = 187
      CaptionOptions.Text = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
      Control = edCost
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 99
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liBirthDate: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup5
      AlignVert = avClient
      SizeOptions.Width = 212
      CaptionOptions.Text = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
      Control = edBirthDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 87
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liAge: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup5
      AlignHorz = ahClient
      CaptionOptions.Text = #1042#1086#1079#1088#1072#1089#1090':'
      Control = edAge
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
      Parent = lgDetailsPatient
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099':'
      Control = cmbPaymentType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup
      Parent = lgTopRight
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lgDetailsTime
      AlignHorz = ahLeft
      AlignVert = avCenter
      Offsets.Right = 10
      CaptionOptions.Glyph.SourceDPI = 96
      CaptionOptions.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000280000002808060000008CFEB8
        6D000000097048597300000EC400000EC401952B0E1B0000078C494441545885
        CD987B6C14C71DC73FB3BBF7F219CCA326A61CC63C1C234C781B1752DB8A3129
        3467A236691B556D09457D4876491B44F1268262285A1AFE0824823F22D1B4A4
        A8AA2A505B1C200EC25C8AA3D0629396904745C08598C450C2C377F63D7667FA
        87CF8EDF3EBB10F52BAD46F77BCC7E76E6F637B3239452FC3FCB18495243F9A2
        D5401EF0C1C2C3677E7B77917A4A0C77041BCA1735000BBA991A171E3EB3F0AE
        5275D3B000CF06E72F90426FE86DD794B3707ECDD9C6BB4A96D4B0A6F8AA67C2
        D4A9ED1FE108BDCBA62B874BBEC0D4F9704F00873DC59FB7061CC1D2675F3D64
        3BF26B42080024022544478BE88A138040A1A9DE9EFF4966C80AEE1810F0A167
        6ADE8A269CC2B6A84DEFF11502C6F83D43DE412A85ED2894526842A0EB024DA4
        8C6F01FD03AEDA56BBB82DE6142ECECBE4C51F2EED377BEEBA8303424AA9688B
        D98C4A73533C2B93B1E91EAEDF8952FF5E0B91988DCF630C07B42FE0CD70F4A0
        AE8B01E10693ED480C5DB0FB074BF8727E561F7FEDD98FD87CA00143D7D0B5D4
        207B003EBAADF6B170D40EEC5C53386C38472AFC5E83DAEA9520044A4ACEAC98
        833E6A344EEB6D0A6ACFF3F0FC00C5F91359BEF908522AB414207B00DE688DBE
        94FD053F65F3260D0B4E017722710E5675C07548E0B4B7215C6E9CF6F6AE58AF
        5B67DF4F8AF9C6AF8EA7F45FEE022CDF7A6C5524668FDBFEBD8261C101246CC9
        CA8200F78D4DEBB2094D2034ADEBEAAEFB276550983B81F3576E62E85AEFEEFA
        07BC1989EF1D97EEA164F6C41102E620AF35F3EEE6A7D07C6920404F4B073ADA
        F7D7AF464A856C6F63F68EBDAC5C3C85B72FDD480DF091EAD716C41372D2F797
        DF3F6C38E828295332479168FF98F0F9468CF4518040181DCF2F0C83F0BBFF00
        1476B815271A277B423A4E0A8B8401D0164B98D184C3371F9C36224001C4120E
        28898AC790714FC7081A9FFDC5653CD6AD55C41232A5A26E00C46DF9785E2083
        749F7B4480BA2678E7DFFF61E6A20079CFED43B85C2829B9B0651DBACF8FD316
        2177DB1E40A11209F409F7F1CE3F2FA26B834F2F80515C55F3B0231525B3FAD6
        AD54E576691C387181C7974C655CC98A2EBB4A24C007CA4E307669698F9C3FBE
        F1216E2305402158EE71E9FC2EF4212FD57E3064427F4B9DAE695CBE1EE6CFA7
        9B78B430A7034E4A64B41DC7EDC1897695991BC0F9978FBF7FF5565B42A5798C
        2C603690392020B010C0E3D2F1B8F481E28694DF6BB0F9400363D33D14E74F44
        681A937FBC11E1F646553CFA1B603F1D5BB2D89AB299AC299B09408959E306E6
        00DF05D602FE1E03525C75B819F8E288C9BA4929C59DB60445F9595406F3C99B
        947114A8002E99A6F910B05629550C4C4EA6340B21EA81972DCB3A5662D64C02
        5E00BE1EB282A213F0AE6F0813B654D18453ADA4DABEC2FFF779C011DBB6336D
        DB4629457A7A477D8C442228A570B95CE8BADE2A84287F93074F014F87ACE04E
        487D476D03B540049807E40E16EC32B45FBEB97355B5699A9B94525B23910873
        E6CCA1B4B494E9D3A7F7886D6A6AE2E4C9933436368EF2F97C27976AF5CF5B96
        F574A73F95117C226405FFD0DD5062D68C07EA8007FA893F06942FA5BE4A4AB9
        4D294545450553A64CE90AD8F7FA7B7CAB289774EF67E373F5EA5576ECD881E3
        388C1E3D7AB765593F4D05707CC80A7E5A62D63C09AC013280DA9015FC7912F4
        38B0AC5B7C0C98B594FA314AA90629255BB66C212D2DAD47A7CFEE3FCD0339E3
        79A278460F7B3C1E67C3860D78BD5E344D5B6E59D671038803FD55E8B549B837
        80A26EF6B92566CD06C013B2826525664DF707DC1FB282174DB3FEE34824C2FA
        F5EBFBC0015CFCA4157F3F8B82DBEDC6344DB66FDF8EDFEFFF13906E00D78040
        EFE09015FC7572E48A7AFB927A1D28019E077E96B4BD629A66916DDB59F9F9F9
        E4E4E4F49B78BB3D46CBCDF67E7D59595914141470EEDC39BF699A5F35801F01
        AFF68AEBFC847C72003880E2647B2A09780B3823A5DC1B8FC759B66C99049052
        F648D2348DB67647FBB4359674F7F5979696D2D8D8A8699AF66D2364058FC080
        EB76DFF9E9A590153CD43DBFAAEA54911082DCDC5CADF386BD15B52591989374
        F7F5070201344D4308F1A5A1CACC6BC0403BD8E601ECD95EAF77D04EAF5C6BA5
        2D66F3954D47F17A34467BDD64A4BB9990E16372A69F3565798C1D3386702412
        18143064053775BE10FDB8CB07A51844853327F2B77F7D8221042E4370DB1DE3
        FA1D9D70729FA8A0EBD32195429D06FC057824F9FB22F058C80ABE3D40FC9568
        343AE8C6F2D0336543DEF4D6AD5BB85CAEE6210143565002C1217B4C4A08F157
        21C4B40B172E3063C68CA113FA517373338EE3E076BBDF1AD1F9E010DA6718C6
        EA13274E8C18B0AEAE0E97CB05F00A4AA9BB7E5555555DABACAC544D4D4D6AB8
        6A6969519595956AE3C68DED4AA9919DB0A6A0157EBFBF61CF9E3D545757E3F3
        F9524AB26D9B5DBB769196968610A21CEEE1F19B699A9BA4945B012A2A2AC8CE
        CE1E34BEA5A585DDBB7763DB36BAAEBF6859D6BA7B0A9884DCA294FA45241261
        EEDCB9949696326D5ACF17FCF2E5CBD4D5D5D1D0D080CFE743D3B4172CCB7AAA
        D37FCF0F304DD32C008EDAB63D3E91482084C0EFF72384201C0E77DFB0868510
        AB2CCBAAEB9EFFB99DB09AA659047C4729B5040828A58410A25908711AF8BD65
        59C7FBCBFB2F9BD161E7003445420000000049454E44AE426082}
      CaptionOptions.Layout = clTop
      Index = 0
    end
  end
  object ActionList1: TActionList
    Images = dmResources.ilButtons
    Left = 800
    Top = 392
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 30
      OnExecute = acSaveExecute
      OnUpdate = acSaveUpdate
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 37
      OnUpdate = acCancelUpdate
    end
  end
end

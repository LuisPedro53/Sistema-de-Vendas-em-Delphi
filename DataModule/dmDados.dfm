object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 409
  Width = 548
  object RESTClient1: TRESTClient
    Params = <>
    Left = 56
    Top = 48
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 136
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 256
    Top = 56
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 40
    Top = 128
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 232
    Top = 160
  end
end

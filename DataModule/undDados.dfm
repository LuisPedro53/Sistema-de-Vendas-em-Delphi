object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 441
  Width = 626
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 80
    Top = 208
  end
  object RESTClient1: TRESTClient
    Params = <>
    Left = 80
    Top = 64
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 72
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    Left = 208
    Top = 64
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 208
    Top = 136
  end
end

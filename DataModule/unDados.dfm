object DmDados: TDmDados
  OldCreateOrder = False
  Height = 432
  Width = 549
  object RESTClient1: TRESTClient
    Params = <>
    HandleRedirects = True
    Left = 80
    Top = 40
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 184
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 120
    Top = 128
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 248
    Top = 144
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 112
    Top = 264
  end
end

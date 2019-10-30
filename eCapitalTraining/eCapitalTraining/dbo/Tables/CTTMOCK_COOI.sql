CREATE TABLE [dbo].[CTTMOCK_COOI] (
    [ProjectNumber]                      NVARCHAR (24)   NULL,
    [WBSElement]                         NVARCHAR (24)   NULL,
    [DocumentCategory]                   INT             NULL,
    [DocumentNumber]                     NVARCHAR (10)   NULL,
    [LineNumber]                         INT             NULL,
    [DocumentDescription]                NVARCHAR (100)  NULL,
    [SupplierName]                       NVARCHAR (50)   NULL,
    [CostElement]                        NVARCHAR (10)   NULL,
    [DocumentDate]                       DATE            NULL,
    [PostingDate]                        DATE            NULL,
    [ActualValueLocalCurrency]           DECIMAL (18, 2) NULL,
    [ActualValueControllingAreaCurrency] DECIMAL (18, 2) NULL,
    [PlanValueLocalCurrency]             DECIMAL (18, 2) NULL,
    [PlanValueControllingAreaCurrency]   DECIMAL (18, 2) NULL,
    [TransactionCurrency]                NVARCHAR (5)    NULL,
    [VendorNumber]                       INT             NULL,
    [DeleteStatus]                       NVARCHAR (10)   NULL,
    [CreatedOn]                          DATETIME        NULL,
    [Period]                             INT             NULL
);


CREATE TABLE [dbo].[CTTMOCK_EKBE] (
    [ProjectNumber]                      NVARCHAR (24)   NULL,
    [WBSElement]                         NVARCHAR (24)   NULL,
    [TransactionType]                    NVARCHAR (5)    NULL,
    [Category]                           NVARCHAR (5)    NULL,
    [DocumentNumber]                     NVARCHAR (10)   NULL,
    [LineNumber]                         INT             NULL,
    [MaterialDocumentNumber]             NVARCHAR (10)   NULL,
    [DocumentDate]                       DATE            NULL,
    [PostingDate]                        DATE            NULL,
    [ActualValueLocalCurrency]           DECIMAL (18, 2) NULL,
    [ActualValueDocumentCurrency]        DECIMAL (18, 2) NULL,
    [ActualValueTransactionCurrency]     DECIMAL (18, 2) NULL,
    [ActualValueObjectCurrency]          DECIMAL (18, 2) NULL,
    [ActualValueControllingAreaCurrency] DECIMAL (18, 2) NULL,
    [Currency]                           NVARCHAR (5)    NULL,
    [LocalCurrency]                      NVARCHAR (5)    NULL,
    [CreatedOn]                          DATETIME        NULL,
    [Period]                             INT             NULL
);


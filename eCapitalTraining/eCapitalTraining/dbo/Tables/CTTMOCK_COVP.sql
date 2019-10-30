CREATE TABLE [dbo].[CTTMOCK_COVP] (
    [ProjectNumber]                      NVARCHAR (24)   NULL,
    [WBSElement]                         NVARCHAR (24)   NULL,
    [DocumentNumber]                     NVARCHAR (10)   NULL,
    [PurchasingDocumentNumber]           NVARCHAR (10)   NULL,
    [PurchasingDocumentLineNumber]       INT             NULL,
    [ValueType]                          NVARCHAR (5)    NULL,
    [DocumentTypeOfFIReferenceDocument]  NVARCHAR (5)    NULL,
    [COBusinessTransaction]              NVARCHAR (5)    NULL,
    [CostElement]                        NVARCHAR (10)   NULL,
    [DocumentHeaderText]                 NVARCHAR (50)   NULL,
    [SegmentText]                        NVARCHAR (50)   NULL,
    [DocumentDate]                       DATE            NULL,
    [PostingDate]                        DATE            NULL,
    [ActualValueTransactionCurrency]     DECIMAL (18, 2) NULL,
    [ActualValueObjectCurrency]          DECIMAL (18, 2) NULL,
    [ActualValueControllingAreaCurrency] DECIMAL (18, 2) NULL,
    [TransactionCurrency]                NVARCHAR (5)    NULL,
    [Currency]                           NVARCHAR (5)    NULL,
    [MaterialDocumentNumber]             NVARCHAR (10)   NULL,
    [DocumentDescription]                NVARCHAR (50)   NULL,
    [CreatedOn]                          DATETIME        NULL
);


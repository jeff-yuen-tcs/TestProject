CREATE TABLE [dbo].[CTTMOCKPlanVersions] (
    [ProjectNumber]              NVARCHAR (24)   NULL,
    [WBSElement]                 NVARCHAR (24)   NULL,
    [CostElement]                NVARCHAR (10)   NULL,
    [FiscalYear]                 INT             NULL,
    [Period]                     INT             NULL,
    [Version]                    NVARCHAR (5)    NULL,
    [Currency]                   NVARCHAR (5)    NULL,
    [TransactionalCurrencyValue] DECIMAL (18, 2) NULL,
    [ObjectCurrencyValue]        DECIMAL (18, 2) NULL,
    [CreatedOn]                  DATETIME        NULL
);


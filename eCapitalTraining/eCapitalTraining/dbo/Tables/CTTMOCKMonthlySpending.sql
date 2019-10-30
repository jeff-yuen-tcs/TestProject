CREATE TABLE [dbo].[CTTMOCKMonthlySpending] (
    [ProjectNumber]                NVARCHAR (24)   NULL,
    [WBS]                          NVARCHAR (24)   NULL,
    [FiscalYear]                   INT             NULL,
    [Period]                       INT             NULL,
    [CostElement]                  NVARCHAR (10)   NULL,
    [TransactionalCurrencyValue]   DECIMAL (18, 2) NULL,
    [ObjectCurrencyValue]          DECIMAL (18, 2) NULL,
    [ControllingAreaCurrencyValue] DECIMAL (18, 2) NULL,
    [CreatedOn]                    DATETIME        NULL,
    [DataPeriod]                   INT             NULL
);


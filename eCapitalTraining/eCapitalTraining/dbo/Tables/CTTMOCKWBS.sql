CREATE TABLE [dbo].[CTTMOCKWBS] (
    [ID]                         INT             NOT NULL,
    [ProjectNumber]              NVARCHAR (50)   NOT NULL,
    [AccountCode]                INT             NULL,
    [WBS]                        NVARCHAR (150)  NOT NULL,
    [WBSDescription]             NVARCHAR (500)  NOT NULL,
    [WBSParent]                  NVARCHAR (150)  NULL,
    [OBJNR]                      NVARCHAR (22)   NULL,
    [SYSTEM_STATUS]              NVARCHAR (120)  NULL,
    [IsPlanningElement]          BIT             NULL,
    [IsAccountAssignmentElement] BIT             NULL,
    [IsLeafWbsElement]           BIT             NULL,
    [UandODate]                  DATE            NULL,
    [Capitalized]                DECIMAL (18, 2) NULL,
    [CreatedOn]                  DATETIME        NULL
);




-- =============================================
-- Author:		Jeffrey Yuen
-- Create date: September 13th, 2016
-- Description:	Get the mock data to use for 
-- =============================================
CREATE PROCEDURE [dbo].[spCTTTrainingGetMockProjectBasicDetails]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- this should only return 1 row
    SELECT TOP 1 [ProjectName]
      ,[ProjectStartDate]
      ,[ProjectEndDate]
      ,[ETC]
      ,[StretchGoal]
      ,[FundedAmount]
      ,[ProjectCurrency]
  FROM [E_Capital].[dbo].[CTTMock_ProjectDetails]
  
END



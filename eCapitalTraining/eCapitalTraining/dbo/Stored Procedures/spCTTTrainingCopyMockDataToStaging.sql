

-- =============================================      
-- Author:  Jeffrey Yuen      
-- Create date: September 13th, 2016      
-- Description: Copies mock table to SAP staging tables      
-- =============================================      
CREATE PROCEDURE [dbo].[spCTTTrainingCopyMockDataToStaging]      
 -- Add the parameters for the stored procedure here      
 @ProjectNumber varchar(50)      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
 DECLARE @ProjectID int, @TrainingPeriod int;      
      
 SET @ProjectID = (SELECT ProjectID FROM CTTProjectProperties WHERE PropertyID = 1 AND PropertyValue = @ProjectNumber);      
       
 -- find the period of training data to use      
 SET @TrainingPeriod = ISNULL((SELECT PropertyValue FROM CTTProjectProperties WHERE PropertyID = 35 and ProjectID = @ProjectID), 0);      
  -- On 0, initial project setup 
       
 IF @TrainingPeriod = 0
 BEGIN
	 INSERT INTO CTTProjectProperties ([ProjectID]
		  ,[PropertyID]
		  ,[PropertyValue]
		  ,[CreatedOn]
		  ,[CreatedBy])
	 SELECT @ProjectID, 35, 0, SYSDATETIME(), 'CopyMockDataToStaging'      
 END
      
 -- for debugging purposes       
 DELETE FROM CTTSAPWBS where ProjectNumber = @ProjectNumber    
 DELETE FROM CTTSAP_COOI where ProjectNumber = @ProjectNumber      
 DELETE FROM CTTSAP_COVP_NOFILT where ProjectNumber = @ProjectNumber      
 DELETE FROM CTTSAP_EKBE where ProjectNumber = @ProjectNumber         
 DELETE FROM CTTSAPMonthlySpending where ProjectNumber = @ProjectNumber    
 
 -- get WBS data
 
 INSERT INTO CTTSAPWBS
	([ProjectNumber]
      ,[AccountCode]
      ,[WBS]
      ,[WBSDescription]
      ,[WBSParent]
      ,[OBJNR]
      ,[SYSTEM_STATUS]
      ,[IsPlanningElement]
      ,[IsAccountAssignmentElement]
      ,[IsLeafWbsElement]
      ,[UandODate]
      ,[Capitalized]
      ,[CreatedOn])
 SELECT @ProjectNumber
      ,[AccountCode]
      ,SUBSTRING(REPLACE([WBS], 'L.XXXXX', @ProjectNumber), 0, 24)
      ,[WBSDescription]
      ,SUBSTRING(REPLACE([WBSParent], 'L.XXXXX', @ProjectNumber), 0, 24)
      ,[OBJNR]
      ,[SYSTEM_STATUS]
      ,[IsPlanningElement]
      ,[IsAccountAssignmentElement]
      ,[IsLeafWbsElement]
      ,[UandODate]
      ,[Capitalized]
      ,SYSDATETIME()
  FROM [E_Capital].[dbo].[CTTMOCKWBS] 
       
 -- get PO/PR data      
 INSERT INTO CTTSAP_COOI      
 ([ProjectNumber]      
      ,[WBSElement]      
      ,[DocumentCategory]      
      ,[DocumentNumber]      
      ,[LineNumber]      
      ,[DocumentDescription]      
      ,[SupplierName]      
      ,[CostElement]      
      ,[DocumentDate]      
      ,[PostingDate]      
      ,[ActualValueLocalCurrency]      
      ,[ActualValueControllingAreaCurrency]      
      ,[PlanValueLocalCurrency]      
      ,[PlanValueControllingAreaCurrency]      
      ,[TransactionCurrency]      
      ,[VendorNumber]      
      ,[DeleteStatus]      
      ,[CreatedOn])      
    SELECT       
    @ProjectNumber      
   ,SUBSTRING(REPLACE([WBSElement], 'L.XXXXX', @ProjectNumber), 0, 24)      
      ,[DocumentCategory]      
      ,[DocumentNumber]      
      ,[LineNumber]      
      ,SUBSTRING([DocumentDescription], 0, 50)      
      ,[SupplierName]      
      ,[CostElement]      
      ,[DocumentDate]      
      ,[PostingDate]      
      ,[ActualValueLocalCurrency]      
      ,[ActualValueControllingAreaCurrency]      
      ,[PlanValueLocalCurrency]      
      ,[PlanValueControllingAreaCurrency]      
      ,[TransactionCurrency]      
      ,[VendorNumber]      
      ,[DeleteStatus]      
      ,SYSDATETIME()      
     FROM CTTMOCK_COOI where Period = @TrainingPeriod      
           
     -- Get GR/IR actuals information      
     INSERT INTO CTTSAP_COVP_NOFILT      
  ([ProjectNumber]      
  ,[WBSElement]      
  ,[DocumentNumber]      
  ,[PurchasingDocumentNumber]      
  ,[PurchasingDocumentLineNumber]      
  ,[ValueType]      
  ,[DocumentTypeOfFIReferenceDocument]      
  ,[COBusinessTransaction]      
  ,[CostElement]      
  ,[DocumentHeaderText]      
  ,[SegmentText]      
  ,[DocumentDate]      
  ,[PostingDate]      
  ,[ActualValueTransactionCurrency]      
  ,[ActualValueObjectCurrency]      
  ,[ActualValueControllingAreaCurrency]      
  ,[TransactionCurrency]      
  ,[Currency]      
  ,[CreatedOn] )      
 SELECT      
  @ProjectNumber      
   ,SUBSTRING(REPLACE([WBSElement], 'L.XXXXX', @ProjectNumber), 0, 24)      
      ,[DocumentNumber]      
      ,[PurchasingDocumentNumber]      
      ,[PurchasingDocumentLineNumber]      
      ,[ValueType]      
      ,[DocumentTypeOfFIReferenceDocument]      
      ,[COBusinessTransaction]      
      ,[CostElement]      
      ,SUBSTRING([DocumentHeaderText], 0, 50)      
      ,[SegmentText]      
      ,[DocumentDate]      
      ,[PostingDate]      
      ,[ActualValueTransactionCurrency]      
      ,[ActualValueObjectCurrency]      
      ,[ActualValueControllingAreaCurrency]      
      ,[TransactionCurrency]      
      ,[Currency]      
      ,SYSDATETIME()      
    FROM CTTMOCK_COVP_NOFILT WHERE Period = @TrainingPeriod        
      
 -- copy over EKBE data      
 INSERT INTO CTTSAP_EKBE    
  ([ProjectNumber]      
  ,[WBSElement]      
  ,[TransactionType]      
  ,[Category]      
  ,[DocumentNumber]      
  ,[LineNumber]      
  ,[MaterialDocumentNumber]      
  ,[DocumentDate]      
  ,[PostingDate]      
  ,[ActualValueLocalCurrency]      
  ,[ActualValueDocumentCurrency]      
  ,[ActualValueTransactionCurrency]      
  ,[ActualValueObjectCurrency]      
  ,[ActualValueControllingAreaCurrency]      
  ,[Currency]      
  ,[LocalCurrency]        
  ,[CreatedOn] )      
 SELECT      
  @ProjectNumber      
   ,SUBSTRING(REPLACE([WBSElement], 'L.XXXXX', @ProjectNumber), 0, 24)      
      ,[TransactionType]      
  ,[Category]      
  ,[DocumentNumber]      
  ,[LineNumber]      
  ,[MaterialDocumentNumber]      
  ,[DocumentDate]      
  ,[PostingDate]      
  ,[ActualValueLocalCurrency]      
  ,[ActualValueDocumentCurrency]      
  ,[ActualValueTransactionCurrency]      
  ,[ActualValueObjectCurrency]      
  ,[ActualValueControllingAreaCurrency]      
  ,[Currency]      
  ,[LocalCurrency]       
      ,SYSDATETIME()      
    FROM CTTMOCK_EKBE WHERE Period = @TrainingPeriod     
 -- copy over MonthlySpending data      
 INSERT INTO CTTSAPMonthlySpending    
  ([ProjectNumber]      
  ,[WBS]      
  ,[FiscalYear]      
  ,[Period]      
  ,[CostElement]      
  ,[TransactionalCurrencyValue]      
  ,[ObjectCurrencyValue]      
  ,[ControllingAreaCurrencyValue]      
  ,[CreatedOn] )      
 SELECT      
  @ProjectNumber      
   ,SUBSTRING(REPLACE([WBS], 'L.XXXXX', @ProjectNumber), 0, 24)      
    ,[FiscalYear]      
  ,[Period]      
  ,[CostElement]      
  ,[TransactionalCurrencyValue]      
  ,[ObjectCurrencyValue]      
  ,[ControllingAreaCurrencyValue]      
      ,SYSDATETIME()      
    FROM CTTMOCKMonthlySpending WHERE DataPeriod = @TrainingPeriod     
 -- other staging tables not useful, I think?      
      
 -- update the training period for the next sync
 DECLARE @MaxPeriod int = (SELECT TOP 1 MaxPeriod FROM CTTMock_ProjectDetails);      
       
       
 IF @MaxPeriod > @TrainingPeriod      
 BEGIN      
  -- cap at the max period available      
  UPDATE CTTProjectProperties SET       
  PropertyValue = @TrainingPeriod +1 
  ,ModifiedOn = SYSDATETIME(), ModifiedBy = 'CopyMockDataToStaging'
    WHERE ProjectID = @ProjectID AND PropertyID = 35      
       
 END      
 /*
  IF @MaxPeriod = @TrainingPeriod      
 BEGIN      
  -- DEBUG restart the cycle
  DELETE FROM CTTProjectProperties
    WHERE ProjectID = @ProjectID AND PropertyID = 35        
 END 
 */
       
END 


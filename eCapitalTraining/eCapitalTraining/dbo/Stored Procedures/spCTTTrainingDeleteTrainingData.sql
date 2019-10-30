
    
CREATE Procedure [dbo].[spCTTTrainingDeleteTrainingData]          
as          
begin  try        
          
--Declare @Projectid as nvarchar(20);          
--Declare @WBSid as nvarchar(20);          
--set @Projectid=10000000000 --cttprojectproperties id==1           
--set @WBSid=10000000000000 --cttwbs          
--Jh 09/15/2016        
Declare @Projectid as table (Projectid int)    
Declare @WBSid as table (WBSID int)      
declare @id int
    
insert into @Projectid     
select distinct ProjectID from E_Capital.dbo.CTTProjectProperties where PropertyID = 1 and PropertyValue like 'TRN%'    

WHILE EXISTS (SELECT * FROM @Projectid)
BEGIN
	SET @id = (SELECT TOP 1 ProjectId from @Projectid)
	exec spCTTDeleteProj @id
	
	DELETE FROM @Projectid where Projectid = @id
END
        
 /*       
insert into @WBSid         
select distinct WBSID from E_Capital.dbo.CTTWBS where ProjectID in (select * from @Projectid)        
          
delete from CTTSAP_COOI where ProjectNumber like 'TRN%' and WBSElement like 'TRN%'          
delete from CTTSAP_COVP where ProjectNumber like 'TRN%' and WBSElement like 'TRN%'          
delete from CTTSAP_COVP_NOFILT where ProjectNumber like 'TRN%' and WBSElement like 'TRN%'          
delete from CTTSAP_EKBE where ProjectNumber like 'TRN%'  and WBSElement like 'TRN%'          
delete from CTTSAPMonthlyCommitments where ProjectNumber like 'TRN%'           
delete from CTTSAPMonthlySpending where ProjectNumber like 'TRN%'            
delete from CTTSAPPlanVersions where ProjectNumber like 'TRN%'  and WBSElement like 'TRN%'          
delete from CTTSAPWBS where ProjectNumber like 'TRN%'            
          
delete from CTTChkdOutBudgetReallocation where Projectid in (select * from @Projectid)          
delete from CTTChkdOutPlannedVersion202 where Projectid in (select * from @Projectid)          
delete from CTTChkdOutPlannedVersion205C where Projectid in (select * from @Projectid)          
delete from CTTChkdOutPlannedVersion205E where Projectid in (select * from @Projectid)          
delete from CTTChkdOutWBSCosting where Projectid in (select * from @Projectid)          
delete from CTTChkdOutWBSMonthlyCost where Projectid in (select * from @Projectid)          
delete from CTTChkdOutTrendLog where Projectid in (select * from @Projectid)          
delete from CTTBudgetReallocation where Projectid in (select * from @Projectid)          
delete from CTTTrendLog where Projectid in (select * from @Projectid)          
delete from CTTPlannedVersion202 where Projectid in (select * from @Projectid)          
delete from CTTFadoMonthlyCost where Projectid in (select * from @Projectid)          
delete from CTTCoverLetterComments where Projectid in (select * from @Projectid)          
delete from CTTSummaryComments where Projectid in (select * from @Projectid)          
delete from CTTPOIntermediatePayment where Projectid in (select * from @Projectid)          
delete from CTTPOScopeMapping where Projectid in (select * from @Projectid)          
delete from CTTScopeBalanceSpendingAssigned where Projectid in (select * from @Projectid)          
delete from CTTScopeMonthlyCost where Projectid in (select * from @Projectid)          
delete from CTTActuals where Projectid in (select * from @Projectid)          
delete from CTTTransactionsDtls where Projectid in (select * from @Projectid)          
delete from CTTCostDataComments where Projectid in (select * from @Projectid)          
delete from CTTCostDataCommentsScopeLevel where Projectid in (select * from @Projectid)          
delete from CTTPOIPPosting where Projectid in (select * from @Projectid)          
          
          
delete from CTTWBSMonthlyCost where WBSid in (select * from @WBSid)          
delete from CTTPlannedVersion205C where WBSid in (select * from @WBSid)          
delete from CTTPlannedVersion205E where WBSid in (select * from @WBSid)          
delete from CTTScope where WBSid in (select * from @WBSid)          
      
update CTTWBSCosting set FieldControlEstimate =0,Budget=0,CurrentPredicted=0,RealizedTrend=0,      
PotentialTrend=0,BudgetReallocation=0,RealizedEstimate=0,SAPAssigned=0,SAPActuals=0,      
BalanceAssignedToPredict=0,BalanceSpendingToPredict=0,BalancePredDiff=0,      
GEMSpending=0,GEMAssigned=0,POSpending=0,POAssigned=0      
where WBSID in (select * from @WBSid)       
    
update CTTProjectProperties set PropertyValue = 1 where PropertyID = 35    
    
update CTTProjectStatus set CheckedOut = 'N' where ProjectID in (Select * from @Projectid)    
     */                     
end try

BEGIN CATCH  
 
  INSERT INTO E_Capital.dbo.CTTDBErrorLog  
  SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage  
        ,SYSDATETIME() AS CreatedOn  
        ,'DeleteTrainingData' AS CreatedBy  

END CATCH                            

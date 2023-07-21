public class CountOpportunityOnAccountHandler {
    public static void afterInsertUpdateOppor(List<Opportunity> opplist){
        
        //retreive AccountId from Opportunity and add in new Set of Id
        set<Id> accountIds = new Set<Id>();
		for(Opportunity opp:opplist){
            accountIds.add(opp.AccountId);
        }
        
        //Retreive record from Account which Id exist in accountids
        List<Account> accountsToUpdate = [SELECT Id, No_of_Opportunity__c, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :accountIds];
        
        //update Account's field which is the related to the inserted or updated Opportunity record
        for (Account account : accountsToUpdate) {
            account.No_of_Opportunity__c = account.Opportunities.size();
            //accountsToUpdate.add(account);
        }
        update accountsToUpdate;
    }
    
    public static void afterDeleteOppor(List<Opportunity> opplist){
        
        //retreive AccountId from deleted Opportunity
        set<Id> accountIds = new Set<Id>();
		for(Opportunity opp:opplist){
            accountIds.add(opp.AccountId);
        }
        
        
        List<Account> accountsToUpdate = [SELECT Id, No_of_Opportunity__c, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :accountIds];
        
        //Acount's field update
        for (Account account : accountsToUpdate) {
            account.No_of_Opportunity__c = account.Opportunities.size();
            //accountsToUpdate.add(account);
        }
        update accountsToUpdate;
    }
}
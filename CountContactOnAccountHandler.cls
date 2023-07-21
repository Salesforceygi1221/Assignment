public class CountContactOnAccountHandler {
    public static void afterInsertUpdateContact(List<Contact> contlist){
        
        //retreive AccountId from Contact and add in new Set of Id
        set<Id> accountIds = new Set<Id>();
		for(Contact con:contlist){
            accountIds.add(con.AccountId);
        }
        
        
        //Retreive record from Account which Id exist in accountids
        List<Account> accountsToUpdate = [SELECT Id, No_Of_Contact__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        
        //update Account which is the related to the inserted or updated Contact
        for (Account account : accountsToUpdate) {
            account.No_Of_Contact__c = account.Contacts.size();
            //accountsToUpdate.add(account);
        }
        update accountsToUpdate;
        
    }
    
    public static void afterDeleteContact(List<Contact> contlist){
        
        //retreive AccountId from deleted Contact and add in new Set of Id
        set<Id> accountIds = new Set<Id>();
		for(Contact con:contlist){
            accountIds.add(con.AccountId);
        }
        
        
        //Retreive record from Account which Id exist in accountids
        List<Account> accountsToUpdate = [SELECT Id, No_Of_Contact__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        
        //update Account's record
        for (Account account : accountsToUpdate) {
            account.No_Of_Contact__c = account.Contacts.size();
            //accountsToUpdate.add(account);
        }
        update accountsToUpdate;
    }
}
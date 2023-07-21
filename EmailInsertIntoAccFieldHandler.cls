public class EmailInsertIntoAccFieldHandler {
    public static void insertEmail(List<Contact> conlist){
        List<Account> accountsToUpdate = new List<Account>();

        for(Contact contact:conlist){
            if(contact.AccountId != Null && contact.Email != Null){
                Account ac = new Account();
                ac.Id = contact.AccountId;
                ac.accounting_description__c = contact.Email;
                accountsToUpdate.add(ac);
            }
        }
        if(!accountsToUpdate.isEmpty()){
            update accountsToUpdate;
        } 
    }
}
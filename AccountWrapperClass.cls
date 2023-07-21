public class AccountWrapperClass {
    
    public Account accRecord;
    public List<Opportunity> oppList;
    
    public AccountWrapperClass() {
        this.accRecord = new Account();
        this.oppList = new List<Opportunity>();
    }
    
    public Account getAccRecord() {
        return accRecord;
    }
    
    public void setAccRecord(Account accRecord) {
        this.accRecord = accRecord;
    }
    
    public List<Opportunity> getOppList() {
        return oppList;
    }
    
    public void setOppList(List<Opportunity> oppList) {
        this.oppList = oppList;
    }
    
    public static void accWrapClsMethod(String AccName) {
        List<Account> accountlist = [Select Id, Name, (Select Id, Name From Opportunities) From Account where Name=:AccName];
        AccountWrapperClass accwrpcls = new AccountWrapperClass();
        accwrpcls.setAccRecord(accountlist[0]);
        accwrpcls.setOppList(accountlist[0].Opportunities);
        system.debug('Account is : ' + accwrpcls.accRecord);
        system.debug('Opportunity of Accounts related list ' + accwrpcls.opplist);
    }
}



/*public class OpporForAccountWrapper {
    
    public static void accWrapClsMethod(String AccName){
        List<Account> accountlist = [Select Id, Name, (Select Id, Name From Opportunities) From Account where Name=:AccName];
        
        AccountWrapperClass accwrpcls = new AccountWrapperClass(accountlist);
        system.debug('Account is : '+accountlist);
        system.debug('Opportunity of Accounts related list '+accwrpcls.opplist);
    }
                              
    public class AccountWrapperClass{
        List<Account> acclist;
        List<Opportunity> opplist;
        
        public AccountWrapperClass(List<Account> accountlist){
            this.acclist = accountlist;
            this.opplist = accountlist[0].Opportunities;
        }
    }
}*/
@isTest
public class TestAccountWrapperClass {
	@isTest
    public static void testAccWrapClsMethod() {
        AccountWrapperClass accwrpcls = new AccountWrapperClass();
        
        Account acc = new Account(Name = 'demoAccount');
        insert acc;
        
       	List<Opportunity> opplist = new List<Opportunity>();
        for(Integer i = 1; i<=10; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'demo'+i;
            opp.CloseDate = System.today()+30;
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            opplist.add(opp);
        }
        insert opplist;
	
        Account acc1 = new Account();
        List<Opportunity> opplist1 = new List<Opportunity>();
        
        test.startTest();
        AccountWrapperClass.accWrapClsMethod(acc.Name);
        acc1 = accwrpcls.getAccRecord();
        opplist1 = accwrpcls.getOppList();
        test.stopTest();
    }
}
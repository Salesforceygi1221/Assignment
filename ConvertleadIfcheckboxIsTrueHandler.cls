public class ConvertleadIfcheckboxIsTrueHandler {
	public static void convertLeads(List<Lead> leads) {
        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        for (Lead lead : leads) {
            if (( lead.LeadSource == 'web') && lead.IsConverted == False) {
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setConvertedStatus(convertStatus.MasterLabel);
                lc.setLeadId(lead.Id);
                lc.setDoNotCreateOpportunity(true);
                leadConverts.add(lc);
            }
        }
        if (!leadConverts.isEmpty()) {
            List<Database.LeadConvertResult> results = Database.convertLead(leadConverts, false);
            for (Database.LeadConvertResult result : results) {
                if (result.isSuccess()) {
                    System.debug('Lead conversion succeeded. Account Id: ' + result.getAccountId() + ' Contact Id: ' + result.getContactId());
                    Account account = [SELECT Id FROM Account WHERE Id = :result.getAccountId()];
                    account.Lead_field__c = result.getLeadId();
                    update account;
                } else {
                    System.debug('Lead conversion failed. Lead Id: ' + result.getLeadId() + ' Error: ' + result.getErrors());
                }
            }
        }
    }
}
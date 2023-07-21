trigger ConvertleadIfcheckboxIsTrue on Lead (after insert, After update) {
    if(Trigger.IsAfter && Trigger.Isinsert) {
       ConvertleadIfcheckboxIsTrueHandler.convertLeads(Trigger.new);
    }
    if(Trigger.IsAfter && Trigger.IsUpdate) {
       ConvertleadIfcheckboxIsTrueHandler.convertLeads(Trigger.new);
    }
}
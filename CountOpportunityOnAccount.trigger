trigger CountOpportunityOnAccount on Opportunity (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
           CountOpportunityOnAccountHandler.afterInsertUpdateOppor(Trigger.new);
        }
        if(trigger.isDelete){
           CountOpportunityOnAccountHandler.afterDeleteOppor(Trigger.old);
        }
    }
}
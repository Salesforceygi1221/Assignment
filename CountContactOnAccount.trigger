trigger CountContactOnAccount on Contact (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            CountContactOnAccountHandler.afterInsertUpdateContact(Trigger.new);
        }
        if(trigger.isDelete){
            CountContactOnAccountHandler.afterDeleteContact(Trigger.old);
        }
    }
}
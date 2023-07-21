trigger EmailInsertIntoAccField on Contact (after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        EmailInsertIntoAccFieldHandler.insertEmail(trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        EmailInsertIntoAccFieldHandler.insertEmail(trigger.new);
    }
}
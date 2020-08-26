trigger AccountBeforeTrigger on Account (before update, after update, before insert, after insert) 
{
    if (Trigger.isBefore) {
            if(Trigger.isUpdate) {
                System.debug('********Trigger values B_Update***********');
                System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
                System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
            }
            if(Trigger.isInsert) {
                System.debug('********Trigger values B_Insert***********');
                System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
                System.debug('***SFDC: Trigger.new is: ' + Trigger.new);    
            }
    }
    
    if (Trigger.isAfter) {
        if(Trigger.isUpdate) {
            System.debug('********Trigger values A_Update***********');
            System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
            System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
        }
        if(Trigger.isInsert) {
            System.debug('********Trigger values A_Insert***********');
            System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
            System.debug('***SFDC: Trigger.new is: ' + Trigger.new);    
        }
       
    }
}
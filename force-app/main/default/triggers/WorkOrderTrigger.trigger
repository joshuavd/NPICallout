trigger WorkOrderTrigger on WorkOrder (before insert, before update) {
    GoingAsync1.handleTrigger2(trigger.new, trigger.oldMap, trigger.operationType);
}
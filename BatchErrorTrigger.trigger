trigger BatchErrorTrigger on BatchApexErrorEvent (after insert) {
    BatchErrorHelper.handleErrorEvents(Trigger.new);
}
public with sharing class BatchErrorHelper {
    public static void handleErrorEvents(List<BatchApexErrorEvent> events) {
        List<Error_Log__c> errorLogs = new List<Error_Log__c>();

        for(BatchApexErrorEvent event : events) {
            Error_Log__c errorLog = new Error_Log__c(
                Name = 'Batch Error ' + System.now(),
                Async_Apex_Job_Id__c = event.AsyncApexJobId,
                Message__c = event.Message
            );

            errorLogs.add(errorLog);
        }

        if (!errorLogs.isEmpty()) {
            insert errorLogs;
        }
    }
}
@isTest
public class BatchErrorTriggerTest {

    @isTest
    static void testBatchErrorTrigger() {

        AsyncApexJob job = new AsyncApexJob();

        BatchApexErrorEvent error = new BatchApexErrorEvent(Message = 'PilotRatingBatch', AsyncApexJobId = job.Id);

        Test.startTest();
        Database.SaveResult sr = EventBus.publish(error);
        Test.stopTest();

        System.assertEquals(true, sr.isSuccess());

        Integer errorCount = [SELECT Count() FROM Error_Log__c];

        System.assertEquals(1, errorCount);
    }
}
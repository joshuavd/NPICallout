
public with sharing class NPICallOut {

    @InvocableMethod(label='NPI API' description='API call to NPI database' category='Contact')
    public static void passContactIds(List<String> contactIds) {
        callOutandUpdate(contactIds);
    }

    @future (callout=true)
    private static void callOutandUpdate(List<string> contactIds) {
        List<Contact> contacts= [SELECT Id, NPI_Number__c, SubSpecialty__c FROM Contact WHERE Id IN :contactIds];
        for(Contact c : Contacts){
            string NPI = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number='+ c.NPI_Number__c;
    
            HttpRequest req = new HttpRequest();
            req.setEndpoint(NPI);
            req.setMethod('GET');
    
            Http http = new Http();
            HttpResponse res = http.send(req);
            string updatedresponse = res.getBody().replace('"desc":', '"desc_Z":');
            System.debug('resbody:'+updatedresponse);
            JSON2Apex response = (JSON2Apex)JSON.deserialize(updatedresponse, JSON2Apex.Class);
            System.debug(response);
    
            if(response != null && response.result_count == 1){
                for(JSON2Apex.Taxonomies t: response.Results[0].taxonomies){
                    if(t.primary) {
                        c.SubSpecialty__c = t.desc_Z;
                    }
                }
            }
        }
        update contacts;
    }
}
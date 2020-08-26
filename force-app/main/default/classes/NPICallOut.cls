public with sharing class NPICallOut {

    public static void getDetails() {
        string NPI = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number=1902863541';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(NPI);
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug('resbody:'+res.getBody());
            JSON2Apex des = JSON2Apex.Parse(res.getBody());
            for(JSON2Apex.Taxonomies  tax:  des.results){
                string contactName;
                if(tax.Primary){
                    contactName = tax.desc_T;
                    system.debug('contactName +++ '+ contactName);
                }
            }
        System.debug('result-debug'+des.results);
    }
}
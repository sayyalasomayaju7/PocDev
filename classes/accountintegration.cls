public class accountintegration{

// CHANGE1 CLASS 1
// CHANGE 2 SUURESH

//@future (callout = true)

public static void postaccounts()
{

list<account> acclist = [select id, name, AccountNumber, phone from account limit 9];

 
for (account acc : acclist) {


string body1 = '{"toBottom":true, "rows":[{"cells":[  {"columnId": 841780003399556, "value": "valfield1"},  {"columnId": 5345379630770052, "value": "valfield2"}, {"columnId": 3093579817084804, "value": "valfield3"},  {"columnId": 7597179444455300, "value": "valfield4"}  ] } ] }';

 body1 = body1.replace('valfield1', acc.id);
 
 body1 = body1.replace('valfield2', acc.name);
 

 body1 = body1.replace('valfield3', acc.AccountNumber);

 body1 = body1.replace('valfield4', acc.phone);

system.debug('@@@@'+acc.id+acc.name);

HTTPRequest req = new HTTPRequest();

req.setmethod('POST');

req.setendpoint('https://api.smartsheet.com/1.1/sheet/1903091252520836/rows');
 
req.setheader('Authorization', 'Bearer 5h1iv7ips9jrs58ahzwtea7paj');
req.setheader('Content-Type:', 'application/json');

req.setbody(body1);


req.setTimeout(20000);

Http hobj = new Http();


HTTPResponse res = hobj.send(req);


JSONParser parser = JSON.createParser(res.getBody());

System.debug('@@@ response '+ res.getBody());

system.debug('@@@@ suresh '+parser.getCurrentToken());

if (res.getStatusCode() != 200) {

System.debug('Error from ' + req.getEndpoint() + ' : ' +
res.getStatusCode() + ' ' + res.getStatus());
}
}

}
}
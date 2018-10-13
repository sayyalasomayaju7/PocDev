public class Acct_extension2 {

public boolean boo;

public  account acct;

public acct_extension2(apexpages.standardcontroller controller){

this.acct = (Account)controller.getRecord();

}
public boolean retboo(){

if( (acct.type=='Prospect')){
system.debug('sureshkumar true test');
return false;
} else {
system.debug('sureshkumar false test');
return true;
}



}

}
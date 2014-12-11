//+------------------------------------------------------------------+
//|                                                          P&L.mq4 |
//|                                           http://breakermind.com |
//+------------------------------------------------------------------+
#property copyright   "2014 Breakermind.com"
#property link        "https://breakermind.com"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input bool Start = true;
input string Trader = "WooW";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
{
 EventSetMillisecondTimer(5000);       
}

void OnTimer(void)
  {
 
if(Start)
  {
 
   string cookie=NULL;
   string headers;
   char post[],result[];
   int res;
   string url = "http://localhost/api-balance.php";
   
   string signal = "account="+AccountNumber()+"&balance="+AccountBalance()+"&equity="+AccountEquity()+"&user="+Trader+"&end=0";
   Print("REST client's POST: ",signal);
   StringToCharArray(signal,post);
      
   ResetLastError();
   int timeout=5000;
   res=WebRequest("POST",url,cookie,NULL,timeout,post,0,result,headers);
   //MessageBox("Send positions ...");
   if(res==-1)
     {
      Print("Error code =",GetLastError());
      MessageBox("Add address '"+url+"' in Expert Advisors tab of the Options window","Error",MB_ICONINFORMATION);
     }
   else
     {
      //--- successful
      PrintFormat("Download successful, size =%d bytes.",ArraySize(result));
      //Print("Server response:",CharArrayToString(result,0));
      //--- save data to file
      int filehandle=FileOpen("Balance"+Trader+".htm",FILE_WRITE|FILE_BIN);
      //--- check
      if(filehandle!=INVALID_HANDLE)
        {
         //--- write result[] array to file
         FileWriteArray(filehandle,result,0,ArraySize(result));
         //--- close file
         FileClose(filehandle);
        }
      else Print("Error in FileOpen. Error code=",GetLastError());
     }

   } 
}

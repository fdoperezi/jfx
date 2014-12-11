//+------------------------------------------------------------------+
//|                                         BreakermindMT4Master.mq4 |
//|                             Copyright 2011-2014, Breakermind.com |
//|                                          https://breakermind.com |
//+------------------------------------------------------------------+
#property copyright   "© 2011-2014, Breakermind.com"
#property link        "https://breakermind.com"

// const
input bool Start = true;
input int Timer = 5000;
input bool   ssl = false;
input string url="localhost";
//variables
int Refresh = Timer;  
string apiurl;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
{
 if(Refresh < 5000){ Refresh = 5000; }
 EventSetMillisecondTimer(Refresh);       
 
   // api url http or https(ssl)
   if(ssl){
      apiurl = "https://" + url + "/api.php"; 
   }
   if(!ssl){
      apiurl = "http://" + url + "/api.php"; 
   }  
    
}//end
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer(void)
  {

   if(!Start){ Print("On EA first!"); return;  }
   
   string signal = "&account="+AccountNumber()+"&balance="+AccountBalance()+"&equity="+AccountEquity()+"&end=0";
    
  // Client's HTTP/S vars
   
   char post[];
   char result[];
   string headers;
   int res;   
   string send = "";
   string positions = "";   
   string historyall = "";
   
     
   // obtain the total number of orders
   int orders=OrdersTotal();
   // scan the list of orders
   for(int i=0;i<orders;i++)
     {
     if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
     Print("Position error ",GetLastError());
     break;
     }
         if(OrderType() <= OP_SELL){   
            //--- set orders signals
            string time   = OrderOpenTime();
            string ticket = OrderTicket();
            string open   = OrderOpenPrice();
            string lot    = OrderLots();
            string symbol = OrderSymbol();
            string type   = OrderType();
            string sl     = OrderStopLoss();
            string tp     = OrderTakeProfit();
            string profit = OrderProfit();
            string comment = OrderComment();   
            positions = positions + time + ";" + ticket + ";" + open + ";" + symbol + ";" + lot + ";" + type + ";" + sl + ";" + tp + ";" + profit + ";" + AccountNumber() +"|";
         }
     }


      // get orders history tickets id
   int ii, hTotal;
   hTotal= OrdersHistoryTotal();
   for(ii=0;ii<hTotal;ii++)
     {
      if(OrderSelect(ii,SELECT_BY_POS,MODE_HISTORY)==false)
        {
         Print("History Error ",GetLastError());
         break;
        }
      // get history positions
      if(OrderType()<=OP_SELL)
        {
         string timeh   = OrderOpenTime();
         string ticketh = OrderTicket();
         string openh   = OrderOpenPrice();
         string loth    = OrderLots();
         string symbolh = OrderSymbol();
         string typeh   = OrderType();
         string slh     = OrderStopLoss();
         string tph     = OrderTakeProfit();
         string profith = OrderProfit();
         string closetimeh=OrderCloseTime();
         string closepriceh=OrderClosePrice();
         historyall = historyall + timeh + ";" + ticketh + ";" + openh + ";" + symbolh + ";" + loth + ";" + typeh + ";" + slh + ";" + tph + ";" + closetimeh + ";" + closepriceh + ";" + profith + ";" + AccountNumber() +"|";                   
            
        }// if end

    }


      //int BarOpenTime = iTime(NULL, PERIOD_M1, 0);      
      // post data to send to server
      send = 
      "&accountid=" +AccountNumber() + 
      "&time=" + TimeCurrent() + 
      "&positions=" + positions +
      "&historyall=" + historyall +
      "&balance=" + AccountBalance() +
      "&equity=" + AccountEquity()+"&end=0";

      Print("Client's send: ",send);
      StringToCharArray(send,post);
      // reset last error
      ResetLastError();
      // post data to HTTP server API
      res=WebRequest("POST",apiurl,NULL,NULL,50,post,ArraySize(post),result,headers);
      
      // check errors
      if(res==-1)
        {
         Print("Error code =",GetLastError());
         // maybe the URL is not added, show message to add it
         Print("Add address '"+apiurl+"' in Expert Advisors tab of the Options window","Error",MB_ICONINFORMATION);
        }
      else
        {
         // successful
         Print("Server response:",CharArrayToString(result,0));
        }      
            

}//end
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick(void)
  {
 
  }//end    
//+------------------------------------------------------------------+

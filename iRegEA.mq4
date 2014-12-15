//+------------------------------------------------------------------+
//|                                                         iReg.mq4 |
//| whitout trailing only sl and tp works on many periods independent|
//+------------------------------------------------------------------+
#property copyright   "breakermind.com"
#property link        "http://breakermind.com"

input double TP    = 500;
input double SL      = 500;
input double Lots          = 0.01;
input double TrailingStop  = 30;

int total, ticket, cnt, total1, total2, total3;
double reg, regUp, regDn;
string comment;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

// File identificator
int file;
 
// Tick count for flushing each 1024 ticks
int flushCount = 0;
 
int OnInit() {
 EventSetMillisecondTimer(1000);  
 comment = Symbol() + "_" + Period();
}

void OnTimer(void)
  {
  

      string str = "";

      int timeOpen  = iTime(NULL,PERIOD_M1,1);
      int time = TimeCurrent();
      
      double high  = iHigh(NULL,PERIOD_M1,1);
      double low   = iLow(NULL,PERIOD_M1,1);
      double open  = iOpen(NULL,PERIOD_M1,1);
      double close = iClose(NULL,PERIOD_M1,1);
      
      
      double Up = iCustom(NULL, 0, "Regresion", 3,2,2000,1,0);
      double Dn = iCustom(NULL, 0, "Regresion", 3,2,2000,2,0);
      
      
      //Print(Digits + " Point : " + Point + " : " + Symbol());
      str = time + ";" + Symbol() + ";" + timeOpen +";" + Ask + ";" + Bid + ";" + open + ";" + close + ";" + Up + ";" + Dn + "|" + comment + "|";
      Print(str);

     
      FileAppend("moj_plik.txt",str); 
      FileAppendLog(str); 
      
      Print("EXIST " + OrderSymbolExist(comment));

      if(!OrderSymbolExist(comment))
        {
         
         //--- sell conditions
         int res;
         if(Ask > Up)
           {
           Print("Set new order with comment(Symbol_Period) : " + comment);
            res=OrderSend(Symbol(),OP_SELL,0.01,Bid,3,Ask+SL*Point,Bid-TP*Point,comment,0,0,Red);
            Print("Error opening BUY order : ",GetLastError());
            return;
           }
      //--- buy conditions
         if(Bid < Dn)
           {
           Print("Set new order with comment(Symbol_Period) : " + comment);
            res=OrderSend(Symbol(),OP_BUY,0.01,Ask,3,Bid-SL*Point,Ask+TP*Point,comment,1,0,Blue);
            Print("Error opening BUY order : ",GetLastError());
            return;
           }
      //---         
      }  
//---
  }
//+------------------------------------------------------------------+

bool OrderSymbolExist(string comment)
{
      int total=OrdersTotal();
      // write open orders
      for(int pos=0;pos<total;pos++)
      {
         if(OrderSelect(pos,SELECT_BY_POS)!=false){
           if(OrderSymbol() == Symbol() && OrderComment() == comment)
           {
            //Print(total + " Order with symbol: " + Symbol() + " exists.");
            return(1);
           }      
          }else{
              return(0);
          } 
      }
}

// ------------------ write to file (file name, string)
void FileAppend(string name,string txt)
{
   int handle = FileOpen(name,FILE_TXT|FILE_READ|FILE_WRITE);
   if(handle<1)
   {
    Print("Błąd zapisu = ",GetLastError());
    return(0);
   }
	FileSeek(handle,0,SEEK_END);
	FileWrite(handle,txt);
	FileFlush(handle);
	FileClose(handle);
} 

//-------------------write to file: Symbol() + "-" + Hour()+".txt" 
void FileAppendLog(string txt)
{
   int handle = FileOpen(Symbol() + "-" + Year() + "-" + Month() + "-" + Day() + "-" + Hour() + "-dayofyear-" + DayOfYear() + ".txt",FILE_TXT|FILE_READ|FILE_WRITE);
   if(handle<1)
   {
    Print("Błąd zapisu = ",GetLastError());
    return(0);
   }
	FileSeek(handle,0,SEEK_END);
	FileWrite(handle,txt);
	FileFlush(handle);
	FileClose(handle);
}

//-------------------------------------------------------------------------------------------------- 
   //regUp = iCustom(NULL, 0, "Regresion", 3,2,2000,1,0);
   //regDn = iCustom(NULL, 0, "Regresion", 3,2,2000,2,0);
   
   
         //SELECT_BY_POS - index in the order pool,
         //SELECT_BY_TICKET - index is order ticket.
         //MODE_TRADES (default)- order selected from trading pool(opened and pending orders),
         //MODE_HISTORY - order selected from history pool (closed and canceled order).
         
         //FileWrite(handle,OrderTicket(),OrderOpenPrice(),OrderOpenTime(),OrderSymbol(),OrderLots());
         //  && OrderType()==OP_BUY || OrderType()==OP_SELL

extern int Event_Hour_in_GMT = 14;
extern int Event_Minute_in_GMT = 7;
extern int Entry_Second = 55;
extern int pipsAway = 3;
extern double lot = 0.01;
extern int numberofHalfOrder = 4;
//extern int stopLoss = 20;
extern int newsDelayT = 5;
extern int magic_Number = 1;

int evh = Event_Hour_in_GMT;
int evm = Event_Minute_in_GMT;
int ens = Entry_Second;

double orderAsk;
double orderBid;
int bias = pipsAway;
int ttl = numberofHalfOrder;
  
double point;
int t3, t=0, t2=0;
int dReapt = 0;
int modfyChkr=0;
int modfyChkr2 = 0;
int timer_counter = 0;
int BB5sec = 0;
int carry, mcarry, enss, five_secs = 0;
//----
   
int buystopticket[];
int sellstopticket[];
string orderOTi[ ];
string orderOTi2[ ];



void OnInit()
{
   EventSetMillisecondTimer(50);
}

void OnDeinit(const int reason)
{
    EventKillTimer();
}



void delBstopSstop()
{
// AUTO DELETE PENDING ORDERS 
int BB, SS, BS, ST, BL, SL = 0;

if (OrdersTotal()>1)
 {
   //while(1)
   //{
  // Sleep(500);        
   for (int k = 0; k < OrdersTotal(); k++) 
       {
     int checkselect = OrderSelect(k, SELECT_BY_POS, MODE_TRADES);
   
         if (OrderType() == OP_BUY ){ BB = 1;}
         if (OrderType() == OP_SELL){ SS = 1;} 
         if (OrderType() == OP_BUYSTOP ){ BS = 1;}
         if (OrderType() == OP_SELLSTOP){ ST = 1;} 
         if (OrderType() == OP_BUYLIMIT ){ BL = 1;}
         if (OrderType() == OP_SELLLIMIT){ SL = 1;} 
                   
         }
      if (BB == 1 || SS ==1){del_pending(); //break;
      }
      if (OrdersTotal()==0){//break;
      }
    //}
 
  }

}

/*
void modifyStoploss()
{

   for(int lkj=OrdersTotal()-1; lkj>=0; lkj--){
   
      //Select the order, if not selected print the error and continue with the next index
      if( OrderSelect( lkj, SELECT_BY_POS, MODE_TRADES ) == false ) {
         Print("ERROR - Unable to select the order - ",GetLastError());
         continue;
      } 
      
      if(OrderSymbol()!=Symbol()) continue;
      //Prepare the prices
      double TakeProfitPricej=0;
      double StopLossPricej=0;
      double OpenPricej=OrderOpenPrice();
      double exstinSL = OrderStopLoss();
   
      if(OrderType()==OP_BUY){
        // TakeProfitPrice=NormalizeDouble(OpenPrice+TakeProfit*nDigits,Digits);
         StopLossPricej=NormalizeDouble(OpenPricej-(stopLoss)*point,Digits);
         }  
      if(OrderType()==OP_SELL){
         //TakeProfitPrice=NormalizeDouble(OpenPrice-TakeProfit*nDigits,Digits);
         StopLossPricej=NormalizeDouble(OpenPricej+(stopLoss)*point,Digits);
    
      }
      if(exstinSL != 0){
         StopLossPricej=exstinSL;
     
      }
      
      int expirationj = OrderExpiration();
      if (expirationj - TimeCurrent() < 660) expirationj = TimeCurrent() + 660;
         
      //Try to modify the order
      if(modfyChkr2==0){if(lkj==0){modfyChkr2=1;}
      if(OrderType()==OP_BUY || OrderType()==OP_SELL){
      if((OrderModify(OrderTicket(),OpenPricej,StopLossPricej,TakeProfitPricej,expirationj,clrNONE)) ){
      }
      else{
         Print("Order failed to update with error - ",GetLastError());
      }  }  }
 }

}*/


void OnTimer()
{

point=MarketInfo(Symbol(),MODE_POINT);

delBstopSstop();   
if(TimeHour(TimeLocal())== evh && TimeMinute(TimeLocal())== evm && TimeSeconds(TimeLocal())==ens)
 { 
 timer_counter = 1;
// BUYSTOPS
   if(t < 1)
     {
      for(int i=0; i<ttl; i++)
      {
         orderAsk = Ask + bias * Point;
         buystopticket[i]=OrderSend(Symbol(),OP_BUYSTOP,lot,orderAsk,1,0,0,"expert comment",magic_Number,0,Green); 
         int checkselect1 = OrderSelect(buystopticket[i], SELECT_BY_TICKET, MODE_TRADES); 
      }
      t=t+1;
       }   
                  
      else
      Print("OrderSelect returned the error of ",GetLastError());
      

      
// SELLSTOPS
   if(t2 < 1)
     {
      for(int j=0; j<ttl; j++)
      {
         orderBid = Bid - bias * Point;
         sellstopticket[j]=OrderSend(Symbol(),OP_SELLSTOP,lot,orderBid,1,0,0,"expert comment",magic_Number,0,Red);
         int checkselect2 = OrderSelect(sellstopticket[j], SELECT_BY_TICKET, MODE_TRADES);
      }
      t2=t2+1;
       }   
                  
      else
      Print("OrderSelect returned the error of ",GetLastError());

      t3=t3+1;        
 }    

int spread = MarketInfo(Symbol(),MODE_SPREAD);
//if(spread>stopLoss && dReapt==0){stopLoss=spread+7; dReapt=1;}
//modifyOrders();
//modifyStoploss();
delBstopSstop();



// CLOSE PENDING ORDER AFTER 5 SECS IF NOT HIT
    for(int vbx=OrdersTotal()-1;vbx>=0;vbx--){
          int vbOrdselect = OrderSelect(vbx,SELECT_BY_POS,MODE_TRADES);
          if(OrderType()==OP_BUY || OrderType()==OP_SELL){ BB5sec = 1;}
                             
                                             }
if(ens+newsDelayT >= 60){enss = (ens+newsDelayT)- 60; mcarry = 1;}
if(ens+newsDelayT < 60){enss = ens+newsDelayT;}
if(TimeHour(TimeLocal())== evh && TimeMinute(TimeLocal())== evm + mcarry && 
TimeSeconds(TimeLocal())== enss && timer_counter==1 && BB5sec==0){del_pending(); five_secs=1;}
// END OF 5 SECS STUFF      

if(five_secs == 1){del_pending();}
    
}


void del_pending()
  {
     
    for(int x=OrdersTotal()-1;x>=0;x--){
          int Ordselect = OrderSelect(x,SELECT_BY_POS,MODE_TRADES);
          if((OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP) && OrderMagicNumber()==magic_Number){
              int orddel = OrderDelete(OrderTicket());}
                                             } 
   }
   
   
// modify stoploss only works if you load it on a chart that has an executed order only
//it doesnt function as should
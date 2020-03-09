
input double TakeProfit    =250;
input double StopOut       =50;
//input double Lots          =0.10;
input double TrailingStop  =0;
extern int No_of_Candles = 10000;   //Number of candles to scan
double lot = 0.10;
extern int peri_d = 50;
//H4= AUDUSD:50, EURUSD:50 GBPUSD:20 USDJPY:120(B)
//D1= AUDUSD EURUSD 50, GBPUSD 70, GBPCAD 0 TP:3000/4000 etc,  ;

double high[10000] = {0};
double low[10000] = {0};
double open[10000] = {0};
double close[10000] = {0};
double CurntLvl20[10000] = {0};
double CurntLvl80[10000] = {0};
int Phrs_1[10000] = {0};
int Phrs_2[10000] = {0};
int Phrs_3[10000] = {0};
int Phrs_4[10000] = {0};
int Phrs_5[10000] = {0};
double cclose[1] = {0};
double oopen[1] = {0};
double hhigh[1] = {0};
double llow[1] = {0};
int cnt,ticket,total, p,goo,sellnow,buynow, stpchk,gg=0;

double EMA_t, Pr, EMA_y, SMA = 0;
double Ks = 0;int chke, chke2, ii= 0;

double zigzag_val[10000] = {};
double zigzag_barNumb[10000] = {};
int cntr1=0, barstocount=300, hj=0, hjj=0, goahead=0;
double bounce = 0;
int bounce2,mcntr = 0;

int strd_S =1, strd_B=0, opTP_B=0, opTP_S=0, exe2t=0, exe2tt=0, zz=0;
int place_SO=0,buytime=0, selltime=1,dytrp=0;
int place_BO=0, otherside=0, otherside2=0, day=0;
double orderAsk=0, orderBid=0, buyprice=0;
double sellprice=0, op_buy=0, MacdCurrent=0, Highest=0;
int bias=StopOut;


     string tradpairs = NULL;
     string timeframe = 0;
     int j=0;  
     int tth =0;
     double tTkp=0;
     double Lowest=0;
     double highest=0;
     int b=0;
     int buyr=0, sellr=0;
     double st_B =0, st_S=0;
     int bt_chkr=0, st_chkr=0;
     int b_hiside = 0, bt_chkr_ins=0, s_hiside=0, st_chkr_ins=0, s_hiside2=0, b_hiside2=0 ;
     int wrink=0, wrink2=0, buyb4=0, sellb4=0;



void OnInit()
{

   EventSetMillisecondTimer(50);
}

void OnDeinit(const int reason)
{
    EventKillTimer();
}


void OnTick()
{
double MaCurrent=0;
double rsi =0;
MaCurrent=iMA(NULL,0,30,0,MODE_EMA,PRICE_CLOSE,0);
rsi = iRSI(NULL,0,14,PRICE_CLOSE,0);

double mid_Val1 =0,mid_Val2 =0,mid_Val3 =0,mid_Val4 =0,mid_Val5 =0;
int i=0; i=0;
int allow =1;
int allow2 =1;
int allow3 =1;
int allow4 =1;
int allow5 =1;
int allow6 =1;
int allow7 =1;
int range =0;
   range=180;

mid_Val1 = 0.50*(iHigh(tradpairs,0, i+1) - iLow(tradpairs,0, i+1)) +iLow(tradpairs,0, i+1);
mid_Val2 = 0.50*(iHigh(tradpairs,0, i+2) - iLow(tradpairs,0, i+2)) +iLow(tradpairs,0, i+2);  
mid_Val3 = 0.50*(iHigh(tradpairs,0, i+3) - iLow(tradpairs,0, i+3)) +iLow(tradpairs,0, i+3);    
mid_Val4 = 0.50*(iHigh(tradpairs,0, i+4) - iLow(tradpairs,0, i+4)) +iLow(tradpairs,0, i+4);  
mid_Val5 = 0.50*(iHigh(tradpairs,0, i+5) - iLow(tradpairs,0, i+5)) +iLow(tradpairs,0, i+5);

    i=1;
    
// Bearish Morning Star
   int allowMst=0, allowMst2=0, allowMst3=0, allowMst4=0, allowMst5=0, allowMst6=0;
      allowMst=0; allowMst2=0; allowMst3=0; allowMst4=0; allowMst5=0; allowMst6=0;
         
if(  iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1)>0
     &&iHigh(tradpairs,0, i+1)- iClose(tradpairs,0, i+1)>=1.5*(iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1))
     //&&iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1) >= iOpen(tradpairs,0, i+1) - iLow(tradpairs,0, i+1)
  ){allowMst=1;}  else allowMst=0;

if(  iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1)>0
     &&iHigh(tradpairs,0, i+1)- iOpen(tradpairs,0, i+1)>=1.5*(iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1))
    // &&iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1) >= iClose(tradpairs,0, i+1) - iLow(tradpairs,0, i+1)
  ){allowMst2=1;} else allowMst2=0;
  

    
    if(iTime(tradpairs,PERIOD_M1,0)>= s_hiside
  // && st_chkr_ins!=st_chkr
  //&& MarketInfo(tradpairs,MODE_BID)- MaCurrent<=700*MarketInfo(Symbol(),MODE_POINT)
 // && rsi >=40
 //  && rsi <=65
  )
{
     if(iHigh(tradpairs, PERIOD_D1, 0)==iHigh(tradpairs, PERIOD_H1, 1)&&
     ((iClose(tradpairs,0, i)-iOpen(tradpairs,0, i)>0 && 
     !(iClose(tradpairs,0, i)-iOpen(tradpairs,0, i)>0
     && 2*(iClose(tradpairs,0, i)-iOpen(tradpairs,0, i))>iHigh(tradpairs,0, i) - iClose(tradpairs,0, i))) ||
     
     (iOpen(tradpairs,0, i)-iClose(tradpairs,0, i)>0 && 
     !(iOpen(tradpairs,0, i)-iClose(tradpairs,0, i)>0
     && 2*(iOpen(tradpairs,0, i)-iClose(tradpairs,0, i))>iClose(tradpairs,0, i) - iLow(tradpairs,0, i)))
     )
     
      && iClose(NULL, PERIOD_D1, 0)-iOpen(NULL, PERIOD_D1, 0)>300*MarketInfo(NULL,MODE_POINT)
      &&iHigh(NULL, PERIOD_H1, 0)-iLow(NULL, PERIOD_H1, 0)>100*MarketInfo(NULL,MODE_POINT)
      
     )
    { st_S =   iHigh(tradpairs,0, 1);

placesellord(250,450); 
s_hiside = iTime(tradpairs,PERIOD_M1,0) + (60*60);
     }    

sellb4=0;
}


// Bullish Forward Engulfing 
if(TimeHour(TimeCurrent())<=4
   &&(((MathAbs(mid_Val1 - mid_Val2)<= 40*MarketInfo(Symbol(),MODE_POINT))
   &&iHigh(tradpairs,0, i+1) - iLow(tradpairs,0, i+1)<= range*MarketInfo(Symbol(),MODE_POINT)
   &&iHigh(tradpairs,0, i+2) - iLow(tradpairs,0, i+2)<= range*MarketInfo(Symbol(),MODE_POINT))||
   ((MathAbs(mid_Val2 - mid_Val3)<= 40*MarketInfo(Symbol(),MODE_POINT))
   &&iHigh(tradpairs,0, i+2) - iLow(tradpairs,0, i+2)<= range*MarketInfo(Symbol(),MODE_POINT)
   &&iHigh(tradpairs,0, i+3) - iLow(tradpairs,0, i+3)<= range*MarketInfo(Symbol(),MODE_POINT)))
){allow =0;} else allow =1;
if(TimeHour(TimeCurrent())<=4
   &&((iLow(tradpairs, PERIOD_D1, 0)<iLow(tradpairs, PERIOD_H1, 1)
   && h_Fwd_engulf_pat_B(0,1)==1 && iLow(tradpairs, PERIOD_H1, 1)-iLow(tradpairs, PERIOD_D1, 0)<150*MarketInfo(tradpairs,MODE_POINT))||
   MathAbs(iClose(tradpairs,PERIOD_D1, 0) - iOpen(tradpairs,PERIOD_D1, 0))<=200*MarketInfo(Symbol(),MODE_POINT)
   ))
{allow2 =0;} else allow2 =1;
if(iOpen(tradpairs, PERIOD_D1, 3)-iClose(tradpairs, PERIOD_D1, 1)>=1500*MarketInfo(tradpairs,MODE_POINT))
{allow3 =0;} else allow3 =1;
// FwdEngulf
if( ((iLow(tradpairs, PERIOD_D1, 0)==iLow(tradpairs, PERIOD_H1, 1)
   && h_Fwd_engulf_pat_B(0,0)==1)||
   (iLow(tradpairs, PERIOD_D1, 0)<iLow(tradpairs, PERIOD_H1, 1)
   && h_Fwd_engulf_pat_B(0,1)==1 && iLow(tradpairs, PERIOD_H1, 1)-iLow(tradpairs, PERIOD_D1, 0)<150*MarketInfo(tradpairs,MODE_POINT)))
     
   && iTime(tradpairs,PERIOD_M1,0)>= b_hiside
 // (iLow(tradpairs, PERIOD_H1, 1)-iLow(tradpairs, PERIOD_D1, 0)<250*MarketInfo(tradpairs,MODE_POINT)&&h_Fwd_engulf_pat_B(0,1)==1
   // &&iClose(tradpairs, PERIOD_H1, 1)-iLow(tradpairs, PERIOD_D1, 0)<450*MarketInfo(tradpairs,MODE_POINT))
   && bt_chkr_ins!=bt_chkr && TimeHour(TimeCurrent())>=3 && TimeHour(TimeCurrent())<=19 //&& MaCurrent>MarketInfo(tradpairs,MODE_BID)
   
   &&(iClose(tradpairs, PERIOD_D1, 1)-iOpen(tradpairs, PERIOD_D1, 1)<550*MarketInfo(tradpairs,MODE_POINT)||
   (iClose(tradpairs, PERIOD_D1, 1)- iOpen(tradpairs, PERIOD_D1, 1) >550*MarketInfo(tradpairs,MODE_POINT) && 
   iOpen(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_D1, 0)>800*MarketInfo(tradpairs,MODE_POINT)))&&

  (iOpen(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_D1, 0)>400*MarketInfo(tradpairs,MODE_POINT)||
   iOpen(tradpairs, PERIOD_D1, 1)-iClose(tradpairs, PERIOD_D1, 1)>400*MarketInfo(tradpairs,MODE_POINT)||
   (iOpen(tradpairs, PERIOD_D1, 1)-iClose(tradpairs, PERIOD_D1, 1)>120*MarketInfo(tradpairs,MODE_POINT)&&
   iOpen(tradpairs, PERIOD_D1, 2)-iClose(tradpairs, PERIOD_D1, 2)>120*MarketInfo(tradpairs,MODE_POINT))||
   (iOpen(tradpairs, PERIOD_D1, 3)-iClose(tradpairs, PERIOD_D1, 3)>700*MarketInfo(tradpairs,MODE_POINT)&&
   iOpen(tradpairs, PERIOD_D1, 3)-iClose(tradpairs, PERIOD_D1, 1)>450*MarketInfo(tradpairs,MODE_POINT))
   ) 
  /*&&!(
  iHigh(tradpairs, 0, 1)- iLow(tradpairs, 0, 1)<150*MarketInfo(tradpairs,MODE_POINT)&&
  iHigh(tradpairs, 0, 2)- iLow(tradpairs, 0, 2)<150*MarketInfo(tradpairs,MODE_POINT)&&
  iHigh(tradpairs, 0, 3)- iLow(tradpairs, 0, 3)<150*MarketInfo(tradpairs,MODE_POINT)
  )*/
   &&!((MathAbs(mid_Val1 - mid_Val2)<= 40*MarketInfo(Symbol(),MODE_POINT)&&
   MathAbs(mid_Val1 - mid_Val3)<= 40*MarketInfo(Symbol(),MODE_POINT)&&
   MathAbs(mid_Val2 - mid_Val3)<= 40*MarketInfo(Symbol(),MODE_POINT))
   &&iHigh(tradpairs,0, i+1) - iLow(tradpairs,0, i+1)<= range*MarketInfo(Symbol(),MODE_POINT)
   &&iHigh(tradpairs,0, i+2) - iLow(tradpairs,0, i+2)<= range*MarketInfo(Symbol(),MODE_POINT)
   &&iHigh(tradpairs,0, i+3) - iLow(tradpairs,0, i+3)<= range*MarketInfo(Symbol(),MODE_POINT))     
  
   && allow==1 && allow2==1 &&allow3 ==1 && rsi >=35 
   
  ){
//   h_placebuyord(450,450);
   b_hiside = iTime(tradpairs,PERIOD_M1,0) + (60*60);
   }



// Morning Star
   //Bullish
   int allowMs=0, allowMs2=0, allowMs3=0, allowMs4=0, allowMs5=0, allowMs6=0;
         i=1; allowMs=0; allowMs2=0; allowMs3=0; allowMs4=0; allowMs5=0; allowMs6=0;
         
if(  iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1)>0
     &&iOpen(tradpairs,0, i+1)- iLow(tradpairs,0, i+1)>=1.5*(iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1))
     &&iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1) >= iHigh(tradpairs,0, i+1) - iClose(tradpairs,0, i+1)
  ){allowMs=1;}  else allowMs=0;

if(  iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1)>0
     &&iClose(tradpairs,0, i+1)- iLow(tradpairs,0, i+1)>=1.5*(iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1))
     &&iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1) >= iHigh(tradpairs,0, i+1) - iOpen(tradpairs,0, i+1)
  ){allowMs2=1;} else allowMs2=0;
  
if(!(iClose(tradpairs,0, i)-iOpen(tradpairs,0, i)>0
     && 2*(iClose(tradpairs,0, i)-iOpen(tradpairs,0, i))>iHigh(tradpairs,0, i) - iClose(tradpairs,0, i))
  ){allowMs3=1;} else allowMs3=0; 


if(iTime(tradpairs,PERIOD_M1,0)>= b_hiside2 //&& TimeHour(TimeCurrent())>=5
  )
{     if((iLow(tradpairs, PERIOD_D1, 0)==iLow(tradpairs, PERIOD_H1, 1)||
     iLow(tradpairs, PERIOD_D1, 0)==iLow(tradpairs, PERIOD_H1, 2)||
     iLow(tradpairs, PERIOD_D1, 0)==iLow(tradpairs, PERIOD_H1, 3))&&
     
     iOpen(tradpairs,0, i+2) - iClose(tradpairs,0, i+2) > 20*MarketInfo(Symbol(),MODE_POINT)&&
     iOpen(tradpairs,0, i+2) - iClose(tradpairs,0, i+2) < 400*MarketInfo(Symbol(),MODE_POINT)&&
     
     ((iClose(tradpairs,0, i+1)- iOpen(tradpairs,0, i+1)>10*MarketInfo(Symbol(),MODE_POINT)&&
     iClose(tradpairs,0, i+1)- iOpen(tradpairs,0, i+1)<50*MarketInfo(Symbol(),MODE_POINT))||
     (iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1) >0*MarketInfo(Symbol(),MODE_POINT)
     &&iOpen(tradpairs,0, i+1) - iClose(tradpairs,0, i+1) <50*MarketInfo(Symbol(),MODE_POINT))
     )&& iLow(tradpairs,0, i+1)<iLow(tradpairs,0, i) && iLow(tradpairs,0, i+1)<iLow(tradpairs,0, i+2)&&
     
     ((iOpen(tradpairs,0, i)-iClose(tradpairs,0, i) >0*MarketInfo(Symbol(),MODE_POINT)&&
     iOpen(tradpairs,0, i)-iClose(tradpairs,0, i )<50*MarketInfo(Symbol(),MODE_POINT))
     ||(iClose(tradpairs,0, i)- iOpen(tradpairs,0, i)>0*MarketInfo(Symbol(),MODE_POINT)
     &&iClose(tradpairs,0, i)- iOpen(tradpairs,0, i)<200*MarketInfo(Symbol(),MODE_POINT))) 
     
     
     &&iClose(tradpairs, PERIOD_H1, i)-iLow(tradpairs, PERIOD_D1,0)>0*MarketInfo(tradpairs,MODE_POINT)
     &&iClose(tradpairs, PERIOD_H1, i)-iLow(tradpairs, PERIOD_D1,0)<450*MarketInfo(tradpairs,MODE_POINT)
     
     &&( allowMs==1 || allowMs2==1)
      //&& allowMs3== 1 
     //&& allowMs4==1                
    // && rsi >=35    
   // && MathAbs(MarketInfo(tradpairs,MODE_BID)- MaCurrent)<=700*MarketInfo(Symbol(),MODE_POINT)
    
    ) 
    {
    st_B = iLow(tradpairs,0, i+1);
 //  placebuyord(400,450);
   b_hiside2 = iTime(tradpairs,PERIOD_M1,0) + (60*60);

     }  
   //buyb4=0;
}


// Bearish FwdEngulf  
if(((iHigh(tradpairs, PERIOD_D1, 0)==iHigh(tradpairs, PERIOD_H1, 1 )
   && h_Fwd_engulf_pat_S(0,0)==1)||
   (iHigh(tradpairs, PERIOD_D1, 0)>iHigh(tradpairs, PERIOD_H1, 1 )
   && h_Fwd_engulf_pat_S(0,1)==1 && iHigh(tradpairs, PERIOD_D1, 0)-iHigh(tradpairs, PERIOD_H1, 1)<150*MarketInfo(tradpairs,MODE_POINT))
   )  
   
   && iTime(tradpairs,PERIOD_M1,0)>= s_hiside2 && rsi <=65
 // (iHigh(tradpairs, PERIOD_D1, 0)-iHigh(tradpairs, PERIOD_H1, 1)<250*MarketInfo(tradpairs,MODE_POINT)&& h_Fwd_engulf_pat_S(0,1)==1
  //   &&iHigh(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_H1, 1)<450*MarketInfo(tradpairs,MODE_POINT))
   && st_chkr_ins!=st_chkr && TimeHour(TimeCurrent())>=3 && TimeHour(TimeCurrent())<=19 //&& MaCurrent<MarketInfo(tradpairs,MODE_BID)
   
   &&(iOpen(tradpairs, PERIOD_D1, 1)- iClose(tradpairs, PERIOD_D1, 1)<550*MarketInfo(tradpairs,MODE_POINT)||
   (iOpen(tradpairs, PERIOD_D1, 1)- iClose(tradpairs, PERIOD_D1, 1)>550*MarketInfo(tradpairs,MODE_POINT) && 
   iClose(tradpairs, PERIOD_D1, 0)- iOpen(tradpairs, PERIOD_D1, 0)>800*MarketInfo(tradpairs,MODE_POINT)))&&
   
  (iClose(tradpairs, PERIOD_D1, 0)- iOpen(tradpairs, PERIOD_D1, 0)>400*MarketInfo(tradpairs,MODE_POINT)||
   iClose(tradpairs, PERIOD_D1, 1)- iOpen(tradpairs, PERIOD_D1, 1)>400*MarketInfo(tradpairs,MODE_POINT)||
   (iClose(tradpairs, PERIOD_D1, 1)- iOpen(tradpairs, PERIOD_D1, 1)>120*MarketInfo(tradpairs,MODE_POINT)&&
   iClose(tradpairs, PERIOD_D1, 2)- iOpen(tradpairs, PERIOD_D1, 2)>120*MarketInfo(tradpairs,MODE_POINT))||
   (iClose(tradpairs, PERIOD_D1, 3)-iOpen(tradpairs, PERIOD_D1, 3)>700*MarketInfo(tradpairs,MODE_POINT)&&
   iClose(tradpairs, PERIOD_D1, 1)-iOpen(tradpairs, PERIOD_D1, 3)>450*MarketInfo(tradpairs,MODE_POINT))
   )
   
  // &&iClose(tradpairs, PERIOD_D1, 1)-iOpen(tradpairs, PERIOD_D1, 3)>500*MarketInfo(tradpairs,MODE_POINT)
   &&iHigh(tradpairs, PERIOD_D1, 1) - iHigh(tradpairs, PERIOD_D1, 0)< 500*MarketInfo(tradpairs,MODE_POINT)
    
   
  /*&&!(
  iHigh(tradpairs, 0, 1)- iLow(tradpairs, 0, 1)<150*MarketInfo(tradpairs,MODE_POINT)&&
  iHigh(tradpairs, 0, 2)- iLow(tradpairs, 0, 2)<150*MarketInfo(tradpairs,MODE_POINT)&&
  iHigh(tradpairs, 0, 3)- iLow(tradpairs, 0, 3)<150*MarketInfo(tradpairs,MODE_POINT)
  )*/
   
  //&& allow4==1 //&&allow5 ==1
   
  ){
  // h_placesellord(450,450);
         //**h_placesellord(10,550);
   s_hiside2 = iTime(tradpairs,PERIOD_M1,0) + (60*60);
   }
   
   


   for(cnt=0;cnt<total;cnt++)
     {
      if(!OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
         continue;
      if(OrderType()<=OP_SELL &&   // check for opened position 
         OrderSymbol()==Symbol())  // check for symbol
        {
         //--- long position is opened
         if(OrderType()==OP_BUY)
           {
            //if (OrderOpenPrice() - Ask >=StopOut*MarketInfo(Symbol(),MODE_POINT)){int deleat=OrderClose(OrderTicket(),Lots,Ask,3,clrNONE);};
            //--- check for trailing stop
            if(TrailingStop>0)
              {
               if(Bid-OrderOpenPrice()>Point*TrailingStop)
                 {
                  if(OrderStopLoss()<Bid-Point*TrailingStop)
                    {
                     //--- modify order and exit
                     if(!OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*TrailingStop,OrderTakeProfit(),0,Green))
                        Print("OrderModify error ",GetLastError());
                     return;
                    }
                 }
              }
           }
         else // go to short position
           {
            //--- check for trailing stop
            if(TrailingStop>0)
              {
               //if (Bid - OrderOpenPrice()>=StopOut*MarketInfo(Symbol(),MODE_POINT)){int deleat2=OrderClose(OrderTicket(),Lots,Bid,3,clrNONE);};
               if((OrderOpenPrice()-Ask)>(Point*TrailingStop))
                 {
                  if((OrderStopLoss()>(Ask+Point*TrailingStop)) || (OrderStopLoss()==0))
                    {
                     //--- modify order and exit
                     if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask+Point*TrailingStop,OrderTakeProfit(),0,Red))
                        Print("OrderModify error ",GetLastError());
                     return;
                    }
                 }
              }
           }
        }
     }

//Alert(Day());
if(dytrp==0){
day = Day();
dytrp=1;
}

if(TimeHour(TimeCurrent())>=23 && TimeHour(TimeCurrent())<=23){
bt_chkr=0; st_chkr=0; bt_chkr_ins=0; st_chkr_ins=0;
dytrp=0; wrink=0; wrink2=0; buyb4=0; sellb4=0;
//deleteall(); ResetEA(); 
}
}


void placesellord( int stploss, int tkproft)
{
         //Alert("sellprice: ",sellprice,"  Bid: ",Bid);
         if(sellb4==0){
         ticket=OrderSend(Symbol(),OP_SELL,lot,Bid,3,st_S+stploss*Point,Bid-tkproft*Point,"macd sample",16384,0,clrNONE);
        }
        // if(lot==0.1 && lot2==0.3 ){exe2t=0;}
        sellb4=1;
       //  st_chkr_ins=Fwd_engulf_pat_S(1);
}


void placebuyord(int stploss, int tkproft)
{        
     //  if(buyb4==0){
         ticket=OrderSend(Symbol(),OP_BUY,lot,Ask,3,st_B-stploss*Point,Ask+tkproft*Point,"macd sample",stpchk,0,Green);
      //   }
       //  if(lot==0.1 && lot2==0.3 ){exe2tt=0;}
    //  buyb4=1;
}



void h_placebuyord(int stploss, int tkproft)
{        
        op_buy=Ask;
       buyprice=Ask;
     //  if(buyb4==0){
         ticket=OrderSend(Symbol(),OP_BUY,lot,Ask,3,st_B-stploss*Point,Ask+tkproft*Point,"macd sample",stpchk,0,Green);
       //  }
       //  if(lot==0.1 && lot2==0.3 ){exe2tt=0;}
      buyb4=1;
      bt_chkr_ins=h_Fwd_engulf_pat_B(1,0);
}

void h_placesellord( int stploss, int tkproft)
{

         sellprice=Bid;
         //Alert("sellprice: ",sellprice,"  Bid: ",Bid);
       //  if(sellb4==0){
         ticket=OrderSend(Symbol(),OP_SELL,lot,Bid,3,st_S+stploss*Point,Bid-tkproft*Point,"macd sample",16384,0,clrNONE);
      //  }
        // if(lot==0.1 && lot2==0.3 ){exe2t=0;}
        sellb4=1;
         st_chkr_ins=h_Fwd_engulf_pat_S(1,0);
}

int h_Fwd_engulf_pat_B(int fun_swtr,int fun_swtr2)
{
     
     j=1; //57; j must be greater than 0 like 2
     b=0;
     Lowest =0;
     Highest = 0;
     buyr=0;
     int five = 0;
     five = 5;
     if(fun_swtr2==1){five = 1;}
     
     //for(j=0; j<=No_of_Candles; j++){
  
     //Bullish Forward Up-Down Engulf
     for(int i=j; i<five+j; i++){ //Alert(i);
     if(iClose(tradpairs,timeframe, i)- iOpen(tradpairs,timeframe, i) > 0*MarketInfo(Symbol(),MODE_POINT) &&
     iLow(tradpairs, timeframe, i+1 )>iLow(tradpairs, timeframe, i ) &&  iHigh(tradpairs, timeframe, i)>iHigh(tradpairs, timeframe, i+1 )
     && iOpen(tradpairs,timeframe, i+1)- iClose(tradpairs,timeframe, i+1)> 0
     ){ //Alert(i);
         tth = i;
         for(i=j; i<=tth; i++)
         { //Alert(tth);
      tTkp = iLow(tradpairs, timeframe, i);  if(Lowest==0){Lowest= iLow(tradpairs, timeframe, i);b=i;} 
      if(tTkp<Lowest){Lowest=tTkp; b=i;}
      if(tTkp>Lowest){Lowest=Lowest; b=b;}         // Alert("tth: ",tth," Lowest:", Lowest); 
         }                                   // Alert("tTkp: ",tTkp," Lowest:", Lowest);     //Alert(" Lowest:", Lowest);
         i=tth;                                 //   Alert("b: ",b," i: ",i);
       if(i<=b && iLow(tradpairs, timeframe, i-1 )>iLow(tradpairs, timeframe, i)
         &&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, timeframe, i)>0*MarketInfo(tradpairs,MODE_POINT)
         &&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, timeframe, i)<=450*MarketInfo(tradpairs,MODE_POINT)
        // &&iClose(tradpairs, timeframe, i)>iClose(tradpairs, timeframe, i+1)
         ){ buyr = 1; st_B=iLow(tradpairs, timeframe, i); 
          bt_chkr=iTime(tradpairs,timeframe,i);
        //DrawArrowUp("up"+i,Low[i]-10*Point,Blue,i); 
                 break;
               }
           }
       }
 //  if(fun_swtr2==1){st_B=iLow(tradpairs, PERIOD_D1, 0);}
   if(fun_swtr==1){buyr=bt_chkr;}fun_swtr=0;
    return buyr;
}


int h_Fwd_engulf_pat_S(int fun_swtr,int fun_swtr2)
{
 

     
     j=1; //57; j must be greater than 0 like 2
     b=0;
     Lowest =0;
     Highest = 0;
     sellr =0;
     int five =0;
     five =5;
     if(fun_swtr2==1){five=1;}
     
//Alert("j up: ",j);
    
     //Bearish Downward Up-Down Engulf
     for( int i=j; i<five+j; i++){ 
     if(iOpen(tradpairs,0, i)-iClose(tradpairs,0, i)> 0*MarketInfo(Symbol(),MODE_POINT) &&
     iLow(tradpairs, 0, i+1 )>iLow(tradpairs, 0, i ) &&  iHigh(tradpairs, 0, i)>iHigh(tradpairs, 0, i+1 )
    // && iClose(tradpairs,0, i+1)-iOpen(tradpairs,0, i+1)>0
     ){
         tth = i;
         for(i=j; i<=tth; i++)
         {tTkp = iHigh(tradpairs, 0, i); if(tTkp>Highest){Highest=tTkp; b=i;}
          if(tTkp<Highest){Highest=Highest; b=b;}
         //Alert("tth: ",tth," Highest:", Highest); 
         }                                         //Alert(" Lowest:", Lowest);
         i=tth;                                    //Alert("b: ",b," i: ",i);
       if(i<=b && iHigh(tradpairs, 0, i)>iHigh(tradpairs, 0, i-1 )
         && iHigh(tradpairs, timeframe, i)-MarketInfo(tradpairs,MODE_BID)>0*MarketInfo(tradpairs,MODE_POINT)
         && iHigh(tradpairs, timeframe, i)-MarketInfo(tradpairs,MODE_BID)<=450*MarketInfo(tradpairs,MODE_POINT)
       //  && iClose(tradpairs, timeframe, i)<iClose(tradpairs, timeframe, i+1)
         ){ sellr=1; st_S=iHigh(tradpairs, 0, i);
       st_chkr=iTime(tradpairs,timeframe,i);
       //DrawArrowDown("down"+i,High[i]+25*Point,Red,i);
                 break; 
               }
           }
       }
//if(fun_swtr2==1){st_S=iHigh(tradpairs, PERIOD_D1, 0);}
if(fun_swtr==1){sellr=st_chkr;}fun_swtr=0;
return sellr;
}

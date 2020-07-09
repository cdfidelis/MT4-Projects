
input double TakeProfit    =550;
input double StopOut       =250;
input double Lots          =0.10;
input double TrailingStop  =0;
extern int No_of_Candles = 5000;   //Number of candles to scan
double lot = Lots;
extern int peri_d = 50;
//H4= AUDUSD:50, EURUSD:50 GBPUSD:20 USDJPY:120(B)
//D1= AUDUSD EURUSD 50, GBPUSD 70, GBPCAD 0 TP:3000/4000 etc,  ;


double cclose[1] = {0};
double oopen[1] = {0};
double hhigh[1] = {0};
double llow[1] = {0};
int cnt,ticket,total, p,goo,sellnow,buynow, stpchk=0;

double EMA_t, Pr, EMA_y, SMA = 0;
double Ks = 0;int chke, chke2, ii,i= 0, s_hiside=0, b_hiside=0;
double st_B =0, st_S=0;

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
i = 0;

double MaCurrent=iMA(NULL,0,peri_d,0,MODE_EMA,PRICE_CLOSE,i);
EMA_t = MaCurrent;
double rsi =0;
rsi = iRSI(NULL,0,14,PRICE_CLOSE,0);

             //Bearish Engulf
      if( Close[i+1] - Open[i+1] > 0*MarketInfo(Symbol(),MODE_POINT) &&
   //      High[i]>High[i+1] && Low[i+1]>Close[i] &&  Open[i] - Close[i] > 0 && Close[i] < EMA_t
         High[i]>High[i+1] && Low[i+1]>Low[i] &&  Open[i] - Close[i] > 0 && Close[i] < EMA_t
         ){//sellnow = 1;
         }
         
      //Bullish Engulf
      if(Open[i+1]-Close[i+1] > 0*MarketInfo(Symbol(),MODE_POINT) &&
         High[i]>High[i+1] && Low[i+1]>Low[i] && Close[i]-Open[i] > 0 && Close[i] > EMA_t
     //  Close[i]>High[i+1] && Low[i+1]>Low[i] && Close[i]-Open[i] > 0 && Close[i] > EMA_t
         ){//buynow=1;
         }
 
 
 
 
       // H4-W1 Pattern
     //Bearish Engulf
      if(  Close[i+1] - Open[i+1] > 0*MarketInfo(Symbol(),MODE_POINT)// && rsi<=65 && rsi >=35
         &&High[i]>High[i+1] && Low[i+1]>Low[i] &&  Open[i] - Close[i] > 0
         && iHigh(NULL, PERIOD_W1, 0)==iHigh(NULL, PERIOD_H4, i)
       //  (iHigh(NULL, PERIOD_W1, 0)>iHigh(NULL, PERIOD_H4, i)
      //   && iHigh(NULL, PERIOD_W1, 0)-iHigh(NULL, PERIOD_H4, i)<150*MarketInfo(NULL,MODE_POINT)))
      && iTime(NULL,PERIOD_M1,0)>= s_hiside
 //     && iClose(NULL, PERIOD_H4, i)-iOpen(NULL, PERIOD_W1, 0)>300*MarketInfo(NULL,MODE_POINT)
 //      &&iHigh(NULL, PERIOD_H4, 0)-iClose(NULL, PERIOD_H4, i)<450*MarketInfo(NULL,MODE_POINT)
         ){
         //sellnow = 1;
          st_S =   iHigh(NULL,0, i);
          placesellord(250,550); 
          s_hiside = iTime(NULL,PERIOD_M1,0) + (240*60);
         }
         
      //Bullish Engulf
      if(Open[i+1]-Close[i+1] > 0*MarketInfo(Symbol(),MODE_POINT) //&& rsi>=35 && rsi <=65
         &&High[i]>High[i+1] && Low[i+1]>Low[i] && Close[i]-Open[i] > 0
        && iLow(NULL, PERIOD_W1, 0)==iLow(NULL, PERIOD_H4, i)
   //      (iLow(NULL, PERIOD_W1, 0)<iLow(NULL, PERIOD_H4, i)
   //      && iLow(NULL, PERIOD_H4, i)-iLow(NULL, PERIOD_W1, 0)<150*MarketInfo(NULL,MODE_POINT)))
   && iTime(NULL,PERIOD_M1,0)>= b_hiside
  // && iOpen(NULL, PERIOD_W1, 0)-iClose(NULL, PERIOD_H4, i)>300*MarketInfo(NULL,MODE_POINT)
  //    &&iClose(NULL, PERIOD_H4, 0)-iLow(NULL, PERIOD_H4, i)<450*MarketInfo(NULL,MODE_POINT)
         ){
        // buynow=1;
   st_B = iLow(NULL,0, i);
   placebuyord(250,550);
   b_hiside = iTime(NULL,PERIOD_M1,0) + (240*60);

         }
     

      p=1;
      if(Close[p]== cclose[0] && Open[p]== oopen[0] && High[p]== hhigh[0] && Low[p]==llow[0]){goo=0; buynow=0; sellnow = 0;}
      if(Close[p]!= cclose[0] && Open[p]!= oopen[0] && High[p]!= hhigh[0] && Low[p]!=llow[0]){goo=1;}
                                                   
      //double S_O =  Ask-StopOut*Point;
     // double S_O =  High[i] + StopOut*Point;   
                                                  
      if(buynow==1 && goo==1)
        {
         ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,3,Low[i]-StopOut*Point,Ask+TakeProfit*Point,"macd sample",stpchk,0,Green);
                cclose[0]=Close[p]; oopen[0]=Open[p]; hhigh[0]=High[p]; llow[0]=Low[p];
                buynow=0;
                //stpchk++;
        }
        
       if(sellnow == 1 && goo==1){
         ticket=OrderSend(Symbol(),OP_SELL,Lots,Bid,3,High[i]+StopOut*Point,Bid-TakeProfit*Point,"macd sample",16384,0,clrNONE);
        cclose[0]=Close[p]; oopen[0]=Open[p]; hhigh[0]=High[p]; llow[0]=Low[p];
        sellnow = 0;
               // Alert( Close[p]+" "+ cclose[0]);
        
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


}

void DrawArrowUp(string ArrowName,double LinePrice,color LineColor, int t_Var)
{
ObjectCreate(ArrowName, OBJ_ARROW, 0, Time[t_Var], LinePrice); //draw an up arrow
ObjectSet(ArrowName, OBJPROP_STYLE, STYLE_SOLID);
ObjectSet(ArrowName, OBJPROP_ARROWCODE, SYMBOL_ARROWUP);
ObjectSet(ArrowName, OBJPROP_COLOR,LineColor);
}

void DrawArrowDown(string ArrowName,double LinePrice,color LineColor, int t_Var)
{
ObjectCreate(ArrowName, OBJ_ARROW, 0, Time[t_Var], LinePrice); //draw an up arrow
ObjectSet(ArrowName, OBJPROP_STYLE, STYLE_SOLID);
ObjectSet(ArrowName, OBJPROP_ARROWCODE, SYMBOL_ARROWDOWN);
ObjectSet(ArrowName, OBJPROP_COLOR,LineColor);
}

       /* if( ffr!= 10)
        {
         // Alert(""); 
         ffr=ffr+1;
        } */                                                                          
//DrawArrowUp("up"+i,Low[i]-10*Point,Blue,i);
//DrawArrowDown("down"+i,High[i]+25*Point,Red,i);

void placesellord( int stploss, int tkproft)
{


         //Alert("sellprice: ",sellprice,"  Bid: ",Bid);
     //    if(sellb4==0){
         ticket=OrderSend(Symbol(),OP_SELL,lot,Bid,3,st_S+stploss*Point,Bid-tkproft*Point,"macd sample",16384,0,clrNONE);
   //     }
        // if(lot==0.1 && lot2==0.3 ){exe2t=0;}
   //     sellb4=1;
       //  st_chkr_ins=Fwd_engulf_pat_S(1);
}


void placebuyord(int stploss, int tkproft)
{        

    //   if(buyb4==0){
         ticket=OrderSend(Symbol(),OP_BUY,lot,Ask,3,st_B-stploss*Point,Ask+tkproft*Point,"macd sample",stpchk,0,Green);
      //   }
       //  if(lot==0.1 && lot2==0.3 ){exe2tt=0;}
   //   buyb4=1;
}

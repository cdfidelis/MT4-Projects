
input double TakeProfit    =750;
input double StopOut       =1;
input double Lots          =0.1;
input double TrailingStop  =0;
extern int No_of_Candles = 5000;   //Number of candles to scan
double lot = Lots;
extern int peri_d = 50;
//H4= AUDUSD:50, EURUSD:50 GBPUSD:20 USDJPY:120(B)
//D1= AUDUSD EURUSD 50

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
int cnt,ticket,total, p,goo,sellnow,buynow, stpchk=0;

double EMA_t, Pr, EMA_y, SMA = 0;
double Ks = 0;int chke, chke2, ii= 0;

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

/*
   for(int i=No_of_Candles; i>=0; i--)
   {
      high[i]=High[i];
      low[i]=Low[i];
      open[i] = Open[i];
      close[i] = Close [i];  
       
      // Uptrend                               
      CurntLvl20[i] = 0.2*(High[i]-Low[i]) + Low[i]; //open price
      CurntLvl80[i] = 0.8*(High[i]-Low[i]) + Low[i]; //close price
//       if(Phrs_1[i]==1 && Phrs_2[i]==1 && Phrs_3[i]==1){//Alert(i);}

      for(int yg=0; yg<=peri_d; yg++)
      { SMA = SMA + Close[i + yg]; //Alert(SMA);
      }
      
       if(chke==0){
       EMA_y = SMA/peri_d; // Close[i+1];
        chke=1;}
       
    //   Ks = 2/(peri_d + 1);
       Ks = 0.06451612;
       EMA_t = (Close[i]*Ks) + (EMA_y*(1-Ks));
       EMA_y = EMA_t;
       
       }*/
      int   i = 1;

//MacdCurrent=iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
double MaCurrent=iMA(NULL,0,peri_d,0,MODE_EMA,PRICE_CLOSE,i);
EMA_t = MaCurrent;



             //Bearish Engulf
      if( Close[i+1] - Open[i+1] > 0*MarketInfo(Symbol(),MODE_POINT) &&
         High[i]>High[i+1] && Low[i+1]>Low[i] &&  Open[i] - Close[i] > 0 && Close[i] < EMA_t
         ){sellnow = 1;}
         
      //Bullish Engulf
      if(Open[i+1]-Close[i+1] > 0*MarketInfo(Symbol(),MODE_POINT) &&
         High[i]>High[i+1] && Low[i+1]>Low[i] && Close[i]-Open[i] > 0 && Close[i] > EMA_t
         ){buynow=1;}
 
     
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
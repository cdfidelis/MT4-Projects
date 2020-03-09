
input double TakeProfit    =250;
input double StopOut       =50;
//input double Lots          =0.10;
input double TrailingStop  =0;
extern int No_of_Candles = 10000;   //Number of candles to scan
double lot = 0.01, lot2=0.30;
extern int peri_d = 50;


double high[1] = {0};
double low[1] = {0};
double open[1] = {0};
double close[1] = {0};
double CurntLvl20[1] = {0};
double CurntLvl80[1] = {0};
int Phrs_1[1] = {0};
int Phrs_2[1] = {0};
int Phrs_3[1] = {0};
int Phrs_4[1] = {0};
int Phrs_5[1] = {0};
double cclose[1] = {0};
double oopen[1] = {0};
double hhigh[1] = {0};
double llow[1] = {0};
int cnt,ticket,total, p,goo,sellnow,buynow, stpchk,gg=0, fwd_bLow_id=0, fwd_bHigh_id=0,fwd_bLow_LH_id=0, fwd_bLow_LH_id2=0;

double EMA_t, Pr, EMA_y, SMA, fwd_bLow,fwd_bHigh,fwd_bLow_LH,fwd_bLow_LH2 = 0;
double Ks = 0;int chke, chke2, ii= 0;

double zigzag_val[1] = {};
double zigzag_barNumb[1] = {};
int cntr1=0, barstocount=300, hj=0, hjj=0, goahead=0, fwd_fall_val=0;
double bounce = 0;
int bounce2,mcntr = 0;

int strd_S =1, strd_B=0, opTP_B=0, opTP_S=0, exe2t=0, exe2tt=0, zz=0,DH_beginning=0, exbar15=0, elvr15=0;
int place_SO=0,buytime=0, selltime=1,dytrp=0;
int place_BO=0, otherside=0, otherside2=0, day=0;
double orderAsk=0, orderBid=0, buyprice=0;
double sellprice=0, op_buy=0, MacdCurrent=0, Highest=0, d_Pivot=0, bar_rangesum_cnt=0, bar_rangesum=0;
int bias=StopOut;


     string tradpairs = NULL;
     string timeframe = 0;
     int j=0;  
     int tth =0;
     double tTkp=0;
     double Lowest=0;
     double highest,adr_sum=0;
     int b=0;
     int buyr=0, sellr=0;
     double st_B =0, st_S=0;
     int bt_chkr=0, st_chkr=0;
     int b_hiside = 0, bt_chkr_ins=0, s_hiside=0,s_hiside1=0, st_chkr_ins=0 ;
     int wrink=0, wrink2=0, buyb4=0, sellb4=0, buyb2=0, sellb2=0;


int bottom_cnt[5000], top_cnt[5000], ff2_nvr[5000], ff3_nvr[5000], ff4_nvr[5000], ff5_nvr[5000],
ff6_nvr[5000],ff7_nvr[5000],ff8_nvr[5000]= {1};
int maxBack_forth=0; double Back_forth_times[5000]={0};
int array_cnt, msellb2, mbuyb2, r4r, rst_var, ar_rst, nhty=0; 
int MTG_TkProfit[5000],tradeClearer[5000],sellStarting[5000],buyStarting[5000],Back_fthtmes_initial[5000],ff_nvr[100][5000], ff_nvr2[100][5000] = {0};

double rangeUB, mid_range =0;
double rangeLB =0;
int bar_inRange, mR_divsr, inMidrange_cnt, inMidrange_cnt2, mR_divsr2, passerVar=0; double rangev1_bar_inRange[4][5000]={0}; string trTF;

struct mTrade
  {
   int tick_nm;         // values of the 
   int tick_var_gen;  
   double openingPr;         // value of the 
   double executnPr;
   int gen_TP;
  
   //--- Constructor
          mTrade() { tick_nm=0; tick_var_gen=0; openingPr=0.0; executnPr=0.0; gen_TP=0;} //Initialization

  };

mTrade mBatch[5000];


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


//5MINS STRATEGY PHASE 1
if(TimeHour(TimeCurrent())==0 && TimeMinute(TimeCurrent())==0)
{DH_beginning=iTime(tradpairs,PERIOD_M15,0);}

if( 
//iClose(tradpairs, PERIOD_D1, 1)-iOpen(tradpairs, PERIOD_D1, 1)>= 200*MarketInfo(tradpairs,MODE_POINT)    // upbar Bar size D1; Nice

!(iOpen(tradpairs, PERIOD_D1, 1)-iLow(tradpairs, PERIOD_D1, 1)>= 300*MarketInfo(tradpairs,MODE_POINT) // 2 Days fall removal 1
&&iOpen(tradpairs, PERIOD_D1, 2)-iLow(tradpairs, PERIOD_D1, 2)>= 300*MarketInfo(tradpairs,MODE_POINT))

&&!(iOpen(tradpairs, PERIOD_D1, 1)-iLow(tradpairs, PERIOD_D1, 1)>= 400*MarketInfo(tradpairs,MODE_POINT) // 2 Days fall removal 2
&&iOpen(tradpairs, PERIOD_D1, 3)-iLow(tradpairs, PERIOD_D1, 3)>= 400*MarketInfo(tradpairs,MODE_POINT)
&&iClose(tradpairs, PERIOD_D1, 2)-iOpen(tradpairs, PERIOD_D1, 2)>= 300*MarketInfo(tradpairs,MODE_POINT)
)

//&&!(iOpen(tradpairs, PERIOD_D1, 0)-iLow(tradpairs, PERIOD_D1, 0)>=800*MarketInfo(tradpairs,MODE_POINT)) // Fall Distance/Ctrl

&&iLow(tradpairs, PERIOD_H1, 1)>iLow(tradpairs, PERIOD_H1, 0)    // Lower low
&&iHigh(tradpairs, PERIOD_H1, 1)>iHigh(tradpairs, PERIOD_H1, 0) // Higher high

&&iOpen(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_D1, 0)>= 200*MarketInfo(tradpairs,MODE_POINT)    // Downbar Bar size D1; Nice
//&&iOpen(tradpairs, PERIOD_H4,0)-iClose(tradpairs, PERIOD_H4, 0)>= 200*MarketInfo(tradpairs,MODE_POINT)    // Downbar Bar size H4; Nice 

//&&iHigh(tradpairs, PERIOD_D1, 0)-iLow(tradpairs, PERIOD_M15, 0)>=300*MarketInfo(tradpairs,MODE_POINT) // M15 Version of the fall
//&&iOpen(tradpairs, PERIOD_D1, 0)-iLow(tradpairs, PERIOD_M15, 0)>=100*MarketInfo(tradpairs,MODE_POINT)

&&(iOpen(tradpairs, PERIOD_H1, 2)-iClose(tradpairs, PERIOD_H1, 2)>= 150*MarketInfo(tradpairs,MODE_POINT) ||    // Downbar Bar size H1(2)
iOpen(tradpairs, PERIOD_H1, 1)-iClose(tradpairs, PERIOD_H1, 1)>=150*MarketInfo(tradpairs,MODE_POINT))    // Downbar Bar size H1 Default:50pts; 150pts

&&(iClose(tradpairs, PERIOD_M15, 1)-iOpen(tradpairs, PERIOD_M15, 1)>=20*MarketInfo(tradpairs,MODE_POINT)|| // Retracement Distance 20pts
iClose(tradpairs, PERIOD_M15, 0)-iOpen(tradpairs, PERIOD_M15, 2)>=20*MarketInfo(tradpairs,MODE_POINT))
//&& fwd_fall(1)==1 //M15 forward fall tracker starting from bar 1

//&&iOpen(tradpairs, PERIOD_M5, 1)-iClose(tradpairs, PERIOD_M5, 1)>=10*MarketInfo(tradpairs,MODE_POINT) // Downbar Bar size M5 10pts

&& iTime(tradpairs,PERIOD_M1,0)>= s_hiside
)
{

    //  if(!(iOpen(tradpairs, PERIOD_D1, 0)-iLow(tradpairs, PERIOD_D1, 0)>=800*MarketInfo(tradpairs,MODE_POINT) // Fall Distance/Ctrl
    //     && iHigh(tradpairs, PERIOD_D1, 0)-iOpen(tradpairs, PERIOD_D1, 0)<100*MarketInfo(tradpairs,MODE_POINT)))
      {
s_hiside = iTime(tradpairs,PERIOD_M1,0) + (60*60);

st_S=iHigh(tradpairs, PERIOD_D1, 0); //H4 Nice
//st_S=iHigh(tradpairs, PERIOD_H1, 0); //H1
//placesellord2(1,50);
placesellord2(1,100); // 1000, 50
sellb2=0;

//st_B=iLow(tradpairs, PERIOD_H4, 1);
//placebuyordtst(50,1000);
//buyb2=0;
   
      }
}






*/













//DAVID'S MARTINGALE
//SELL
if(TimeHour(TimeCurrent())==0 && TimeMinute(TimeCurrent())==0)
{DH_beginning=iTime(tradpairs,PERIOD_M15,0); sellb2=0;buyb2=0; //if(range_checker(PERIOD_H1, 6, 80)==1){sellb2=1;}
 }
/* 
if( (DayOfWeek()!=0 || DayOfWeek()!=6)
&&!(iOpen(tradpairs, PERIOD_D1, 1)-iLow(tradpairs, PERIOD_D1, 1)>= 300*MarketInfo(tradpairs,MODE_POINT) // 2 Days fall removal 1
&&iOpen(tradpairs, PERIOD_D1, 2)-iLow(tradpairs, PERIOD_D1, 2)>= 300*MarketInfo(tradpairs,MODE_POINT))

&&!(iOpen(tradpairs, PERIOD_D1, 1)-iLow(tradpairs, PERIOD_D1, 1)>= 400*MarketInfo(tradpairs,MODE_POINT) // 2 Days fall removal 2
&&iOpen(tradpairs, PERIOD_D1, 3)-iLow(tradpairs, PERIOD_D1, 3)>= 400*MarketInfo(tradpairs,MODE_POINT)
&&iClose(tradpairs, PERIOD_D1, 2)-iOpen(tradpairs, PERIOD_D1, 2)>= 300*MarketInfo(tradpairs,MODE_POINT)
)


&&iLow(tradpairs, PERIOD_H1, 1)>iLow(tradpairs, PERIOD_H1, 0)    // Lower low
&&iHigh(tradpairs, PERIOD_H1, 1)>iHigh(tradpairs, PERIOD_H1, 0) // Higher high

&&iOpen(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_D1, 0)>= 200*MarketInfo(tradpairs,MODE_POINT)    // Downbar Bar size D1; Nice
//&&iOpen(tradpairs, PERIOD_H4,0)-iClose(tradpairs, PERIOD_H4, 0)>= 200*MarketInfo(tradpairs,MODE_POINT)    // Downbar Bar size H4; Nice 


&&(iOpen(tradpairs, PERIOD_H1, 2)-iClose(tradpairs, PERIOD_H1, 2)>= 150*MarketInfo(tradpairs,MODE_POINT) ||    // Downbar Bar size H1(2)
iOpen(tradpairs, PERIOD_H1, 1)-iClose(tradpairs, PERIOD_H1, 1)>=150*MarketInfo(tradpairs,MODE_POINT))    // Downbar Bar size H1 Default:50pts; 150pts

&&(iClose(tradpairs, PERIOD_M15, 1)-iOpen(tradpairs, PERIOD_M15, 1)>=20*MarketInfo(tradpairs,MODE_POINT)|| // Retracement Distance 20pts
iClose(tradpairs, PERIOD_M15, 0)-iOpen(tradpairs, PERIOD_M15, 2)>=20*MarketInfo(tradpairs,MODE_POINT))
//&& fwd_fall(1)==1 //M15 forward fall tracker starting from bar 1

//&&iOpen(tradpairs, PERIOD_M5, 1)-iClose(tradpairs, PERIOD_M5, 1)>=10*MarketInfo(tradpairs,MODE_POINT) // Downbar Bar size M5 10pts

&& iTime(tradpairs,PERIOD_M1,0)>= s_hiside1
)*/
{
     if(sellb2==1 //&& MathAbs(iHigh(tradpairs, PERIOD_H4, 1)-Bid)*MathPow(10,Digits)<= 500
     ) 
      {
      if(
      TimeHour(TimeCurrent())>=3 && iTime(tradpairs,PERIOD_M1,0)>= s_hiside1 && (DayOfWeek()!=0 || DayOfWeek()!=6 || DayOfWeek()!=5)
      //&&iOpen(tradpairs, PERIOD_W1, 1)-iClose(tradpairs, PERIOD_W1, 0)>= 10*MarketInfo(tradpairs,MODE_POINT)
//      &&range_checker(PERIOD_H4, 6, 80)==1
      &&range_checker(PERIOD_H1, 6, 80)==1
      )  
      //range_checker(string timefr, int numb_bars, int rangeheight)
      {if(1){
s_hiside1 = iTime(tradpairs,PERIOD_M1,0) + (60*60);

// Maximum Back and Forth
maxBack_forth=13; // max=7(8); 4(5)

//Dynamic Takeprofit
//MTG_TkProfit[array_cnt+1]=MathAbs(iOpen(tradpairs, PERIOD_D1, 0)-Bid)*MathPow(10,Digits); // Good
//MTG_TkProfit[array_cnt+1]=MathAbs(iOpen(tradpairs, PERIOD_H4, 1)-Bid)*MathPow(10,Digits);// works
//MTG_TkProfit[array_cnt+1]=MathAbs(iHigh(tradpairs, PERIOD_H4, 1)-Bid)*MathPow(10,Digits);// Good
MTG_TkProfit[array_cnt+1]=500;


//Open Market Sell Order
st_S = Bid + MTG_TkProfit[array_cnt+1]*MarketInfo(tradpairs,MODE_POINT);
placesellord2(1,MTG_TkProfit[array_cnt+1]);  
// Martingle Function
DMartingale(ticket, st_S, Bid, MTG_TkProfit[array_cnt+1]); //Ticket no, Opening Price, Execution Price, Tp 
            }
         }
      }
}

// BUY
if((DayOfWeek()!=0 || DayOfWeek()!=6) && (TimeHour(TimeCurrent())>=4 && TimeHour(TimeCurrent())<=19)
&&iOpen(tradpairs, PERIOD_D1, 2)-iClose(tradpairs, PERIOD_D1, 2)>= 100*MarketInfo(tradpairs,MODE_POINT)
&&iOpen(tradpairs, PERIOD_D1, 1)-iClose(tradpairs, PERIOD_D1, 1)>= 200*MarketInfo(tradpairs,MODE_POINT)    // Bearish Previous day bar
&&iOpen(tradpairs, PERIOD_D1, 0)-iClose(tradpairs, PERIOD_D1, 0)>= 100*MarketInfo(tradpairs,MODE_POINT)    // Bearish current day bar

&&(iOpen(tradpairs, PERIOD_D1, 1)-iLow(tradpairs, PERIOD_D1, 1)>= 200*MarketInfo(tradpairs,MODE_POINT) // 1 Days fall
||iOpen(tradpairs, PERIOD_D1, 2)-iLow(tradpairs, PERIOD_D1, 1)>= 300*MarketInfo(tradpairs,MODE_POINT)
)

//&&iLow(tradpairs, PERIOD_H1, 1)>iLow(tradpairs, PERIOD_H1, 0)    // Lower low
//&&iHigh(tradpairs, PERIOD_H1, 1)>iHigh(tradpairs, PERIOD_H1, 0) // Higher high

&&(iOpen(tradpairs, PERIOD_H1, 2)-iClose(tradpairs, PERIOD_H1, 1)>=50*MarketInfo(tradpairs,MODE_POINT) ||    // Downbar Bar size H1(2)
iOpen(tradpairs, PERIOD_H1, 1)-iClose(tradpairs, PERIOD_H1, 1)>=50*MarketInfo(tradpairs,MODE_POINT))    // Downbar Bar size H1 Default:50pts; 150pts

//&&(iClose(tradpairs, PERIOD_M15, 1)-iOpen(tradpairs, PERIOD_M15, 1)>=20*MarketInfo(tradpairs,MODE_POINT)|| // Retracement Distance 20pts
//iClose(tradpairs, PERIOD_M15, 0)-iOpen(tradpairs, PERIOD_M15, 2)>=20*MarketInfo(tradpairs,MODE_POINT))


&& iTime(tradpairs,PERIOD_M1,0)>= s_hiside
)
{
      if(buyb2==1 && iOpen(tradpairs, PERIOD_D1, 0)-iLow(tradpairs, PERIOD_D1, 0)>=200*MarketInfo(tradpairs,MODE_POINT)
      && MathAbs(iHigh(tradpairs, PERIOD_H4, 1)-Bid)*MathPow(10,Digits)<=1000
      && range_checker(PERIOD_H1, 6, 80)==1
      )
      {//adr_var(5)*1*(75/100) adr_sum=0;//Print(adr_var(5)); adr_sum=0;
s_hiside = iTime(tradpairs,PERIOD_M1,0) + (60*60);

// Maximum Back and Forth
maxBack_forth=13; // max=7(8); 4(5)

//Dynamic Takeprofit
MTG_TkProfit[array_cnt+1]=MathAbs(iHigh(tradpairs, PERIOD_H4, 1)-Bid)*MathPow(10,Digits);// Good
//MTG_TkProfit[array_cnt+1]=400; //Good


//Open Market Buy Order
st_B = Bid - MTG_TkProfit[array_cnt+1]*MarketInfo(tradpairs,MODE_POINT);
placebuyord2(st_B,MTG_TkProfit[array_cnt+1]); //Print("unique marker: ",  mBatch[20].tick_nm);
// Martingle Function
DMartingale(ticket, st_B, Ask, MTG_TkProfit[array_cnt+1]); //Ticket no, Opening Price, Execution Price, Tp 

      }
}

Mtrade_tracker();




 


































//Trailing Stop
   for(cnt=0;cnt<=OrdersTotal();cnt++)
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
//Alert(day);
//if(day!=Day()&&(TimeHour(TimeCurrent())!=22||TimeHour(TimeCurrent())!=23)){ //Alert("Day: ",Day());
if(TimeHour(TimeCurrent())>=23 && TimeHour(TimeCurrent())<=23){
bt_chkr=0; st_chkr=0; bt_chkr_ins=0; st_chkr_ins=0;
dytrp=0; wrink=0; wrink2=0; buyb4=0; sellb4=0;
//deleteall(); ResetEA(); 
}


}


void placesellord2( int stploss, int tkproft)
{

         if(sellb2==0){
         ticket=OrderSend(Symbol(),OP_SELL,lot,Bid,3,st_S+stploss*Point,Bid-tkproft*Point,"macd sample",array_cnt+1,0,clrNONE);
        }
        sellb2=1;
        bottom_cnt[array_cnt+1]=1;
        sellStarting[array_cnt+1]=1;
        Back_fthtmes_initial[array_cnt+1]=1;
        mBatch[array_cnt+1].tick_var_gen= ticket;
}

void placebuyord2(int stploss, int tkproft)
{        

       if(buyb2==0){
         ticket=OrderSend(Symbol(),OP_BUY,lot,Ask,3,st_B-stploss*Point,Ask+tkproft*Point,"macd sample",array_cnt+1,0,Green);
         }
      buyb2=1;
      top_cnt[array_cnt+1]=1;
      buyStarting[array_cnt+1]=1;
      Back_fthtmes_initial[array_cnt+1]=1;
      mBatch[array_cnt+1].tick_var_gen= ticket;
}


//Mtrade's Buy and Sell Algo
void Mplacesellord2( int stploss, int tkproft, int array_cnt1, double llot, int magicnmb)
{

         if(msellb2==0){
         ticket=OrderSend(Symbol(),OP_SELL,llot,Bid,3,st_S+stploss*Point,Bid-tkproft*Point,"macd sample",magicnmb,0,clrNONE);
        }
        msellb2=1;
        bottom_cnt[array_cnt1]=1;
        mBatch[magicnmb].tick_var_gen= ticket;
        
        //Code need to use this function
        /*st_S=iOpen(tradpairs, PERIOD_D1, 0);
        Mplacesellord2(0,MTG_TkProfit, array_cnt", 0.30);
        msellb2=0;*/
}

void Mplacebuyord2(int stploss, int tkproft, int array_cnt1, double llot, int magicnmb)
{        

       if(mbuyb2==0){
         ticket=OrderSend(Symbol(),OP_BUY,llot,Ask,3,st_B-stploss*Point,Ask+tkproft*Point,"macd sample",magicnmb,0,Green);
         }
      mbuyb2=1;
      top_cnt[array_cnt1]=1;
      mBatch[magicnmb].tick_var_gen=ticket;
}


/*void placebuyordtst(int stploss, int tkproft)
{        

       if(buyb2==0){
         ticket=OrderSend(Symbol(),OP_BUY,lot,Ask,3,Ask-stploss*Point,st_S+(Ask-Bid)+stploss*Point,"macd sample",stpchk,0,Green);
         }
      buyb2=1;
}
*/






int fwd_fall(int barindex)
{
      exbar15 = (iTime(tradpairs,PERIOD_M15,barindex) - DH_beginning);
      elvr15 = MathMod((iTime(tradpairs,PERIOD_M15,barindex) - DH_beginning),15*60);
      exbar15 = exbar15 - elvr15;
      exbar15 = exbar15/900; 
      
//Find Lowest
fwd_bLow=iLow(tradpairs, PERIOD_M15,barindex);
for( int iyt=barindex; iyt<=exbar15; iyt++)
{
if(fwd_bLow > iLow(tradpairs, PERIOD_M15,iyt)){fwd_bLow=iLow(tradpairs, PERIOD_M15,iyt); fwd_bLow_id=iyt;}
}

//Find Highest (Forward Highest)
fwd_bHigh=iHigh(tradpairs, PERIOD_M15,barindex);
for(iyt=fwd_bLow_id; iyt>=barindex; iyt--)
{
if(fwd_bHigh < iHigh(tradpairs, PERIOD_M15,iyt)){fwd_bHigh=iHigh(tradpairs, PERIOD_M15,iyt); fwd_bHigh_id=iyt;}
}

//Find Lowest from Highest scanning backward
fwd_bLow_LH=iLow(tradpairs, PERIOD_M15,fwd_bHigh_id);
for(iyt=fwd_bHigh_id; iyt<=exbar15; iyt++)
{
if(fwd_bLow_LH > iLow(tradpairs, PERIOD_M15,iyt)){fwd_bLow_LH=iLow(tradpairs, PERIOD_M15,iyt); fwd_bLow_LH_id=iyt;}
}

//Find Lowest from Highest scanning forward
fwd_bLow_LH2=iLow(tradpairs, PERIOD_M15,fwd_bHigh_id);
for(iyt=fwd_bHigh_id; iyt>=barindex; iyt--)
{
if(fwd_bLow_LH2 > iLow(tradpairs, PERIOD_M15,iyt)){fwd_bLow_LH2=iLow(tradpairs, PERIOD_M15,iyt); fwd_bLow_LH_id2=iyt;}
}


//Compare that low to the daily low
if(fwd_bLow_LH>=fwd_bLow_LH2){fwd_fall_val=1;} else fwd_fall_val=0; //Print(fwd_bLow_LH," ",fwd_bLow_LH2);

return fwd_fall_val;
}



// Martingle Function
void DMartingale(int tick, double opening_Pr, double executn_Pr, int general_TP)
{  
   //Print("Array_cnt: ", array_cnt);
   //Print("mBatch.tick_nm: ",mBatch[array_cnt].tick_nm);
   mBatch[array_cnt+1].tick_nm= array_cnt+1;
   mBatch[array_cnt+1].openingPr= opening_Pr;
   mBatch[array_cnt+1].executnPr= executn_Pr;
   mBatch[array_cnt+1].gen_TP= general_TP;
   array_cnt= array_cnt +1;
   
   if(array_cnt>=4999){array_cnt=0; 
   for (int hht=0; hht<=4000; hht++){
   resetVar(hht);
   }
   rst_var=1;
   } 
   if(rst_var==1 && array_cnt>=3000){ 
   for (hht=4000; hht<=4999; hht++){
   resetVar(hht);    
   }
   rst_var=0;
   } 
}


void Mtrade_tracker()
{  
    
for(int lp5k=0; lp5k<=array_cnt; lp5k++)
{ //Print(OrderMagicNumber());
   
if(mBatch[lp5k].tick_nm==lp5k){
  r4r=mBatch[lp5k].tick_nm;   
 
if(mBatch[r4r].tick_nm!= 0)
{
//if(Back_forth_times[r4r]>=0 &&  mBatch[r4r].tick_nm==3 ){
 //Print("BB: ", Back_forth_times[r4r], " Unique marker: ", mBatch[r4r].tick_nm, "  mBatch[r4r].openingPr: ",mBatch[r4r].openingPr);
// Print("Ticket: ",ticket, "  MTG_TkProfit: ",MTG_TkProfit[r4r], "  mBatch[r4r].executnPr: ",mBatch[r4r].executnPr,"  Bid: ",Bid);
// }

//Sell Starting
if(sellStarting[r4r]==1){
// First Reversal Point Reached
if(bottom_cnt[r4r]==1 && Ask >= mBatch[r4r].openingPr)
{
bottom_cnt[r4r]=0;
Back_forth_times[r4r]=Back_forth_times[r4r]+1;
top_cnt[r4r]=1;
}

// Second Time Reversal
if(top_cnt[r4r]==1 &&  mBatch[r4r].executnPr >= Bid)
{
top_cnt[r4r]=0;
Back_forth_times[r4r]=Back_forth_times[r4r]+1;
bottom_cnt[r4r]=1;
}

// Flip-flop
//Sellstarting_buyflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
//Sellstarting_sellflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
Sellstarting_buyflipflop(1, 2, r4r, 0.02, lp5k);
Sellstarting_sellflipflop(2, 3, r4r, 0.04, lp5k);
Sellstarting_buyflipflop(3, 4, r4r, 0.08, lp5k);
Sellstarting_sellflipflop(4, 5, r4r, 0.16, lp5k);
Sellstarting_buyflipflop(5, 6, r4r, 0.32, lp5k);
Sellstarting_sellflipflop(6, 7, r4r, 0.64, lp5k);
Sellstarting_buyflipflop(7, 8, r4r, 1.28, lp5k);
Sellstarting_sellflipflop(8, 9, r4r, 2.56, lp5k);
Sellstarting_buyflipflop(9, 10, r4r, 5.12, lp5k);
Sellstarting_sellflipflop(10, 11, r4r,10.24, lp5k);
Sellstarting_buyflipflop(11, 12, r4r, 20.48, lp5k);
Sellstarting_sellflipflop(12, 13, r4r, 40.96, lp5k);
Sellstarting_buyflipflop(13, 14, r4r, 81.92, lp5k);
Sellstarting_sellflipflop(14, 15, r4r, 163.84, lp5k);

}


//Buy Starting
if(buyStarting[r4r]==1){
// First Reversal Point Reached
if(top_cnt[r4r]==1 &&  Bid<=mBatch[r4r].openingPr)
{
top_cnt[r4r]=0;
Back_forth_times[r4r]=Back_forth_times[r4r]+1;
bottom_cnt[r4r]=1;
//Print("BB: ", Back_forth_times[r4r], " Unique marker: ", mBatch[r4r].tick_nm);
}
//Print(mBatch[r4r].executnPr," ",mBatch[r4r].openingPr," ",r4r);

// Second Time Reversal
if(bottom_cnt[r4r]==1 && Ask >= mBatch[r4r].executnPr)
{//Print(mBatch[r4r].openingPr," ",r4r);
bottom_cnt[r4r]=0;
Back_forth_times[r4r]=Back_forth_times[r4r]+1;
top_cnt[r4r]=1;
//Print("BB: ", Back_forth_times[r4r], " Unique marker: ", mBatch[r4r].tick_nm);
}

// Flip-flop
//Buystarting_sellflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
//Buystarting_buyflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
Buystarting_sellflipflop(1,2,r4r,0.02,lp5k);
Buystarting_buyflipflop(2,3,r4r,0.04,lp5k);
Buystarting_sellflipflop(3,4,r4r,0.08,lp5k);
Buystarting_buyflipflop(4,5,r4r,0.16,lp5k);
Buystarting_sellflipflop(5,6,r4r,0.32,lp5k);
Buystarting_buyflipflop(6,7,r4r,0.64,lp5k);
Buystarting_sellflipflop(7,8,r4r,1.28,lp5k);
Buystarting_buyflipflop(8,9,r4r,2.56,lp5k);
Buystarting_sellflipflop(9,10,r4r,5.12,lp5k);
Buystarting_buyflipflop(10,11,r4r,10.24,lp5k);
Buystarting_sellflipflop(11,12,r4r,20.48,lp5k);
Buystarting_buyflipflop(12,13,r4r,40.96,lp5k);
Buystarting_sellflipflop(13,14,r4r,81.92,lp5k);
Buystarting_buyflipflop(14,15,r4r,163.84,lp5k);

}




//Print("Back_forth_times: ",Back_forth_times[r4r]);


// Max Rotations
if(Back_forth_times[r4r]>=maxBack_forth)
{  ar_rst++; Print("Maxout times: ", ar_rst);
resetVar(r4r);
}


// Stop Trading After TakeProfit
int yetet=OrderSelect(mBatch[r4r].tick_var_gen,SELECT_BY_TICKET,MODE_HISTORY);
if(OrderMagicNumber()==mBatch[r4r].tick_nm && TimeCurrent()-OrderCloseTime()<= iTime(tradpairs,PERIOD_M5,1)-iTime(tradpairs,PERIOD_M5,2)
){ //Print("TimeCurrent(): ",TimeCurrent(),"   OrderCloseTime(): ",OrderCloseTime(),"  iTime(tradpairs,PERIOD_W1,1): ",iTime(tradpairs,PERIOD_W1,1),"  iTime(tradpairs,PERIOD_W1,2): ",iTime(tradpairs,PERIOD_W1,2));
//Print("TimeCurrent()-OrderCloseTime(): ",TimeCurrent()-OrderCloseTime(),"  iTime W1-W2: ",iTime(tradpairs,PERIOD_D1,1)-iTime(tradpairs,PERIOD_D1,2));

//Buy
if((((Bid-mBatch[r4r].openingPr>=MTG_TkProfit[r4r]*MarketInfo(Symbol(),MODE_POINT)&& sellStarting[r4r]==1 &&MathMod(Back_forth_times[r4r]+1,2)==0)||
(Bid-mBatch[r4r].executnPr>=MTG_TkProfit[r4r]*MarketInfo(Symbol(),MODE_POINT)-(Ask-Bid)&& buyStarting[r4r]==1 && MathMod(Back_forth_times[r4r],2)==0)))||
//Sell
((mBatch[r4r].executnPr-Ask>=MTG_TkProfit[r4r]*MarketInfo(Symbol(),MODE_POINT)&& sellStarting[r4r]==1
&& MathMod(Back_forth_times[r4r],2)==0)||
(mBatch[r4r].openingPr-Ask>=MTG_TkProfit[r4r]*MarketInfo(Symbol(),MODE_POINT) && buyStarting[r4r]==1 && MathMod(Back_forth_times[r4r]+1,2)==0
))
)
{
resetVar(r4r); 
}

if((OrderType()==OP_BUY && OrderClosePrice()-OrderOpenPrice()>0) || (OrderType()==OP_SELL && OrderOpenPrice()-OrderClosePrice()>0))
{  
resetVar(r4r);
}
         
       }  
   }
            }
         }

if(OrdersTotal()==0 && array_cnt>=2) {array_cnt=0; for(int rsr4r=0; rsr4r<=4999; rsr4r++){resetVar(rsr4r);}}
}



void resetVar(int gy)
{
   mBatch[gy].tick_nm= 0;
   mBatch[gy].openingPr= 0;
   mBatch[gy].executnPr= 0;
   mBatch[gy].gen_TP= 0;
   Back_forth_times[gy]=0;
   bottom_cnt[gy]=0; 
   top_cnt[gy]=0;
   ff2_nvr[gy]=0;
   ff3_nvr[gy]=0;
   ff4_nvr[gy]=0;
   ff5_nvr[gy]=0;
   ff6_nvr[gy]=0;
   ff7_nvr[gy]=0;
   ff8_nvr[gy]=0;
   MTG_TkProfit[gy]=0;
   sellStarting[gy]=0;
   buyStarting[gy] =0;
   Back_fthtmes_initial[gy]=0;
   for(int edr=0; edr<=99; edr++){ff_nvr[edr][gy]=0; ff_nvr2[edr][gy]=0;}
}

void Sellstarting_buyflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
{
if(Back_forth_times[r4r_passr]==bftimes && ff_nvr[ff_nvrID][r4r_passr]==0) //ff_nvrID2,4,6,8...
{
//Buy ff2
st_B=mBatch[r4r_passr].executnPr;
Mplacebuyord2(0,MTG_TkProfit[r4r_passr], r4r_passr, lotsize, mBatch[lp5k_passer].tick_nm);
mbuyb2=0;
ff_nvr[ff_nvrID][r4r_passr]=1;
}
}

void Sellstarting_sellflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
{
if(Back_forth_times[r4r_passr]==bftimes && ff_nvr[ff_nvrID][r4r_passr]==0) //ff_nvrID3,5,7....
{
//Sell ff3
st_S=mBatch[r4r_passr].openingPr;
Mplacesellord2(0,MTG_TkProfit[r4r_passr], r4r_passr, lotsize, mBatch[lp5k_passer].tick_nm);
msellb2=0;
ff_nvr[ff_nvrID][r4r_passr]=1;
}
}

void Buystarting_sellflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
{
if(Back_forth_times[r4r_passr]==bftimes && ff_nvr2[ff_nvrID][r4r_passr]==0) //ff_nvrID 2,4,8....
{
//Sell ff2
st_S=mBatch[r4r_passr].executnPr;
Mplacesellord2(0,MTG_TkProfit[r4r_passr], r4r_passr, lotsize, mBatch[lp5k_passer].tick_nm);
msellb2=0;
ff_nvr2[ff_nvrID][r4r_passr]=1;
}
}

void Buystarting_buyflipflop(int bftimes, int ff_nvrID, int r4r_passr, double lotsize, int lp5k_passer)
{
if(Back_forth_times[r4r_passr]==bftimes && ff_nvr2[ff_nvrID][r4r_passr]==0) //ff_nvrID 3,5,7....
{
//Buy ff3
st_B=mBatch[r4r_passr].openingPr;
Mplacebuyord2(0,MTG_TkProfit[r4r_passr], r4r_passr, lotsize, mBatch[lp5k_passer].tick_nm);
mbuyb2=0;
ff_nvr2[ff_nvrID][r4r_passr]=1;
}
}




int range_checker(string timefr, int numb_bars, int rangeheight)
{
int rng_positive=0;
  trTF= timefr;   
  
// Check for 4 bars(backwards) as you loop through from  bars i=0 to i=10000
for(int ir=0; ir<3; ir++)
//for(int ir=200; ir>=0; ir--)
{
for (int yhj=0; yhj<3; yhj++)
{
for( int rng=1; rng<=numb_bars; rng++) //M15:96; H1:24
{
if(yhj==0){
rangeUB =iHigh(tradpairs, trTF,ir);
rangeLB =iLow(tradpairs, trTF,ir);}

if(yhj==1){
rangeUB =iHigh(tradpairs, trTF,ir);
rangeLB =iLow(tradpairs, trTF,ir);

rangeUB=rangeLB+(rangeUB-rangeLB)*0.75;
rangeLB=rangeUB - (iHigh(tradpairs, trTF,ir)-iLow(tradpairs, trTF,ir));
}

if(yhj==2){
rangeUB =iHigh(tradpairs, trTF,ir);
rangeLB =iLow(tradpairs, trTF,ir);

rangeLB=rangeLB+(rangeUB-rangeLB)*0.25;
rangeUB=rangeLB + (iHigh(tradpairs, trTF,ir)-iLow(tradpairs, trTF,ir));
}

if((iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir))>0
&&
((iHigh(tradpairs, trTF,rng+ir) <= rangeUB && iHigh(tradpairs, trTF,rng+ir)>= rangeUB // Scenerio 1: 60% in from bottom
&& ((iHigh(tradpairs, trTF,rng+ir)- rangeLB)/(iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir)))>= 0.50) || 

(iHigh(tradpairs, trTF,rng+ir)<= rangeUB && iLow(tradpairs, trTF,rng+ir)>= rangeLB) || // Scenerio 2: fully in

(iLow(tradpairs, trTF,rng+ir) >= rangeLB && iLow(tradpairs, trTF,rng+ir)<= rangeUB  //Scenerio 3: 60% in from top
&& ((rangeUB-iLow(tradpairs, trTF,rng+ir))/(iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir)))>= 0.50)||

(iHigh(tradpairs, trTF,rng+ir)>rangeUB && iLow(tradpairs, trTF,rng+ir)<rangeLB                  // Scenerio 4: Touching bottom and top
&& ((iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir)) - ((iHigh(tradpairs, trTF,rng+ir)-rangeUB)+ 
(rangeLB - iLow(tradpairs, trTF,rng+ir))))/(iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir)) >=0.50)
))

{ 	bar_inRange = bar_inRange+1;
} else break;

if(bar_inRange>=1){ //Print("bar_inRange: ",bar_inRange,"   Bar no: ", ir, "  Low: ",iLow(tradpairs, PERIOD_M15,rng+ir), "  rangeLB: ", rangeLB, "  rangeUB: ", rangeUB , "    %:",((iHigh(tradpairs, trTF,rng+ir)- rangeLB)/(iHigh(tradpairs, trTF,rng+ir)-iLow(tradpairs, trTF,rng+ir)))); 

if(yhj==0){
rangev1_bar_inRange[0][ir]= rangev1_bar_inRange[0][ir]+ bar_inRange;}
if(yhj==1){
rangev1_bar_inRange[1][ir]= rangev1_bar_inRange[1][ir]+ bar_inRange;}
if(yhj==2){
rangev1_bar_inRange[2][ir]= rangev1_bar_inRange[2][ir]+ bar_inRange;}
//DrawArrowDown("down"+ir+0  ,High[ir]+25*Point,Red,ir);

}
} bar_inRange=0; 


//if( rangev1_bar_inRange[0][ir]>= 1 ||rangev1_bar_inRange[1][ir]>= 1 ||rangev1_bar_inRange[2][ir]>= 1 )
if((rangev1_bar_inRange[0][ir]+rangev1_bar_inRange[1][ir]+rangev1_bar_inRange[2][ir])/3 >= 3 )
{
rangeUB =iHigh(tradpairs, trTF,ir);
rangeLB =iLow(tradpairs, trTF,ir);

mid_range=(rangeUB-rangeLB)/2;
mid_range= rangeLB+mid_range;

for(int irrx =1; irrx<=10; irrx++)
{
if(iHigh(tradpairs, trTF,ir+irrx)>=mid_range && mid_range>=iLow(tradpairs, trTF,ir+irrx))
{
inMidrange_cnt=inMidrange_cnt+1;
}

mR_divsr=mR_divsr+1; 
}

for( irrx =0; irrx<=3; irrx++)
{
if(iHigh(tradpairs, trTF,ir+irrx)>=mid_range && mid_range>=iLow(tradpairs, trTF,ir+irrx))
{
inMidrange_cnt2=inMidrange_cnt2+1; 
}

mR_divsr2=mR_divsr2+1; 
}
 
if(((inMidrange_cnt/(mR_divsr-2))>=0.50 && mR_divsr!=0)|| (inMidrange_cnt2/mR_divsr2>=0.50&& mR_divsr2!=0))
{
for( int kkt=0; kkt<=numb_bars; kkt++)
{
if( (iHigh(tradpairs, trTF,kkt+ir)-iLow(tradpairs, trTF,kkt+ir))>0
&&
((iHigh(tradpairs, trTF,kkt+ir) <= rangeUB && iHigh(tradpairs, trTF,kkt+ir)>= rangeUB // Scenerio 1: 60% in from bottom
&& ((iHigh(tradpairs, trTF,kkt+ir)- rangeLB)/(iHigh(tradpairs, trTF,kkt+ir)-iLow(tradpairs, trTF,kkt+ir)))<= 0.40) || 
(iLow(tradpairs, trTF,kkt+ir) >= rangeLB && iLow(tradpairs, trTF,kkt+ir)<= rangeUB  //Scenerio 3: 60% in from top
&& ((rangeUB-iLow(tradpairs, trTF,kkt+ir))/(iHigh(tradpairs, trTF,kkt+ir)-iLow(tradpairs, trTF,kkt+ir)))<= 0.40)

))
{
break;
}
bar_rangesum=bar_rangesum+(iHigh(tradpairs, trTF,kkt+ir)-iLow(tradpairs, trTF,kkt+ir));
bar_rangesum_cnt++;
}

if(bar_rangesum_cnt!=0 && bar_rangesum/bar_rangesum_cnt >= rangeheight*MarketInfo(Symbol(),MODE_POINT))
{ 
rng_positive=1;
} else rng_positive=0;

} 
inMidrange_cnt=0; mR_divsr=0; inMidrange_cnt2=0; mR_divsr2=0; bar_rangesum_cnt=0; bar_rangesum=0;

      }
   } 
}

return rng_positive;
}




int anybackandforth()
{
int ffrt=0;
ffrt=0;
for( int ykt=0; ykt<=array_cnt; ykt++)
{
if(Back_forth_times[ykt]>0)
{
ffrt++;
}
}

return ffrt;
}  

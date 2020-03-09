extern int StopLoss = 250;
extern int TakeProfit = 120;
extern double lotSize = 0.01;
extern int master = 60;
 //70
extern int slave = 40;
 //30
extern int pip_Level_min = 8;
 //10
extern int pip_Level_max = 22;
 //25
extern double pecentage_Change_min = 0.08;
 //0.10
extern double pecentage_Change_max = 0.25;
 //0.25

//Code 2
/*
int mst = master;
int slv = slave;
int ppmi = pip_Level_min;
int ppma = pip_Level_max;

double pcmi = pecentage_Change_min;
double pcma = pecentage_Change_max;
*/
int mst = 65; //70
int slv = 35; //30
int ppmi = 8; //10
int ppma = 17; //25
double pcmi = 0.08; //0.10
double pcma = 0.17; //0.25
int SL = StopLoss;
int TP = TakeProfit;
int TP2 = 60;
   int xyy=0;
   int yyx=0;
   int jl=0;  
   int tth =0;
   int bz=0;
   int ok_B = 0;     int ok_S = 0;
int exbar15=0, exbar60=0, elvr15=0, elvr60=0, thd = 0, thdd = 0;
int firstpair,firstpair2,firstpair3,firstpair4,firstpair5,firstpair6,firstpair7,firstpair8 = 0;
int ttm, ttm2 =0;
int ronce = 0;
int rchc[8]={0,0,0,0,0,0,0};
double pass = 0;
double Rpt = 0;
double point = 0, tTkp=0, Highest=0, Lowest=0, dlow=0, dhigh=0, pertnchg_close=0, pipchg_close=0, OpenPrice2=0;
string otherpair, otherpair2,otherpair3,otherpair4,otherpair5,otherpair6,otherpair7,otherpair8 = "";
string power = "STRONG";
int usd,eur,gbp,cad,aud,jpy,nzd,chf = 0;
double pipchg[28] = {};
double pipchgval[28]  ={0,0,0,0,0,0,0,0};
double pipchgval2[28] ={0,0,0,0,0,0,0,0};
double pipchgval3[28] ={0,0,0,0,0,0,0,0};
double pipchgval4[28] ={0,0,0,0,0,0,0,0};
double pipchgval5[28] ={0,0,0,0,0,0,0,0};
double pipchgval6[28] ={0,0,0,0,0,0,0,0};
double pipchgval7[28] ={0,0,0,0,0,0,0,0};
double pipchgval8[28] ={0,0,0,0,0,0,0,0};

int positive [8]={0,0,0,0,0,0,0,0};
int negative [8]={0,0,0,0,0,0,0,0};
int toggVar[8] = {0,0,0,0,0,0,0,0};
int emtchcx[8] = {0,0,0,0,0,0,0,0};

int toggVar2[8] ={0,0,0,0,0,0,0,0};
int toggVar3[8] ={0,0,0,0,0,0,0,0};
int toggVar4[8] ={0,0,0,0,0,0,0,0};
int toggVar5[8] ={0,0,0,0,0,0,0,0};
int toggVar6[8] ={0,0,0,0,0,0,0,0};
int toggVar7[8] ={0,0,0,0,0,0,0,0};
int toggVar8[8] ={0,0,0,0,0,0,0,0};
int toggVar9[8] ={0,0,0,0,0,0,0,0};

int trdtrigr[8] = {0,0,0,0,0,0,0,0};
int trdtrigr2[8] ={0,0,0,0,0,0,0,0};
int trdtrigr3[8] ={0,0,0,0,0,0,0,0};
int trdtrigr4[8] ={0,0,0,0,0,0,0,0};
int trdtrigr5[8] ={0,0,0,0,0,0,0,0};
int trdtrigr6[8] ={0,0,0,0,0,0,0,0};
int trdtrigr7[8] ={0,0,0,0,0,0,0,0};
int trdtrigr8[8] ={0,0,0,0,0,0,0,0};

int emtchc[8] = {0,0,0,0,0,0,0,0};
int emtchc2[8] ={0,0,0,0,0,0,0,0};
int emtchc3[8] ={0,0,0,0,0,0,0,0};
int emtchc4[8] ={0,0,0,0,0,0,0,0};
int emtchc5[8] ={0,0,0,0,0,0,0,0};
int emtchc6[8] ={0,0,0,0,0,0,0,0};
int emtchc7[8] ={0,0,0,0,0,0,0,0};
int emtchc8[8] ={0,0,0,0,0,0,0,0};

string TradePairs[] = {"AUDCAD","AUDCHF","AUDJPY","AUDNZD","AUDUSD","CADCHF","CADJPY","CHFJPY","EURAUD","EURCAD","EURCHF","EURGBP","EURJPY","EURNZD","EURUSD","GBPAUD","GBPCAD","GBPCHF","GBPJPY","GBPNZD","GBPUSD","NZDCAD","NZDCHF","NZDJPY","NZDUSD","USDCAD","USDCHF","USDJPY"};
string audlist[7]={"AUDCAD","AUDCHF","EURAUD","GBPAUD","AUDJPY","AUDNZD","AUDUSD"};
string cadlist[7]={"CADJPY","CADCHF","AUDCAD","NZDCAD","USDCAD","GBPCAD","EURCAD"};
string chflist[7]={"AUDCHF","CADCHF","GBPCHF","NZDCHF","USDCHF","EURCHF","CHFJPY"};
string eurlist[7]={"EURAUD","EURNZD","EURCAD","EURUSD","EURGBP","EURCHF","EURJPY"};
string gbplist[7]={"EURGBP","GBPAUD","GBPCAD","GBPUSD","GBPCHF","GBPJPY","GBPNZD"};
string jpylist[7]={"AUDJPY","GBPJPY","CADJPY","USDJPY","NZDJPY","CHFJPY","EURJPY"};
string nzdlist[7]={"AUDNZD","EURNZD","GBPNZD","NZDCAD","NZDUSD","NZDCHF","NZDJPY"};
string usdlist[7]={"USDCHF","USDCAD","USDJPY","AUDUSD","NZDUSD","GBPUSD","EURUSD"};


string curr[8] = {"USD","EUR","GBP","JPY","AUD","NZD","CAD","CHF"};

string pertnvalue[28] = {};
double pertnchg[28] = {};
double strr[8] = {0,0,0,0,0,0,0};
double CurntLvl_op=0, CurntLvl_cl=0;
int ovb=0, ovs=0;
double highbouncer =0, lowbouncer=0, kpl=0, Hst=0, Lst=0;
int val_tal=1;
int nonrp =0;
int rp_holdr[28]={};
int M15_valBr=0, H1_valBr=0, M15_valBr1=0, H1_valBr1=0;

void OnInit()
{
   EventSetMillisecondTimer(50);
}

void OnDeinit(const int reason)
{
    EventKillTimer();
}

double currency_strength(string pair)
 {
   string sym;
   double range;
   double ratio;
   double strength=0;
   int    cnt1=0;

   for(int x=0; x<ArraySize(TradePairs); x++) 
     {
     // fact= 0;
      sym = TradePairs[x];
      

      if(TimeHour(TimeLocal())>=1  && TimeHour(TimeLocal())<=4 ){ dhigh= iHigh(sym,PERIOD_D1,0); dlow= iLow(sym,PERIOD_D1,0);}

      if(TimeHour(TimeLocal())>=5  && TimeHour(TimeLocal())<=8 )
      { if(iHigh(sym,PERIOD_M30,2)> iHigh(sym,PERIOD_M30,1)){dhigh= iHigh(sym,PERIOD_M30,2);} else{ dhigh= iHigh(sym,PERIOD_M30,1);}      
        if(iLow(sym,PERIOD_M30,2)<iLow(sym,PERIOD_M30,1)){dlow= iLow(sym,PERIOD_M30,2);} else {dlow= iLow(sym,PERIOD_M30,1);} 
 
        if(iHigh(sym,PERIOD_M30,0)> dhigh){dhigh= iHigh(sym,PERIOD_M30,0);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M30,0)<dlow){dlow= iLow(sym,PERIOD_M30,0);} else {dlow=dlow;}    
      } 
       
      if(TimeHour(TimeLocal())>=9  && TimeHour(TimeLocal())<=23 )
      { if(iHigh(sym,PERIOD_M15,10)> iHigh(sym,PERIOD_M15,9)){dhigh= iHigh(sym,PERIOD_M15,10);} else{ dhigh= iHigh(sym,PERIOD_M15,9);}      
        if(iLow(sym,PERIOD_M15,10)<iLow(sym,PERIOD_M15,9)){dlow= iLow(sym,PERIOD_M15,10);} else {dlow= iLow(sym,PERIOD_M15,9);} 
 
        if(iHigh(sym,PERIOD_M15,8)> dhigh){dhigh= iHigh(sym,PERIOD_M15,8);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,8)<dlow){dlow= iLow(sym,PERIOD_M15,8);} else {dlow=dlow;}
        
        if(iHigh(sym,PERIOD_M15,7)> dhigh){dhigh= iHigh(sym,PERIOD_M15,7);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,7)<dlow){dlow= iLow(sym,PERIOD_M15,7);} else {dlow=dlow;}
        
        if(iHigh(sym,PERIOD_M15,6)> dhigh){dhigh= iHigh(sym,PERIOD_M15,6);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,6)<dlow){dlow= iLow(sym,PERIOD_M15,6);} else {dlow=dlow;}
        
        if(iHigh(sym,PERIOD_M15,5)> dhigh){dhigh= iHigh(sym,PERIOD_M15,5);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,5)<dlow){dlow= iLow(sym,PERIOD_M15,5);} else {dlow=dlow;}
        
        if(iHigh(sym,PERIOD_M15,4)> dhigh){dhigh= iHigh(sym,PERIOD_M15,4);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,4)<dlow){dlow= iLow(sym,PERIOD_M15,4);} else {dlow=dlow;}             
        
        if(iHigh(sym,PERIOD_M15,3)> dhigh){dhigh= iHigh(sym,PERIOD_M15,3);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,3)<dlow){dlow= iLow(sym,PERIOD_M15,3);} else {dlow=dlow;}        
        
        if(iHigh(sym,PERIOD_M15,2)> dhigh){dhigh= iHigh(sym,PERIOD_M15,2);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,2)<dlow){dlow= iLow(sym,PERIOD_M15,2);} else {dlow=dlow;}
        
        if(iHigh(sym,PERIOD_M15,1)> dhigh){dhigh= iHigh(sym,PERIOD_M15,1);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,1)<dlow){dlow= iLow(sym,PERIOD_M15,1);} else {dlow=dlow;}           
           
        if(iHigh(sym,PERIOD_M15,0)> dhigh){dhigh= iHigh(sym,PERIOD_M15,0);} else{dhigh=dhigh;}
        if(iLow(sym,PERIOD_M15,0)<dlow){dlow= iLow(sym,PERIOD_M15,0);} else {dlow=dlow;}             
      }
      //if(TimeHour(TimeLocal())>=13  && TimeHour(TimeLocal())<=15){ dhigh= iHigh(sym,PERIOD_H4,0); dlow= iLow(sym,PERIOD_H4,0);}
      //if(TimeHour(TimeLocal())>=16  && TimeHour(TimeLocal())<=18 )
     // { if(iHigh(sym,PERIOD_H4,0)> iHigh(sym,PERIOD_H4,1)){dhigh= iHigh(sym,PERIOD_H4,0);} else{ dhigh= iHigh(sym,PERIOD_H4,1);}
    //    if(iLow(sym,PERIOD_H4,0)<iLow(sym,PERIOD_H4,1)){dlow= iLow(sym,PERIOD_H4,0);} else {dlow= iLow(sym,PERIOD_H4,1);}        
    //  }
      
      if(TimeHour(TimeLocal())>=19  && TimeHour(TimeLocal())<=23 ){ dhigh=dlow; }
      
    //  Alert(TradePairs[x]," ",dhigh," ", dlow);
      
      if(pair==StringSubstr(sym,0,3) || pair==StringSubstr(sym,3,3)) 
        {
         
         range=(dhigh-dlow);
         if(range!=0.0) 
           {
            ratio=MathMin(100.0 *((MarketInfo(sym,MODE_BID)-dlow)/range),100);            
            cnt1++;//cnt1=cnt1+1
          if(pair==StringSubstr(sym,3,3))ratio = 100 - ratio;
               //fact=9-fact; 
            strength+=ratio;
           // str = str + ratio
           }
        }

     }
   if(cnt1!=0)strength/=cnt1;//str= str/cnt1

   return (strength);

 }
 
//MT4 SendMail function
void SendMail_function(string tpair, int tickey, string sym, string direct){
bool res = SendMail(tpair+" BASKET TRADE OPEN",
                     "Order #"      + string(tickey)+ " Opened Succesfully\n" "\n"
                                                      +"Instrument: " + sym             + "\n""\n"
                                                      +"LotSize: " +DoubleToStr(lotSize,2) + "\n""\n"
                                                      +"Direction:  " + direct                 + "\n""\n"
                                                      +"Date:  " +TimeDay(TimeLocal())+" - "+TimeMonth(TimeLocal())+" - "+TimeYear(TimeLocal()) +"\n""\n"
                                                      +"Time: " + TimeHour(TimeLocal())+" : "+TimeMinute(TimeLocal())+" : "+TimeSeconds(TimeLocal())+"  GMT"+ "\n"
                    ); 
             } 
 
void OnTimer()
{ //Alert(MarketInfo("EURUSD",MODE_SPREAD));
if(ronce==0)
{
Alert(" Fully Operation........................................>");ronce=ronce+1;
} 
{  

if(TimeHour(TimeLocal())>=0  && TimeHour(TimeLocal())<=23 )
 {
// Currency Strength/Weakness 70 or 30
       for(int j=0;j<8;j++){
       strr[j] = currency_strength(curr[j]); //Alert(curr[j], " ",strr[j]);
                      if (strr[j] > mst){
        if (curr[j]==curr[0]){usd = 1; positive[0]=1;}
        if (curr[j]==curr[1]){eur = 1; positive[1]=1;}
        if (curr[j]==curr[2]){gbp = 1; positive[2]=1;}
        if (curr[j]==curr[3]){jpy = 1; positive[3]=1;}
        if (curr[j]==curr[4]){aud = 1; positive[4]=1;}
        if (curr[j]==curr[5]){nzd = 1; positive[5]=1;}
        if (curr[j]==curr[6]){cad = 1; positive[6]=1;}
        if (curr[j]==curr[7]){chf = 1; positive[7]=1;}                                      
                                       }
             
                     if (strr[j] < slv){
        if (curr[j]==curr[0]){usd = 1; negative[0]=1;}
        if (curr[j]==curr[1]){eur = 1; negative[1]=1;}
        if (curr[j]==curr[2]){gbp = 1; negative[2]=1;}
        if (curr[j]==curr[3]){jpy = 1; negative[3]=1;}
        if (curr[j]==curr[4]){aud = 1; negative[4]=1;}
        if (curr[j]==curr[5]){nzd= 1;  negative[5]=1;}
        if (curr[j]==curr[6]){cad = 1; negative[6]=1;}
        if (curr[j]==curr[7]){chf = 1; negative[7]=1;}
                                       }
        //if (strr[j] < mst && strr[j] > slv){positive[j]=0;negative[j]=0;}
        }
          
       }
      
// Pip 10-25 -10-25
        for(int c=0;c<ArraySize(TradePairs);c++){
        
      //if(TimeHour(TimeLocal())>=0  && TimeHour(TimeLocal())<=11 ){pipchg_close= iClose(TradePairs[c], 1440, 1);}
      //if(TimeHour(TimeLocal())>=13  && TimeHour(TimeLocal())<=15 ){pipchg_close= iClose(TradePairs[c], PERIOD_H4, 1);}
      //if(TimeHour(TimeLocal())>=16  && TimeHour(TimeLocal())<=18 ){pipchg_close= iClose(TradePairs[c], PERIOD_H4, 2);} 
      
      if(TimeHour(TimeLocal())>=1  && TimeHour(TimeLocal())<=4 ){pipchg_close= iClose(TradePairs[c], PERIOD_D1, 1);}
      if(TimeHour(TimeLocal())>=5  && TimeHour(TimeLocal())<=8 ){pipchg_close= iClose(TradePairs[c], PERIOD_M30, 3);}
      if(TimeHour(TimeLocal())>=9  && TimeHour(TimeLocal())<=23 ){pipchg_close= iClose(TradePairs[c], PERIOD_M15, 11);}              
                
  if(MarketInfo(TradePairs[c],MODE_DIGITS) == 0){point = 0;            Rpt = 1;}
  else if(MarketInfo(TradePairs[c],MODE_DIGITS) == 1){point = 0.1;     Rpt = 10;}
  else if(MarketInfo(TradePairs[c],MODE_DIGITS) == 2){point = 0.01;    Rpt = 100;}
  else if(MarketInfo(TradePairs[c],MODE_DIGITS) == 3){point = 0.001;   Rpt = 1000;}
  else if(MarketInfo(TradePairs[c],MODE_DIGITS) == 4){point = 0.0001;  Rpt = 10000;}
  else if(MarketInfo(TradePairs[c],MODE_DIGITS) == 5){point = 0.00001; Rpt = 100000;}
        
        pipchg[c] = (iClose(TradePairs[c], 1, 0) - pipchg_close)*Rpt;
        pipchg[c] = MathRound(pipchg[c])/10;
                  for (int d = 0; d<8; d++){
                  //if (1){pass=pipchg[c]; pipchgval[d]= pass; Alert("yes "+TradePairs[c]+" "+pipchgval[d]);}
                  if(usd==1 && usdlist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar2[d]=1; pipchgval[d]= pipchg[c]; }
                  if(eur==1 && eurlist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar3[d]=1; pipchgval2[d]= pipchg[c]; }
                  if(gbp==1 && gbplist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar4[d]=1; pipchgval3[d]= pipchg[c]; }
                  if(jpy==1 && jpylist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar5[d]=1; pipchgval4[d]= pipchg[c]; }
                  if(aud==1 && audlist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar6[d]=1; pipchgval5[d]= pipchg[c]; }
                  if(nzd==1 && nzdlist[d]==TradePairs[c] && pipchg[c]>ppmi&& pipchg[c]<= ppma){toggVar7[d]=1; pipchgval6[d]= pipchg[c]; }
                  if(cad==1 && cadlist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar8[d]=1; pipchgval7[d]= pipchg[c]; }
                  if(chf==1 && chflist[d]==TradePairs[c] && pipchg[c]>ppmi && pipchg[c]<= ppma){toggVar9[d]=1; pipchgval8[d]= pipchg[c]; }
                                           
                  if(usd==1 && usdlist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar2[d]=1; pipchgval[d]= pipchg[c]; }
                  if(eur==1 && eurlist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar3[d]=1; pipchgval2[d]= pipchg[c]; }
                  if(gbp==1 && gbplist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar4[d]=1; pipchgval3[d]= pipchg[c]; }
                  if(jpy==1 && jpylist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar5[d]=1; pipchgval4[d]= pipchg[c]; }
                  if(aud==1 && audlist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar6[d]=1; pipchgval5[d]= pipchg[c]; }
                  if(nzd==1 && nzdlist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar7[d]=1; pipchgval6[d]= pipchg[c]; }
                  if(cad==1 && cadlist[d]==TradePairs[c] && pipchg[c]<-ppmi&& pipchg[c]>=-ppma){toggVar8[d]=1; pipchgval7[d]= pipchg[c]; }
                  if(chf==1 && chflist[d]==TradePairs[c] && pipchg[c]<-ppmi && pipchg[c]>=-ppma){toggVar9[d]=1; pipchgval8[d]= pipchg[c]; }
                                            // Alert(pipchg[c]);Alert(usdlist[d]+" "+pipchg[c]);
                                            //&& pipchg[c]>10 && pipchg[c]<= 25
                                           }
                                                }


// Percentage change 0.10-0.25     
        for(int i=0;i<ArraySize(TradePairs);i++){
        
      //if(TimeHour(TimeLocal())>=0  && TimeHour(TimeLocal())<=11 ){pertnchg_close=iClose(TradePairs[i], 1440, 1);}
      //if(TimeHour(TimeLocal())>=13  && TimeHour(TimeLocal())<=15 ){pertnchg_close=iClose(TradePairs[i], PERIOD_H4, 1);}
      //if(TimeHour(TimeLocal())>=16  && TimeHour(TimeLocal())<=18 ){pertnchg_close=iClose(TradePairs[i], PERIOD_H4, 2);}
      
      if(TimeHour(TimeLocal())>=1  && TimeHour(TimeLocal())<=4 ){pertnchg_close=iClose(TradePairs[i], PERIOD_D1, 1);}
      if(TimeHour(TimeLocal())>=5  && TimeHour(TimeLocal())<=8 ){pertnchg_close=iClose(TradePairs[i], PERIOD_M30, 3);}
      if(TimeHour(TimeLocal())>=9  && TimeHour(TimeLocal())<=23 ){pertnchg_close=iClose(TradePairs[i], PERIOD_M15, 11);}
      
        
        
        pertnchg[i] = (iClose(TradePairs[i], 1, 0) - pertnchg_close )/ pertnchg_close * 100; 
                  for (int k = 0; k<8; k++){
                  
                  if(usd==1 && usdlist[k]==TradePairs[i] && (StringSubstr(TradePairs[i],0,3)=="USD")){firstpair = 1;}
                  if(usd==1 && usdlist[k]==TradePairs[i] && (StringSubstr(TradePairs[i],3,3)=="USD")){firstpair = 0;}
                  if(usd==1 && usdlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[0]==1 &&firstpair==1){toggVar[0]+=1;}
                  if(usd==1 && usdlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair==0 && positive[0]==1){toggVar[0]+=1;}
                  if(usd==1 && usdlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair==1 && negative[0]==1){toggVar[0]+=1;}
                  if(usd==1 && usdlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair==0 && negative[0]==1 ){toggVar[0]+=1;}
                  
                  
                  if(eurlist[k]==TradePairs[i] && ("EUR"==StringSubstr(TradePairs[i],0,3))){ firstpair2 = 1;}
                  if(eurlist[k]==TradePairs[i] && ("EUR"==StringSubstr(TradePairs[i],3,3))){firstpair2=0;}
                  if(eur==1 && eurlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[1]==1 &&firstpair2==1){toggVar[1]+=1;}
                  if(eur==1 && eurlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair2==0 && positive[1]==1){toggVar[1]+=1;}
                  if(eur==1 && eurlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair2==1 && negative[1]==1){toggVar[1]+=1;}
                  if(eur==1 && eurlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair2==0 && negative[1]==1){toggVar[1]+=1;}
                  
                  
                  if(gbplist[k]==TradePairs[i] && ("GBP"==StringSubstr(TradePairs[i],0,3))){ firstpair3 = 1;}
                  if(gbplist[k]==TradePairs[i] && ("GBP"==StringSubstr(TradePairs[i],3,3))){firstpair3=0;}
                  if(gbp==1 && gbplist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[2]==1 &&firstpair3==1){toggVar[2]+=1;}
                  if(gbp==1 && gbplist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair3==0 && positive[2]==1){toggVar[2]+=1;}
                  if(gbp==1 && gbplist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair3==1 && negative[2]==1){toggVar[2]+=1;}
                  if(gbp==1 && gbplist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair3==0 && negative[2]==1){toggVar[2]+=1;}
                  
                  
                  if(jpylist[k]==TradePairs[i] && ("JPY"==StringSubstr(TradePairs[i],0,3))){ firstpair4 = 1;}
                  if(jpylist[k]==TradePairs[i] && ("JPY"==StringSubstr(TradePairs[i],3,3))){firstpair4=0;}
                  if(jpy==1 && jpylist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[3]==1 &&firstpair4==1){toggVar[3]+=1;}
                  if(jpy==1 && jpylist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair4==0 && positive[3]==1){toggVar[3]+=1;}
                  if(jpy==1 && jpylist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair4==1 && negative[3]==1){toggVar[3]+=1;}
                  if(jpy==1 && jpylist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair4==0 && negative[3]==1){toggVar[3]+=1;}                  

                  
                  if(audlist[k]==TradePairs[i] && ("AUD"==StringSubstr(TradePairs[i],0,3))){ firstpair5 = 1;}
                  if(audlist[k]==TradePairs[i] && ("AUD"==StringSubstr(TradePairs[i],3,3))){firstpair5=0;}
                  if(aud==1 && audlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[4]==1 &&firstpair5==1){toggVar[4]+=1;}
                  if(aud==1 && audlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair5==0 && positive[4]==1){toggVar[4]+=1;}
                  if(aud==1 && audlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair5==1 && negative[4]==1){toggVar[4]+=1;}
                  if(aud==1 && audlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair5==0 && negative[4]==1){toggVar[4]+=1;}
                  
                  
                  if(nzdlist[k]==TradePairs[i] && ("NZD"==StringSubstr(TradePairs[i],0,3))){ firstpair6 = 1;}
                  if(nzdlist[k]==TradePairs[i] && ("NZD"==StringSubstr(TradePairs[i],3,3))){firstpair6=0;}
                  if(nzd==1 && nzdlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[5]==1 &&firstpair6==1){toggVar[5]+=1;}
                  if(nzd==1 && nzdlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair6==0 && positive[5]==1){toggVar[5]+=1;}
                  if(nzd==1 && nzdlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair6==1 && negative[5]==1){toggVar[5]+=1;}
                  if(nzd==1 && nzdlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair6==0 && negative[5]==1){toggVar[5]+=1;}
                  
                  
                  if(cadlist[k]==TradePairs[i] && ("CAD"==StringSubstr(TradePairs[i],0,3))){ firstpair7 = 1;}
                  if(cadlist[k]==TradePairs[i] && ("CAD"==StringSubstr(TradePairs[i],3,3))){firstpair7=0;}
                  if(cad==1 && cadlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[6]==1 &&firstpair7==1){toggVar[6]+=1;}
                  if(cad==1 && cadlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair7==0 && positive[6]==1){toggVar[6]+=1;}
                  if(cad==1 && cadlist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair7==1 && negative[6]==1){toggVar[6]+=1;}
                  if(cad==1 && cadlist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair7==0 && negative[6]==1){toggVar[6]+=1;}
                  
                  
                  if(chflist[k]==TradePairs[i] && ("CHF"==StringSubstr(TradePairs[i],0,3))){ firstpair8 = 1;}
                  if(chflist[k]==TradePairs[i] && ("CHF"==StringSubstr(TradePairs[i],3,3))){firstpair8=0;}
                  if(chf==1 && chflist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi && positive[7]==1 &&firstpair8==1){toggVar[7]+=1;}
                  if(chf==1 && chflist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair8==0 && positive[7]==1){toggVar[7]+=1;}
                  if(chf==1 && chflist[k]==TradePairs[i] && pipchg[i]<-ppmi && pertnchg[i]<-pcmi &&firstpair8==1 && negative[7]==1){toggVar[7]+=1;}
                  if(chf==1 && chflist[k]==TradePairs[i] && pipchg[i]>ppmi && pertnchg[i]>pcmi &&firstpair8==0 && negative[7]==1){toggVar[7]+=1;}
                                                              
                                            }              
                   // Alert(toggVar[0]);
                     } //Alert("Nextb");
                                             
                    // Alert(TradePairs[i]+" "+pipchg[i]+" "+pertnchg[i]);
                  // Alert(toggVar[1]);  
                  //toggVar[7] = 4;      
            
if(ronce==-1){
Alert("Start");
Alert(toggVar[0]); 
Alert(toggVar[1]); 
Alert(toggVar[2]); 
Alert(toggVar[3]); 
Alert(toggVar[4]); 
Alert(toggVar[5]); 
Alert(toggVar[6]); 
Alert(toggVar[7]); 

ronce=ronce+1;
} 

 
//BEGINNING OF TRADE ALERT             ronce==0
if(1){  

//if(toggVar[0]>=4||toggVar[1]>=4||toggVar[2]>=4||toggVar[3]>=4||toggVar[4]>=4||toggVar[5]>=4||toggVar[6]>=4||toggVar[7]>=4)
//{Alert("");

//Alert("INITIALIZING.....................................................................>>");
//Alert("LOADING..................................100%.................................>>");
//Alert("WELCOME >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");}

//------------------------------------------------------------------------------------------------------  
       // USD PAIRS
              if(toggVar[0]>=4){ 
                           // Alert(" ");
                            if(currency_strength(curr[0])<=slv){power="WEAK";}else{power="STRONG";}
                           // Alert(curr[0]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[0]),0)+"%");
                            
                            for (int z = 0; z<28; z++)          {
                            for (int b = 0; b<8; b++)                {
                                 if(usdlist[b]==TradePairs[z] && ((pertnchg[z]>pcmi&& pertnchg[z]<= pcma && positive[0]==1)||(pertnchg[z]<-pcmi&& pertnchg[z]>=-pcma && negative[0]==1))&& toggVar2[b]==1)
                                 {
                                     if("USD"==StringSubstr(TradePairs[z],0,3)){ otherpair = StringSubstr(TradePairs[z],3,3);}
                                     if("USD"==StringSubstr(TradePairs[z],3,3)){ otherpair = StringSubstr(TradePairs[z],0,3);}
                                 if((currency_strength(curr[0])>=mst && currency_strength(otherpair)<= slv)||(currency_strength(curr[0])<=slv && currency_strength(otherpair)>= mst))
                                 {
                              //   Alert("Trade Alert(Rule1-4) 'USD': "+ usdlist[b]+"    Pip: "+DoubleToStr(pipchgval[b],0)+"     Ch%: "+ DoubleToStr(pertnchg[z],2)+"     "+otherpair+": "+ DoubleToStr(currency_strength(otherpair),0)+"%");
                                  trdtrigr[b]=1;
                                 }
                                  }}
                                   }}else{};                                   
//------------------------------------------------------------------------------------------------------                                   
       // EUR PAIRS
              if(toggVar[1]>=4){ 
                         //   Alert(" ");
                            if(currency_strength(curr[1])<=slv){power="WEAK";}else{power="STRONG";}
                          //  Alert(curr[1]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[1]),0)+"%");
                            
                            for (int z1 = 0; z1<28; z1++)          {
                            for (int b1 = 0; b1<8; b1++)                {                                 
                                 if(eurlist[b1]==TradePairs[z1] && ((pertnchg[z1]>pcmi&& pertnchg[z1]<= pcma && positive[1]==1)||(pertnchg[z1]<-pcmi&& pertnchg[z1]>=-pcma&& negative[1]==1))&& toggVar3[b1]==1)
                                 {
                                     if("EUR"==StringSubstr(TradePairs[z1],0,3)){ otherpair2 = StringSubstr(TradePairs[z1],3,3);}
                                     if("EUR"==StringSubstr(TradePairs[z1],3,3)){ otherpair2 = StringSubstr(TradePairs[z1],0,3);}
                                 if((currency_strength(curr[1])>=mst && currency_strength(otherpair2)<= slv)||(currency_strength(curr[1])<=slv && currency_strength(otherpair2)>= mst))
                                 {
                             //    Alert("Trade Alert(Rule1-4) 'EUR': "+ eurlist[b1]+"     Pip: "+DoubleToStr(pipchgval2[b1],0)+"     Ch%: "+ DoubleToStr(pertnchg[z1],2)+"     "+otherpair2+": "+ DoubleToStr(currency_strength(otherpair2),0)+"%");
                                  trdtrigr2[b1]=1;
                                 }
                                 }}
                                   }}else{};
//------------------------------------------------------------------------------------------------------                        
       // GBP PAIRS
              if(toggVar[2]>=4){ 
                        //    Alert(" ");
                            if(currency_strength(curr[2])<=slv){power="WEAK";}else{power="STRONG";}
                        //    Alert(curr[2]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[2]),0)+"%");
                            
                            for (int z2 = 0; z2<28; z2++)          {
                            for (int b2 = 0; b2<8; b2++)                {                                 
                                 
                                 if(gbplist[b2]==TradePairs[z2] && ((pertnchg[z2]>pcmi&& pertnchg[z2]<= pcma && positive[2]==1)||(pertnchg[z2]<-pcmi&& pertnchg[z2]>=-pcma&& negative[2]==1))&& toggVar4[b2]==1)
                                 {
                                     if("GBP"==StringSubstr(TradePairs[z2],0,3)){ otherpair3 = StringSubstr(TradePairs[z2],3,3);}
                                     if("GBP"==StringSubstr(TradePairs[z2],3,3)){ otherpair3 = StringSubstr(TradePairs[z2],0,3);}
                                 if((currency_strength(curr[2])>=mst && currency_strength(otherpair3)<= slv)||(currency_strength(curr[2])<=slv && currency_strength(otherpair3)>= mst))
                                 {
                       //          Alert("Trade Alert(Rule1-4) 'GBP': "+ gbplist[b2]+"    Pip: "+DoubleToStr(pipchgval3[b2],0)+"     Ch%: "+ DoubleToStr(pertnchg[z2],2)+"     "+otherpair3+": "+ DoubleToStr(currency_strength(otherpair3),0)+"%");
                                  trdtrigr3[b2]=1;
                                 }
                                  } }
                                   }}else{};
//------------------------------------------------------------------------------------------------------                       
       // JPY PAIRS
              if(toggVar[3]>=4){ 
                       //     Alert(" ");
                            if(currency_strength(curr[3])<=slv){power="WEAK";}else{power="STRONG";}
                        //    Alert(curr[3]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[3]),0)+"%");
                            
                            for (int z3 = 0; z3<28; z3++)          {
                            for (int b3 = 0; b3<8; b3++)                {                                 
                                 
                                 if(jpylist[b3]==TradePairs[z3] && ((pertnchg[z3]>pcmi&& pertnchg[z3]<= pcma && positive[3]==1)||(pertnchg[z3]<-pcmi&& pertnchg[z3]>=-pcma&& negative[3]==1))&& toggVar5[b3]==1)
                                 {
                                     if("JPY"==StringSubstr(TradePairs[z3],0,3)){ otherpair4 = StringSubstr(TradePairs[z3],3,3);}
                                     if("JPY"==StringSubstr(TradePairs[z3],3,3)){ otherpair4 = StringSubstr(TradePairs[z3],0,3);}
                                     
                                 if((currency_strength(curr[3])>=mst && currency_strength(otherpair4)<= slv)||(currency_strength(curr[3])<=slv && currency_strength(otherpair4)>= mst))
                                 {
                         //        Alert("Trade Alert(Rule1-4) 'JPY': "+ jpylist[b3]+"    Pip: "+DoubleToStr(pipchgval4[b3],0)+"     Ch%: "+ DoubleToStr(pertnchg[z3],2)+"     "+otherpair4+": "+ DoubleToStr(currency_strength(otherpair4),0)+"%");
                                  trdtrigr4[b3]=1;
                                 } 
                                    }                                 }
                                   }}else{};
//------------------------------------------------------------------------------------------------------  
       // AUD PAIRS
              if(toggVar[4]>=4){ 
                         //   Alert(" ");
                            if(currency_strength(curr[4])<=slv){power="WEAK";}else{power="STRONG";}
                         //   Alert(curr[4]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[4]),0)+"%");
                            
                            for (int z4 = 0; z4<28; z4++)          {
                            for (int b4 = 0; b4<8; b4++)                {                                 

                                 if(audlist[b4]==TradePairs[z4] && ((pertnchg[z4]>pcmi&& pertnchg[z4]<= pcma && positive[4]==1)||(pertnchg[z4]<-pcmi&& pertnchg[z4]>=-pcma&& negative[4]==1))&& toggVar6[b4]==1)
                                 {
                                     if("AUD"==StringSubstr(TradePairs[z4],0,3)){ otherpair5 = StringSubstr(TradePairs[z4],3,3);}
                                     if("AUD"==StringSubstr(TradePairs[z4],3,3)){ otherpair5 = StringSubstr(TradePairs[z4],0,3);}
                                 if((currency_strength(curr[4])>=mst && currency_strength(otherpair5)<= slv)||(currency_strength(curr[4])<=slv && currency_strength(otherpair5)>= mst))
                                 {
                         //        Alert("Trade Alert(Rule1-4) 'AUD': "+ audlist[b4]+"    Pip: "+DoubleToStr(pipchgval5[b4],0)+"     Ch%: "+ DoubleToStr(pertnchg[z4],2)+"     "+otherpair5+": "+ DoubleToStr(currency_strength(otherpair5),0)+"%");
                                  trdtrigr5[b4]=1;
                                 }
                                  }}
                                   }}else{};
//------------------------------------------------------------------------------------------------------                       
       // NZD PAIRS
              if(toggVar[5]>=4){ 
                        //    Alert(" ");
                            if(currency_strength(curr[5])<=slv){power="WEAK";}else{power="STRONG";}
                        //    Alert(curr[5]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[5]),0)+"%");
                            
                            for (int z5 = 0; z5<28; z5++)          {
                            for (int b5 = 0; b5<8; b5++)                {                                 
                                 if(nzdlist[b5]==TradePairs[z5] && ((pertnchg[z5]>pcmi&& pertnchg[z5]<= pcma && positive[5]==1)||(pertnchg[z5]<-pcmi&& pertnchg[z5]>=-pcma&& negative[5]==1))&& toggVar7[b5]==1)
                                 {
                                     if("NZD"==StringSubstr(TradePairs[z5],0,3)){ otherpair6 = StringSubstr(TradePairs[z5],3,3);}
                                     if("NZD"==StringSubstr(TradePairs[z5],3,3)){ otherpair6 = StringSubstr(TradePairs[z5],0,3);}
                                 if((currency_strength(curr[5])>=mst && currency_strength(otherpair6)<= slv)||(currency_strength(curr[5])<=slv && currency_strength(otherpair6)>= mst))
                                 {
                         //        Alert("Trade Alert(Rule1-4) 'NZD': "+ nzdlist[b5]+"    Pip: "+DoubleToStr(pipchgval6[b5],0)+"    Ch%: "+ DoubleToStr(pertnchg[z5],2)+"     "+otherpair6+": "+ DoubleToStr(currency_strength(otherpair6),0)+"%");
                                  trdtrigr6[b5]=1;
                                 }
                                  }}
                                   }}else{};
//------------------------------------------------------------------------------------------------------  
       // CAD PAIRS
              if(toggVar[6]>=4){ 
                        //    Alert(" ");
                            if(currency_strength(curr[6])<=slv){power="WEAK";}else{power="STRONG";}
                        //    Alert(curr[6]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[6]),0)+"%");
                            
                            for (int z6 = 0; z6<28; z6++)          {
                            for (int b6 = 0; b6<8; b6++)                {                                 
                                 if(cadlist[b6]==TradePairs[z6] && ((pertnchg[z6]>pcmi&& pertnchg[z6]<= pcma && positive[6]==1)||(pertnchg[z6]<-pcmi&& pertnchg[z6]>=-pcma&& negative[6]==1))&& toggVar8[b6]==1)
                                 {
                                     if("CAD"==StringSubstr(TradePairs[z6],0,3)){ otherpair7 = StringSubstr(TradePairs[z6],3,3);}
                                     if("CAD"==StringSubstr(TradePairs[z6],3,3)){ otherpair7 = StringSubstr(TradePairs[z6],0,3);}
                                 if((currency_strength(curr[6])>=mst && currency_strength(otherpair7)<= slv)||(currency_strength(curr[6])<=slv && currency_strength(otherpair7)>= mst))
                                 {
                        //         Alert("Trade Alert(Rule1-4) 'CAD': "+ cadlist[b6]+"    Pip: "+DoubleToStr(pipchgval7[b6],0)+"     Ch%: "+ DoubleToStr(pertnchg[z6],2)+"     "+otherpair7+": "+ DoubleToStr(currency_strength(otherpair7),0)+"%");
                                  trdtrigr7[b6]=1;
                                 }
                                  }}
                                   }}else{};
//------------------------------------------------------------------------------------------------------  
       // CHF PAIRS
              if(toggVar[7]>=4){ 
                       //     Alert(" ");
                            if(currency_strength(curr[7])<=slv){power="WEAK";}else{power="STRONG";}
                       //     Alert(curr[7]+" PAIR"+"   '"+power+"' : "+DoubleToStr(currency_strength(curr[7]),0)+"%");
                            
                            for (int z7 = 0; z7<28; z7++)          {
                            for (int b7 = 0; b7<8; b7++)                {                                 
                                 if(chflist[b7]==TradePairs[z7] && ((pertnchg[z7]>pcmi&& pertnchg[z7]<= pcma && positive[7]==1)||(pertnchg[z]<-pcmi&& pertnchg[z7]>=-pcma&& negative[7]==1))&& toggVar9[b7]==1)
                                 {
                                     if("CHF"==StringSubstr(TradePairs[z7],0,3)){ otherpair8 = StringSubstr(TradePairs[z7],3,3);}
                                     if("CHF"==StringSubstr(TradePairs[z7],3,3)){ otherpair8 = StringSubstr(TradePairs[z7],0,3);}
                                 if((currency_strength(curr[7])>=mst && currency_strength(otherpair8)<= slv)||(currency_strength(curr[7])<=slv && currency_strength(otherpair8)>= mst))
                                 {
                       //          Alert("Trade Alert(Rule1-4) 'CHF': "+ chflist[b7]+"    Pip: "+DoubleToStr(pipchgval8[b7],0)+"     Ch%: "+ DoubleToStr(pertnchg[z7],2)+"     "+otherpair8+": "+ DoubleToStr(currency_strength(otherpair8),0)+"%");
                                  trdtrigr8[b7]=1;
                                 }
                                  }}
                                   }}else{};
//------------------------------------------------------------------------------------------------------  
                                 
                 
        ronce=ronce+1; // Alert(pcma);
      // end of ronce
       }



// REST VARIABLES WHEN BASKET IS CLOSED
/*
//USD
for(int trx=0; trx<8; trx++)
{
            for (int kjx = 0; kjx < OrdersTotal(); kjx++){
            int checkselectx = OrderSelect(kjx, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== usdlist[trx] && OrderMagicNumber()==trx){emtchcx[0] += 1;}}
}
if(emtchcx[0] == 0)
{
for(int rx=0; rx<8; rx++){emtchc[rx] =0;}
}
*/
//AUD
//emtchcx[4] = 0;
/*
for(int trx5=0; trx5<8; trx5++)
{
            for (int kjx5 = 0; kjx5 < OrdersTotal(); kjx5++){
            int checkselectx5 = OrderSelect(kjx5, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== audlist[trx5] && OrderMagicNumber()==trx5){;emtchcx[4] += 1;}}
}
//Alert(emtchcx[4]);
if(emtchcx[4] == 0)
{
for(int rx5=0; rx5<8; rx5++){emtchc5[rx5] =0;}
}
*/


// CONTROLLING DOUBLE TRADE DURING LONDON AND US SESSIONS
            for (int hj = 0; hj < OrdersTotal(); hj++){
            int checkselecttt = OrderSelect(0, SELECT_BY_POS, MODE_HISTORY);
            datetime ctm=OrderCloseTime();
           // Alert(ctm);
            if (OrderSymbol()== usdlist[hj] && OrderMagicNumber()==hj){}   
                                                        }//emtchc = 1;Alert(emtchc);


//for(int gy=0; gy<7; gy++){
//Alert(nzdlist[gy]," ovrS:",over_sold(nzdlist[gy]));
//}



// TRADE TRIGGER SECTION
//---------------------------------------------------
      //USD      
         
   
for(int tr=0; tr<8; tr++)
{     if(trdtrigr[tr]==1)
         {  //Alert("1st in");
            for (int kj = 0; kj < OrdersTotal(); kj++){
            int checkselect = OrderSelect(kj, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== usdlist[tr] && OrderMagicNumber()==tr){emtchc[tr] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc[tr]==0)
            {
            if(StringSubstr(usdlist[tr],0,3)=="USD" &&positive[0] && BullishEngulf(usdlist[tr])==1 && over_bought(usdlist[tr])==0
               &&(Bullish_forwardEngulf(usdlist[tr], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(usdlist[tr],PERIOD_H1,val_tal)==1)
              )
               {//Alert(usdlist[tr]);
               int ticket00=OrderSend(usdlist[tr],OP_BUY,lotSize,MarketInfo(usdlist[tr],MODE_ASK),0,0,0,"",tr,0,clrNONE);
               SendMail_function("USD",ticket00, usdlist[tr], "BUY");
               if(ticket00<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");       yyx=0;        ok_B = 0;
               }
            if(StringSubstr(usdlist[tr],0,3)!="USD"&&negative[0] && BullishEngulf(usdlist[tr])==1 && over_bought(usdlist[tr])==0
               &&(Bullish_forwardEngulf(usdlist[tr], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(usdlist[tr],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket00a=OrderSend(usdlist[tr],OP_BUY,lotSize,MarketInfo(usdlist[tr],MODE_ASK),0,0,0,"",tr,0,clrNONE);
               SendMail_function("USD",ticket00, usdlist[tr], "BUY");
               if(ticket00a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");         yyx=0;      ok_B = 0;
               }
            if(StringSubstr(usdlist[tr],0,3)!="USD"&&positive[0] && BearishEngulf(usdlist[tr])==1 && over_sold(usdlist[tr])==0
               &&(Bearish_forwardEngulf(usdlist[tr], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(usdlist[tr],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket10=OrderSend(usdlist[tr],OP_SELL,lotSize,MarketInfo(usdlist[tr],MODE_BID),0,0,0,"",tr,0,clrNONE);
               SendMail_function("USD",ticket10, usdlist[tr], "SELL");
               if(ticket10<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;     ok_S = 0;
               }
            if(StringSubstr(usdlist[tr],0,3)=="USD" &&negative[0]&&BearishEngulf(usdlist[tr])==1 && over_sold(usdlist[tr])==0
               &&(Bearish_forwardEngulf(usdlist[tr], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(usdlist[tr],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket10a=OrderSend(usdlist[tr],OP_SELL,lotSize,MarketInfo(usdlist[tr],MODE_BID),0,0,0,"",tr,0,clrNONE);
               SendMail_function("USD",ticket10a, usdlist[tr], "SELL");
               if(ticket10a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;     ok_S = 0;
               }               
               }
      trdtrigr[tr]=0;
 }}        
//---------------------------------------------------
      //EUR
           
for(int tr2=0; tr2<8; tr2++)
{     if(trdtrigr2[tr2]==1)
         {  //Alert("1st in");
            for (int kj2 = 0; kj2 < OrdersTotal(); kj2++){
            int checkselect2 = OrderSelect(kj2, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== eurlist[tr2]&& OrderMagicNumber()==tr2){emtchc2[tr2] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc2[tr2]==0)
            {
            if(StringSubstr(eurlist[tr2],0,3)=="EUR"&&positive[1]&&BullishEngulf(eurlist[tr2])==1 && over_bought(eurlist[tr2])==0
               &&(Bullish_forwardEngulf(eurlist[tr2], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(eurlist[tr2],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket02=OrderSend(eurlist[tr2],OP_BUY,lotSize,MarketInfo(eurlist[tr2],MODE_ASK),0,0,0,"",tr2,0,clrNONE);
               SendMail_function("EUR",ticket02, eurlist[tr2], "BUY");
               if(ticket02<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(eurlist[tr2],0,3)!="EUR"&&negative[1]&&BullishEngulf(eurlist[tr2])==1 && over_bought(eurlist[tr2])==0
               &&(Bullish_forwardEngulf(eurlist[tr2], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(eurlist[tr2],PERIOD_H1,val_tal)==1)
              )               
               {
               int ticket02a=OrderSend(eurlist[tr2],OP_BUY,lotSize,MarketInfo(eurlist[tr2],MODE_ASK),0,0,0,"",tr2,0,clrNONE);
               SendMail_function("EUR",ticket02a, eurlist[tr2], "BUY");
               if(ticket02a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(eurlist[tr2],0,3)!="EUR"&&positive[1]&&BearishEngulf(eurlist[tr2])==1 && over_sold(eurlist[tr2])==0
               &&(Bearish_forwardEngulf(eurlist[tr2], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(eurlist[tr2],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket12=OrderSend(eurlist[tr2],OP_SELL,lotSize,MarketInfo(eurlist[tr2],MODE_BID),0,0,0,"",tr2,0,clrNONE);
               SendMail_function("EUR",ticket12, eurlist[tr2], "SELL");
               if(ticket12<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }
            if(StringSubstr(eurlist[tr2],0,3)=="EUR"&&negative[1]&&BearishEngulf(eurlist[tr2])==1 && over_sold(eurlist[tr2])==0
               &&(Bearish_forwardEngulf(eurlist[tr2], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(eurlist[tr2],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket12a=OrderSend(eurlist[tr2],OP_SELL,lotSize,MarketInfo(eurlist[tr2],MODE_BID),0,0,0,"",tr2,0,clrNONE);
               SendMail_function("EUR",ticket12a, eurlist[tr2], "SELL");
               if(ticket12a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;    ok_S=0;
               }               
               }
      trdtrigr2[tr2]=0;
 }}     
//---------------------------------------------------
      //GBP
      
for(int tr3=0; tr3<8; tr3++)
{     if(trdtrigr3[tr3]==1)
         {  //Alert("1st in");
            for (int kj3 = 0; kj3 < OrdersTotal(); kj3++){
            int checkselect3 = OrderSelect(kj3, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== gbplist[tr3]&& OrderMagicNumber()==tr3){emtchc3[tr3] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc3[tr3]==0)
            {
            if(StringSubstr(gbplist[tr3],0,3)=="GBP"&&positive[2]&&BullishEngulf(gbplist[tr3])==1 && over_bought(gbplist[tr3])==0
               &&(Bullish_forwardEngulf(gbplist[tr3], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(gbplist[tr3],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket03=OrderSend(gbplist[tr3],OP_BUY,lotSize,MarketInfo(gbplist[tr3],MODE_ASK),0,0,0,"",tr3,0,clrNONE);
               SendMail_function("GBP",ticket03, gbplist[tr3], "BUY");
               if(ticket03<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(gbplist[tr3],0,3)!="GBP"&&negative[2]&&BullishEngulf(gbplist[tr3])==1 && over_bought(gbplist[tr3])==0
               &&(Bullish_forwardEngulf(gbplist[tr3], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(gbplist[tr3],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket03a=OrderSend(gbplist[tr3],OP_BUY,lotSize,MarketInfo(gbplist[tr3],MODE_ASK),0,0,0,"",tr3,0,clrNONE);
               SendMail_function("GBP",ticket03a, gbplist[tr3], "BUY");
               if(ticket03a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(gbplist[tr3],0,3)!="GBP"&&positive[2]&&BearishEngulf(gbplist[tr3])==1  && over_sold(gbplist[tr3])==0
               &&(Bearish_forwardEngulf(gbplist[tr3], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(gbplist[tr3],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket13=OrderSend(gbplist[tr3],OP_SELL,lotSize,MarketInfo(gbplist[tr3],MODE_BID),0,0,0,"",tr3,0,clrNONE);
               SendMail_function("GBP",ticket13, gbplist[tr3], "SELL");
               if(ticket13<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0; ok_S=0;
               }
            if(StringSubstr(gbplist[tr3],0,3)=="GBP"&&negative[2]&&BearishEngulf(gbplist[tr3])==1  && over_sold(gbplist[tr3])==0
               &&(Bearish_forwardEngulf(gbplist[tr3], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(gbplist[tr3],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket13a=OrderSend(gbplist[tr3],OP_SELL,lotSize,MarketInfo(gbplist[tr3],MODE_BID),0,0,0,"",tr3,0,clrNONE);
               SendMail_function("GBP",ticket13a, gbplist[tr3], "SELL");
               if(ticket13a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }}
      trdtrigr3[tr3]=0;
 }}     
//---------------------------------------------------
      //JPY
      
for(int tr4=0; tr4<8; tr4++)
{     if(trdtrigr4[tr4]==1)
         {  //Alert("1st in");
            for (int kj4 = 0; kj4 < OrdersTotal(); kj4++){
            int checkselect4 = OrderSelect(kj4, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== jpylist[tr4]&& OrderMagicNumber()==tr4){emtchc4[tr4]= 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc4[tr4]==0)
            {
            if(StringSubstr(jpylist[tr4],0,3)=="JPY"&&positive[3]&&BullishEngulf(jpylist[tr4])==1 && over_bought(jpylist[tr4])==0
               &&(Bullish_forwardEngulf(jpylist[tr4], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(jpylist[tr4],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket04=OrderSend(jpylist[tr4],OP_BUY,lotSize,MarketInfo(jpylist[tr4],MODE_ASK),0,0,0,"",tr4,0,clrNONE);
               SendMail_function("JPY",ticket04, jpylist[tr4], "BUY");
               if(ticket04<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(jpylist[tr4],0,3)!="JPY"&&negative[3]&&BullishEngulf(jpylist[tr4])==1 && over_bought(jpylist[tr4])==0
               &&(Bullish_forwardEngulf(jpylist[tr4], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(jpylist[tr4],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket04a=OrderSend(jpylist[tr4],OP_BUY,lotSize,MarketInfo(jpylist[tr4],MODE_ASK),0,0,0,"",tr4,0,clrNONE);
               SendMail_function("JPY",ticket04a, jpylist[tr4], "BUY");
               if(ticket04a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(jpylist[tr4],0,3)!="JPY"&&positive[3]&&BearishEngulf(jpylist[tr4])==1 && over_sold(jpylist[tr4])==0
               &&(Bearish_forwardEngulf(jpylist[tr4], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(jpylist[tr4],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket14=OrderSend(jpylist[tr4],OP_SELL,lotSize,MarketInfo(jpylist[tr4],MODE_BID),0,0,0,"",tr4,0,clrNONE);
               SendMail_function("JPY",ticket14, jpylist[tr4], "SELL");
               if(ticket14<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }               
            if(StringSubstr(jpylist[tr4],0,3)=="JPY"&&negative[3]&&BearishEngulf(jpylist[tr4])==1 && over_sold(jpylist[tr4])==0
               &&(Bearish_forwardEngulf(jpylist[tr4], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(jpylist[tr4],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket14a=OrderSend(jpylist[tr4],OP_SELL,lotSize,MarketInfo(jpylist[tr4],MODE_BID),0,0,0,"",tr4,0,clrNONE);
               SendMail_function("JPY",ticket14a, jpylist[tr4], "SELL");
               if(ticket14a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }}
      trdtrigr4[tr4]=0;
 }}  
//---------------------------------------------------
      //AUD
      
for(int tr5=0; tr5<8; tr5++)
{     if(trdtrigr5[tr5]==1)
         {  //Alert("1st in");
            for (int kj5 = 0; kj5 < OrdersTotal(); kj5++){
            int checkselect5 = OrderSelect(kj5, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== audlist[tr5]&& OrderMagicNumber()==tr5){emtchc5[tr5] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc5[tr5]==0)
            {
            if(StringSubstr(audlist[tr5],0,3)=="AUD" && positive[4]&&BullishEngulf(audlist[tr5])==1 && over_bought(audlist[tr5])==0
               &&(Bullish_forwardEngulf(audlist[tr5], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(audlist[tr5],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket05=OrderSend(audlist[tr5],OP_BUY,lotSize,MarketInfo(audlist[tr5],MODE_ASK),0,0,0,"",tr5,0,clrNONE);
               SendMail_function("AUD",ticket05, audlist[tr5], "BUY");
               if(ticket05<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(audlist[tr5],0,3)!="AUD" && negative[4]&&BullishEngulf(audlist[tr5])==1 && over_bought(audlist[tr5])==0
               &&(Bullish_forwardEngulf(audlist[tr5], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(audlist[tr5],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket05a=OrderSend(audlist[tr5],OP_BUY,lotSize,MarketInfo(audlist[tr5],MODE_ASK),0,0,0,"",tr5,0,clrNONE);
               SendMail_function("AUD",ticket05a, audlist[tr5], "BUY");
               if(ticket05a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");      yyx=0; ok_B=0;
               }
            if(StringSubstr(audlist[tr5],0,3)!="AUD" && positive[4]&&BearishEngulf(audlist[tr5])==1  && over_sold(audlist[tr5])==0
               &&(Bearish_forwardEngulf(audlist[tr5], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(audlist[tr5],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket15=OrderSend(audlist[tr5],OP_SELL,lotSize,MarketInfo(audlist[tr5],MODE_BID),0,0,0,"",tr5,0,clrNONE);
               SendMail_function("AUD",ticket15, audlist[tr5], "SELL");
               if(ticket15<0){Print("OrderSend(-ve) failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0; ok_S=0;
               }
            if(StringSubstr(audlist[tr5],0,3)=="AUD" && negative[4]&&BearishEngulf(audlist[tr5])==1  && over_sold(audlist[tr5])==0
               &&(Bearish_forwardEngulf(audlist[tr5], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(audlist[tr5],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket15a=OrderSend(audlist[tr5],OP_SELL,lotSize,MarketInfo(audlist[tr5],MODE_BID),0,0,0,"",tr5,0,clrNONE);
               SendMail_function("AUD",ticket15a, audlist[tr5], "SELL");
               if(ticket15a<0){Print("OrderSend(-ve) failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               xyy=0; ok_S=0;
               }
               }
      trdtrigr5[tr5]=0;
 }}  
//---------------------------------------------------
      //NZD
      
for(int tr6=0; tr6<8; tr6++)
{     if(trdtrigr6[tr6]==1)
         {  //Alert("1st in");
            for (int kj6 = 0; kj6 < OrdersTotal(); kj6++){
            int checkselect6 = OrderSelect(kj6, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== nzdlist[tr6]&& OrderMagicNumber()==tr6){emtchc6[tr6] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc6[tr6]==0)
            {
            if(StringSubstr(nzdlist[tr6],0,3)=="NZD"&&positive[5]&&BullishEngulf(nzdlist[tr6])==1 && over_bought(nzdlist[tr6])==0
               &&(Bullish_forwardEngulf(nzdlist[tr6], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(nzdlist[tr6],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket06=OrderSend(nzdlist[tr6],OP_BUY,lotSize,MarketInfo(nzdlist[tr6],MODE_ASK),0,0,0,"",tr6,0,clrNONE);
               SendMail_function("NZD",ticket06, nzdlist[tr6], "BUY");
               if(ticket06<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(nzdlist[tr6],0,3)!="NZD"&&negative[5]&&BullishEngulf(nzdlist[tr6])==1 && over_bought(nzdlist[tr6])==0
               &&(Bullish_forwardEngulf(nzdlist[tr6], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(nzdlist[tr6],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket06a=OrderSend(nzdlist[tr6],OP_BUY,lotSize,MarketInfo(nzdlist[tr6],MODE_ASK),0,0,0,"",tr6,0,clrNONE);
               SendMail_function("NZD",ticket06a, nzdlist[tr6], "BUY");
               if(ticket06a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(nzdlist[tr6],0,3)!="NZD"&&positive[5]&&BearishEngulf(nzdlist[tr6])==1  && over_sold(nzdlist[tr6])==0
               &&(Bearish_forwardEngulf(nzdlist[tr6], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(nzdlist[tr6],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket16=OrderSend(nzdlist[tr6],OP_SELL,lotSize,MarketInfo(nzdlist[tr6],MODE_BID),0,0,0,"",tr6,0,clrNONE);
               SendMail_function("NZD",ticket16, nzdlist[tr6], "SELL");
               if(ticket16<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }               
            if(StringSubstr(nzdlist[tr6],0,3)=="NZD"&&negative[5]&&BearishEngulf(nzdlist[tr6])==1 && over_sold(nzdlist[tr6])==0
               &&(Bearish_forwardEngulf(nzdlist[tr6], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(nzdlist[tr6],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket16a=OrderSend(nzdlist[tr6],OP_SELL,lotSize,MarketInfo(nzdlist[tr6],MODE_BID),0,0,0,"",tr6,0,clrNONE);
               SendMail_function("NZD",ticket16a, nzdlist[tr6], "SELL");
               if(ticket16a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0; ok_S=0;
               }}
      trdtrigr6[tr6]=0;
 }}  
//---------------------------------------------------
      //CAD
      
for(int tr7=0; tr7<8; tr7++)
{     if(trdtrigr7[tr7]==1)
         {  //Alert("1st in");
            for (int kj7 = 0; kj7 < OrdersTotal(); kj7++){
            int checkselect7 = OrderSelect(kj7, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== cadlist[tr7]&& OrderMagicNumber()==tr7){emtchc7[tr7] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc7[tr7]==0)
            {
            if(StringSubstr(cadlist[tr7],0,3)=="CAD"&&positive[6]&&BullishEngulf(cadlist[tr7])==1 && over_bought(cadlist[tr7])==0
               &&(Bullish_forwardEngulf(cadlist[tr7], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(cadlist[tr7],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket07=OrderSend(cadlist[tr7],OP_BUY,lotSize,MarketInfo(cadlist[tr7],MODE_ASK),0,0,0,"",tr7,0,clrNONE);
               SendMail_function("CAD",ticket07, cadlist[tr7], "BUY");
               if(ticket07<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(cadlist[tr7],0,3)!="CAD"&&negative[6]&&BullishEngulf(cadlist[tr7])==1 && over_bought(cadlist[tr7])==0
               &&(Bullish_forwardEngulf(cadlist[tr7], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(cadlist[tr7],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket07a=OrderSend(cadlist[tr7],OP_BUY,lotSize,MarketInfo(cadlist[tr7],MODE_ASK),0,0,0,"",tr7,0,clrNONE);
               SendMail_function("CAD",ticket07a, cadlist[tr7], "BUY");
               if(ticket07a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(cadlist[tr7],0,3)!="CAD"&&positive[6]&&BearishEngulf(cadlist[tr7])==1  && over_sold(cadlist[tr7])==0
               &&(Bearish_forwardEngulf(cadlist[tr7], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(cadlist[tr7],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket17=OrderSend(cadlist[tr7],OP_SELL,lotSize,MarketInfo(cadlist[tr7],MODE_BID),0,0,0,"",tr7,0,clrNONE);
               SendMail_function("CAD",ticket17, cadlist[tr7], "SELL");
               if(ticket17<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }               
            if(StringSubstr(cadlist[tr7],0,3)=="CAD"&&negative[6]&&BearishEngulf(cadlist[tr7])==1  && over_sold(cadlist[tr7])==0
               &&(Bearish_forwardEngulf(cadlist[tr7], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(cadlist[tr7],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket17a=OrderSend(cadlist[tr7],OP_SELL,lotSize,MarketInfo(cadlist[tr7],MODE_BID),0,0,0,"",tr7,0,clrNONE);
               SendMail_function("CAD",ticket17a, cadlist[tr7], "SELL");
               if(ticket17a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }}
      trdtrigr7[tr7]=0;
 }}  
//---------------------------------------------------
      //CHF
      
for(int tr8=0; tr8<8; tr8++)
{     if(trdtrigr8[tr8]==1)
         {  //Alert("1st in");
            for (int kj8 = 0; kj8 < OrdersTotal(); kj8++){
            int checkselect8 = OrderSelect(kj8, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol()== chflist[tr8]&& OrderMagicNumber()==tr8){emtchc8[tr8] = 1;}   
                                                        }//emtchc = 1;Alert(emtchc);
            if(emtchc8[tr8]==0)
            {
            if(StringSubstr(chflist[tr8],0,3)=="CHF"&&positive[7] &&BullishEngulf(chflist[tr8])==1 && over_bought(chflist[tr8])==0
               &&(Bullish_forwardEngulf(chflist[tr8], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(chflist[tr8],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket08=OrderSend(chflist[tr8],OP_BUY,lotSize,MarketInfo(chflist[tr8],MODE_ASK),0,0,0,"",tr8,0,clrNONE);
               SendMail_function("CHF",ticket08, chflist[tr8], "BUY");
               if(ticket08<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(chflist[tr8],0,3)!="CHF"&&negative[7]&&BullishEngulf(chflist[tr8])==1&& over_bought(chflist[tr8])==0
               &&(Bullish_forwardEngulf(chflist[tr8], PERIOD_M15,val_tal)==1 || Bullish_forwardEngulf(chflist[tr8],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket08a=OrderSend(chflist[tr8],OP_BUY,lotSize,MarketInfo(chflist[tr8],MODE_ASK),0,0,0,"",tr8,0,clrNONE);
               SendMail_function("CHF",ticket08a, chflist[tr8], "BUY");
               if(ticket08a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");               yyx=0; ok_B=0;
               }
            if(StringSubstr(chflist[tr8],0,3)!="CHF"&&positive[7]&&BearishEngulf(chflist[tr8])==1&& over_sold(chflist[tr8])==0
               &&(Bearish_forwardEngulf(chflist[tr8], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(chflist[tr8],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket18=OrderSend(chflist[tr8],OP_SELL,lotSize,MarketInfo(chflist[tr8],MODE_BID),0,0,0,"",tr8,0,clrNONE);
               SendMail_function("CHF",ticket18, chflist[tr8], "SELL");
               if(ticket18<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0;  ok_S=0;
               }
            if(StringSubstr(chflist[tr8],0,3)=="CHF"&&negative[7]&&BearishEngulf(chflist[tr8])==1&& over_sold(chflist[tr8])==0
               &&(Bearish_forwardEngulf(chflist[tr8], PERIOD_M15,val_tal)==1 || Bearish_forwardEngulf(chflist[tr8],PERIOD_H1,val_tal)==1)
              )
               {
               int ticket18a=OrderSend(chflist[tr8],OP_SELL,lotSize,MarketInfo(chflist[tr8],MODE_BID),0,0,0,"",tr8,0,clrNONE);
               SendMail_function("CHF",ticket18a, chflist[tr8], "SELL");
               if(ticket18a<0){Print("OrderSend failed with error #",GetLastError());}
               else Print("OrderSend placed successfully");        xyy=0; ok_S=0;
               }}
      trdtrigr8[tr8]=0;
 }}
//---------------------------------------------------x
 
 // tTkp = iHigh("CADJPY", PERIOD_M15, 8);
//Alert(iTime("USDCHF",PERIOD_M30,1));



// STOPLOSS AND TAKEPROFIT SECTION
  int TPP = TP;
  int TPP2 = TP2;
  int SLL = SL;
  int TotalModified[28]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  int spreadd = 0;
  //spreadd = MarketInfo(TradePairs[yl],MODE_SPREAD);
  
for (int yl=0; yl<28; yl++){  
   //Scan the open orders backwards
   for(int l=OrdersTotal()-1; l>=0; l--){
   
      //Select the order, if not selected print the error and continue with the next index
      if( OrderSelect( l, SELECT_BY_POS, MODE_TRADES ) == false ) {
        // Print("ERROR - Unable to select the order - ",GetLastError());
         continue;
      } 
    
      if (OrderSymbol()== TradePairs[yl]){ 
    // over_bought(TradePairs[yl]);// Alert(TradePairs[yl]," ", ovb);
    // over_sold(TradePairs[yl]);
      //M15
      exbar15 = (iTime(TradePairs[yl],PERIOD_M15,0) - OrderOpenTime());
      elvr15 = MathMod((iTime(TradePairs[yl],PERIOD_M15,0) - OrderOpenTime()),15*60);
      exbar15 = exbar15 - elvr15;
      exbar15 = exbar15/900; 
      exbar15 = exbar15 +1;
      
      
      // H1
      exbar60 = (iTime(TradePairs[yl],PERIOD_H1,0) - OrderOpenTime());
      elvr60 = MathMod((iTime(TradePairs[yl],PERIOD_H1,0) - OrderOpenTime()),60*60);
      exbar60 = exbar60 - elvr60;
      exbar60 = exbar60/3600;
      exbar60 = exbar60 +1; 
       
       
   // Alert("open time ",TradePairs[yl]," ", exbar60);
      //Prepare the prices 
      double TakeProfitPrice=0;
      double StopLossPrice=0;
      double OpenPrice=OrderOpenPrice(); OpenPrice2=OrderOpenPrice();
      RefreshRates();
     // iTime("USDCHF",PERIOD_H1,0)
      
      if(OrderType()==OP_BUY){ 
         TakeProfitPrice=NormalizeDouble(OpenPrice+TPP*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
       //  StopLossPrice=NormalizeDouble(OpenPrice-SLL*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
        // if ((MarketInfo(TradePairs[yl],MODE_BID) - OpenPrice) > 150*MarketInfo(TradePairs[yl],MODE_POINT)){StopLossPrice=NormalizeDouble(OpenPrice+TPP*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));}
        // if (MarketInfo(TradePairs[yl],MODE_BID) - OpenPrice > 200*MarketInfo(TradePairs[yl],MODE_POINT)){StopLossPrice=NormalizeDouble(OpenPrice+TPP2*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));}
      BullishEngulf(TradePairs[yl]); yyx =0; exbar15=1; exbar60=1; //Alert(TradePairs[yl]," ",tTkp);
      tTkp=NormalizeDouble(tTkp-(10+spreadd)*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
      
      if(iOpen(TradePairs[yl], PERIOD_D1, 0)>iClose(TradePairs[yl], PERIOD_D1, 0)){ //Alert(" ");
      tTkp=NormalizeDouble(iLow(TradePairs[yl], PERIOD_D1, 0)-(50*MarketInfo(TradePairs[yl],MODE_POINT)),MarketInfo(TradePairs[yl],MODE_DIGITS));
      TakeProfitPrice=NormalizeDouble(OpenPrice+300*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
                  }
      } 
      if(OrderType()==OP_SELL){
        TakeProfitPrice=NormalizeDouble(OpenPrice-TPP*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
        // StopLossPrice=NormalizeDouble(OpenPrice+SLL*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));      
        // if ((OpenPrice - MarketInfo(TradePairs[yl],MODE_ASK))> 150*MarketInfo(TradePairs[yl],MODE_POINT)){StopLossPrice=NormalizeDouble(OpenPrice-TPP*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));}
        // if ((OpenPrice - MarketInfo(TradePairs[yl],MODE_ASK))> 200*MarketInfo(TradePairs[yl],MODE_POINT)){StopLossPrice=NormalizeDouble(OpenPrice-TPP2*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));}
      BearishEngulf(TradePairs[yl]); xyy=0; exbar15=1; exbar60=1; //Alert(TradePairs[yl]," ",tTkp);
      tTkp=NormalizeDouble(tTkp+(10+spreadd)*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
      
     // if(tTkp<OpenPrice){tTkp=0;}
      
      if(iClose(TradePairs[yl], PERIOD_D1, 0)>iOpen(TradePairs[yl], PERIOD_D1, 0)){//Alert(" ");
      tTkp=NormalizeDouble(iHigh(TradePairs[yl], PERIOD_D1, 0)+(50*MarketInfo(TradePairs[yl],MODE_POINT)),MarketInfo(TradePairs[yl],MODE_DIGITS));
      TakeProfitPrice=NormalizeDouble(OpenPrice-300*MarketInfo(TradePairs[yl],MODE_POINT),MarketInfo(TradePairs[yl],MODE_DIGITS));
                  }
      
      }
      if(tTkp<0){tTkp=0;}
      //Try to modify the order
      
     // Alert(OrderTicket());
      //Alert(TradePairs[yl]," ",tTkp);
     // Alert(TradePairs[yl]," ",TakeProfitPrice);
      if(OrderModify(OrderTicket(),OpenPrice,tTkp,TakeProfitPrice,0,clrNONE)){
         TotalModified[yl]++;
      }  
      else{
         //Alert("Order failed to update with error - ",GetLastError());
      }      
   //end of if_loop tradepairs
   }
   // end of for_loop ordertotal
   }
   // end of for_loop 28
   }



//RESET SECTION
for (int ik=0; ik<28; ik++){
pertnchg[ik]=0;
pipchg[ik]=0;
pipchgval[ik]=0;
pipchgval2[ik]=0;
pipchgval3[ik]=0;
pipchgval4[ik]=0;
pipchgval5[ik]=0;
pipchgval6[ik]=0;
pipchgval7[ik]=0;
pipchgval8[ik]=0;


}
for (int hh=0; hh<8; hh++){
rchc[hh] = 0;
toggVar[hh]=0;
emtchcx[hh]=0;

toggVar2[hh]=0;
toggVar3[hh]=0;
toggVar4[hh]=0;
toggVar5[hh]=0;
toggVar6[hh]=0;
toggVar7[hh]=0;
toggVar8[hh]=0;
toggVar9[hh]=0;

trdtrigr[hh]=0;
trdtrigr2[hh]=0;
trdtrigr3[hh]=0;
trdtrigr4[hh]=0;
trdtrigr5[hh]=0;
trdtrigr6[hh]=0;
trdtrigr7[hh]=0;
trdtrigr8[hh]=0;

emtchc[hh] = 0;
emtchc2[hh] = 0;
emtchc3[hh] = 0;
emtchc4[hh] = 0;
emtchc5[hh] = 0;
emtchc6[hh] = 0;
emtchc7[hh] = 0;
emtchc8[hh] = 0;
strr[hh] = 0;

positive[hh]=0;
negative[hh]=0;
}      

firstpair = 0;firstpair2 = 0;firstpair3= 0;firstpair4 = 0;firstpair5 = 0;firstpair6 = 0;firstpair7 = 0;firstpair8 = 0;
//ronce = 0; Sleep(7000);
pass = 0;
Rpt = 0;
point = 0;
otherpair = "";otherpair2 = "";otherpair3 = "";otherpair4 = "";otherpair5 = "";otherpair6 = "";otherpair7 = "";otherpair8 = "";
power = "STRONG";
usd = 0;eur= 0;gbp= 0;cad= 0;aud= 0;jpy= 0;nzd= 0;chf = 0;




//Alert("End");

ttm=ttm+5;
ttm2 = 1;

}}

     int BullishEngulf( string tradpairs)
   {
      tTkp=0;
      Highest=0;
      yyx =0;
     
     
      // EXECUTION 
      for(thdd =exbar60; thdd<=18+exbar60; thdd++){
      if(  iClose(tradpairs, PERIOD_H1, thdd)- iOpen(tradpairs, PERIOD_H1, thdd) > 0 && iLow(tradpairs, PERIOD_H1, thdd )<iLow(tradpairs, PERIOD_H1, thdd+1)
       &&  iHigh(tradpairs, PERIOD_H1, thdd)>iHigh(tradpairs, PERIOD_H1, thdd+1 )
       && MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_H1, thdd)>0*MarketInfo(tradpairs,MODE_POINT)
       //&&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_H1, thdd)<=SL*MarketInfo(tradpairs,MODE_POINT)&&
      // MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_H1, thdd)>=50*MarketInfo(tradpairs,MODE_POINT)
       && Bullish_forwardEngulf(tradpairs, PERIOD_H1, exbar60)==1 && H1_valBr==thdd
       && over_bought(tradpairs)==0
       &&nonrepeat(tradpairs)==1
       ){ yyx=1; break;}}

      // EXECUTION 
      for(thdd =exbar15; thdd<=18+exbar15; thdd++){
      if(  iClose(tradpairs, PERIOD_M15, thdd)- iOpen(tradpairs, PERIOD_M15, thdd) > 0 && iLow(tradpairs, PERIOD_M15, thdd )<iLow(tradpairs, PERIOD_M15, thdd+1)
       &&  iHigh(tradpairs, PERIOD_M15, thdd)>iHigh(tradpairs, PERIOD_M15, thdd+1 )
       && MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_M15, thdd)>0*MarketInfo(tradpairs,MODE_POINT)
       //&&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_M15, thdd)<=SL*MarketInfo(tradpairs,MODE_POINT)
      // &&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, PERIOD_M15, thdd)>=50*MarketInfo(tradpairs,MODE_POINT)
       && Bullish_forwardEngulf(tradpairs, PERIOD_M15,exbar15)==1 && M15_valBr==thdd
       && over_bought(tradpairs)==0
       &&nonrepeat(tradpairs)==1
       ){yyx=1; break;}
                   }


      // STOPLOSS
      for(thdd =exbar60; thdd<=18+exbar60; thdd++){
     if( 
       iClose(tradpairs, PERIOD_H1, thdd)- iOpen(tradpairs, PERIOD_H1, thdd) > 0 && iLow(tradpairs, PERIOD_H1, thdd )<iLow(tradpairs, PERIOD_H1, thdd+1)
       &&  iHigh(tradpairs, PERIOD_H1, thdd)>iHigh(tradpairs, PERIOD_H1, thdd+1 )
       && OpenPrice2- iLow(tradpairs, PERIOD_H1, thdd)>0*MarketInfo(tradpairs,MODE_POINT)&& 
       Bullish_forwardEngulf(tradpairs, PERIOD_H1,exbar60)==1 && H1_valBr==thdd
       )
       {
       tTkp = iLow(tradpairs, PERIOD_H1, thdd); if(tTkp>Highest) Highest=tTkp; break;}
       }
              
                   
       // STOPLOSS
      for(thdd =exbar15; thdd<=18+exbar15; thdd++){
     if(  
       iClose(tradpairs, PERIOD_M15, thdd)- iOpen(tradpairs, PERIOD_M15, thdd) > 0 && iLow(tradpairs, PERIOD_M15, thdd )<iLow(tradpairs, PERIOD_M15, thdd+1)
       &&  iHigh(tradpairs, PERIOD_M15, thdd)>iHigh(tradpairs, PERIOD_M15, thdd+1 )
       && OpenPrice2- iLow(tradpairs, PERIOD_M15, thdd)>0*MarketInfo(tradpairs,MODE_POINT)&& 
       Bullish_forwardEngulf(tradpairs, PERIOD_M15,exbar15)==1 && M15_valBr==thdd
       )
       { //Alert(M15_valBr);
       tTkp = iLow(tradpairs, PERIOD_M15, thdd); if(tTkp>Highest) Highest=tTkp; 
       break;}
                                                      }
//Alert(tradpairs," ",tTkp);
       
   tTkp=Highest;
             //Alert(tradpairs," ",tTkp);
   return yyx;
   }
   
   
      int BearishEngulf( string tradpairs)
   {
    Lowest=0;
    tTkp=0;
    xyy=0;

     // Alert(SL);
     //EXECUTION
     for(thd =exbar60; thd<=18+exbar60; thd++){      
     if(iOpen(tradpairs, PERIOD_H1, thd)- iClose(tradpairs, PERIOD_H1, thd) > 0*MarketInfo(tradpairs,MODE_POINT) &&
     iLow(tradpairs, PERIOD_H1, thd+1 )>iLow(tradpairs, PERIOD_H1, thd ) &&  iHigh(tradpairs, PERIOD_H1, thd)>iHigh(tradpairs, PERIOD_H1, thd+1 )
     && iHigh(tradpairs, PERIOD_H1, thd)-MarketInfo(tradpairs,MODE_BID)>0*MarketInfo(tradpairs,MODE_POINT)
     //&& iHigh(tradpairs, PERIOD_H1, thd)-MarketInfo(tradpairs,MODE_BID)<=SL*MarketInfo(tradpairs,MODE_POINT)
     //&& iHigh(tradpairs, PERIOD_H1, thd)-MarketInfo(tradpairs,MODE_BID)>=50*MarketInfo(tradpairs,MODE_POINT)
     && Bearish_forwardEngulf(tradpairs, PERIOD_H1,exbar60)==1 && H1_valBr1==thd
     && over_sold(tradpairs)==0
     &&nonrepeat(tradpairs)==1
     ){xyy =1; //Alert(tradpairs," ",iHigh(tradpairs, PERIOD_H1, thd)-MarketInfo(tradpairs,MODE_BID));
     break;   }}
     
     //EXECUTION
     for(thd =exbar15; thd<=18+exbar15; thd++){ 
     if(iOpen(tradpairs, PERIOD_M15, thd)- iClose(tradpairs, PERIOD_M15, thd) > 0*MarketInfo(tradpairs,MODE_POINT) &&
     iLow(tradpairs, PERIOD_M15, thd+1 )>iLow(tradpairs, PERIOD_M15, thd ) &&  iHigh(tradpairs, PERIOD_M15, thd)>iHigh(tradpairs, PERIOD_M15, thd+1 )
     && iHigh(tradpairs, PERIOD_M15, thd)-MarketInfo(tradpairs,MODE_BID)>0*MarketInfo(tradpairs,MODE_POINT)
    // && iHigh(tradpairs, PERIOD_M15, thd)-MarketInfo(tradpairs,MODE_BID)<=SL*MarketInfo(tradpairs,MODE_POINT)
    // && iHigh(tradpairs, PERIOD_M15, thd)-MarketInfo(tradpairs,MODE_BID)>=50*MarketInfo(tradpairs,MODE_POINT)
     && Bearish_forwardEngulf(tradpairs, PERIOD_M15,exbar15)==1 && M15_valBr1==thd
     && over_sold(tradpairs)==0
     &&nonrepeat(tradpairs)==1
     ){xyy =1; //Alert(tradpairs," ",iHigh(tradpairs, PERIOD_M15, thd)-MarketInfo(tradpairs,MODE_BID));
     break; }}
    // 
     
     // STOPLOSS
     for(thd =exbar60; thd<=18+exbar60; thd++){      
     if(iOpen(tradpairs, PERIOD_H1, thd)- iClose(tradpairs, PERIOD_H1, thd) > 0*MarketInfo(tradpairs,MODE_POINT) &&
     iLow(tradpairs, PERIOD_H1, thd+1 )>iLow(tradpairs, PERIOD_H1, thd ) &&  iHigh(tradpairs, PERIOD_H1, thd)>iHigh(tradpairs, PERIOD_H1, thd+1 )
     && iHigh(tradpairs, PERIOD_H1, thd)-OpenPrice2>0*MarketInfo(tradpairs,MODE_POINT)
      && Bearish_forwardEngulf(tradpairs, PERIOD_H1,exbar60)==1 && H1_valBr1==thd
     ) 
     {tTkp = iHigh(tradpairs, PERIOD_H1, thd); if(Lowest==0){Lowest= iHigh(tradpairs, PERIOD_H1, thd);}
     if(tTkp<Lowest){Lowest=tTkp;}
     //Alert(tradpairs," ",tTkp," ",thd,"  H1 ", H1_valBr1);
     break; 
     } }
     
     
     //STOPLOSS
     for(thd =exbar15; thd<=18+exbar15; thd++){ 
     if(iOpen(tradpairs, PERIOD_M15, thd)- iClose(tradpairs, PERIOD_M15, thd) > 0*MarketInfo(tradpairs,MODE_POINT) &&
     iLow(tradpairs, PERIOD_M15, thd+1 )>iLow(tradpairs, PERIOD_M15, thd ) &&  iHigh(tradpairs, PERIOD_M15, thd)>iHigh(tradpairs, PERIOD_M15, thd+1 )
     && iHigh(tradpairs, PERIOD_M15, thd)-OpenPrice2>0*MarketInfo(tradpairs,MODE_POINT)
     && Bearish_forwardEngulf(tradpairs, PERIOD_M15,exbar15)==1  && M15_valBr1==thd
     ) 
     {
     tTkp = iHigh(tradpairs, PERIOD_M15, thd);  if(Lowest==0){Lowest= iHigh(tradpairs, PERIOD_M15, thd);} 
     if(tTkp<Lowest){Lowest=tTkp;}
    // Alert(tradpairs," ",tTkp," ",thd,"  M15 ", M15_valBr1);
      break; 
     }}
     
                              
                              
         tTkp=Lowest;
          //   Alert(tradpairs," ",tTkp," ",thd);
   return xyy;
   }
   
 int over_bought(string trpairs)
 {
   RefreshRates();
   if(iClose(trpairs, PERIOD_D1, 0)<=iOpen(trpairs, PERIOD_D1, 0)){
      if(MarketInfo(trpairs,MODE_BID)<=0.40*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0)){
      ovb =0; // Alert(trpairs," ","GoodtoBuy 1");
      }
      if(MarketInfo(trpairs,MODE_BID)>0.40*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0)){
      ovb =1; //Alert(trpairs," ","Ovbought 1");
      }
                     }
   
   
   /*if(iClose(trpairs, PERIOD_D1, 0)>iOpen(trpairs, PERIOD_D1, 0))  { 
      CurntLvl_op = 0.45*(iHigh(trpairs, PERIOD_M15, 0) -iLow(trpairs, PERIOD_M15, 0) ) + iLow(trpairs, PERIOD_M15, 0) ; //open price
      CurntLvl_cl = 0.55*(iHigh(trpairs, PERIOD_M15, 0) -iLow(trpairs, PERIOD_M15, 0) ) + iLow(trpairs, PERIOD_M15, 0) ; //close price

      if(!(iClose(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) && 
           iOpen(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0))
         )
        {ovb =0;// Alert(trpairs," ","GoodtoBuy2 H1");
        }
      if(!(iClose(trpairs, PERIOD_M15, 0) >= CurntLvl_cl && iOpen(trpairs, PERIOD_M15, 0) <= CurntLvl_op)
        ){ovb =0;     //Alert(trpairs," ","GoodtoBuy 2 M15");
       }

      if((iClose(trpairs, PERIOD_M15, 0) >= CurntLvl_cl && iOpen(trpairs, PERIOD_M15, 0) <= CurntLvl_op
        &&iClose(trpairs, PERIOD_M15, 0)-iOpen(trpairs, PERIOD_M15, 0)>0 )||
        (iClose(trpairs, PERIOD_H4, 1) >= 0.55*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1) 
         && iOpen(trpairs, PERIOD_H4, 1) <= 0.45*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)
         &&iClose(trpairs, PERIOD_H4, 1)-iOpen(trpairs, PERIOD_H4, 1)>0 )
        ){ ovb =1; //Alert(trpairs," ","Ovbought 2 M15/H4");
      }
      
      
      CurntLvl_op = 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) ; //open price
      CurntLvl_cl = 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) ; //close price
      
      if((iClose(trpairs, PERIOD_H1, 0) >= CurntLvl_cl && iOpen(trpairs, PERIOD_H1, 0) <= CurntLvl_op
         &&iClose(trpairs, PERIOD_H1, 0)-iOpen(trpairs, PERIOD_H1, 0)>0 )||
         (iClose(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1) 
         && iOpen(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
         &&iClose(trpairs, PERIOD_H1, 1)-iOpen(trpairs, PERIOD_H1, 1)>0 ) || 
         (iClose(trpairs, PERIOD_H1, 2) >= 0.55*(iHigh(trpairs, PERIOD_H1, 2) -iLow(trpairs, PERIOD_H1, 2) ) + iLow(trpairs, PERIOD_H1, 2) 
         && iOpen(trpairs, PERIOD_H1, 2) <= 0.45*(iHigh(trpairs, PERIOD_H1, 2) -iLow(trpairs, PERIOD_H1, 2) ) + iLow(trpairs, PERIOD_H1, 2)
         &&iClose(trpairs, PERIOD_H1, 2)-iOpen(trpairs, PERIOD_H1, 2)>0 )         
         ){ ovb =1;// Alert(trpairs," ","bought 2 H1H2H3");
      }
                                 } */  
                              
      if(iClose(trpairs, PERIOD_D1, 0)>iOpen(trpairs, PERIOD_D1, 0))  { 
              
              if(TimeHour(TimeLocal())>=1  && TimeHour(TimeLocal())<=3){
              if((iClose(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1) 
                 &&iOpen(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iClose(trpairs, PERIOD_H1, 1)-iOpen(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) 
                 &&iOpen(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iClose(trpairs, PERIOD_H1, 0)-iOpen(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))       
                ){ ovb =1;// Alert(trpairs," ","bought 2 H1");
                    }else ovb =0;
                      }

              if(TimeHour(TimeLocal())>4  && TimeHour(TimeLocal())<=4){
              if((iClose(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1) 
                 &&iOpen(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iClose(trpairs, PERIOD_H1, 1)-iOpen(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))|| 
                (iClose(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0) 
                 &&iOpen(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iClose(trpairs, PERIOD_H4, 0)-iOpen(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                (iClose(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) 
                 &&iOpen(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iClose(trpairs, PERIOD_H1, 0)-iOpen(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))      
                ){ ovb =1;// Alert(trpairs," ","bought 2 H1");
                    }else ovb =0;
                      }

              if(TimeHour(TimeLocal())>=5  && TimeHour(TimeLocal())<=8){
              if((MarketInfo(trpairs,MODE_BID)>=0.5*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0))||
                 (iClose(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1) 
                 && iOpen(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iClose(trpairs, PERIOD_H1, 1)-iOpen(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 1) >= 0.55*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1) 
                 && iOpen(trpairs, PERIOD_H4, 1) <= 0.45*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)
                 &&iClose(trpairs, PERIOD_H4, 1)-iOpen(trpairs, PERIOD_H4, 1)>180*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) 
                 &&iOpen(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iClose(trpairs, PERIOD_H1, 0)-iOpen(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0) 
                 &&iOpen(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iClose(trpairs, PERIOD_H4, 0)-iOpen(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))
                 ){ ovb =1;// Alert(trpairs," ","bought 2 H1");
                    }else ovb =0;
                      }
                      
              if(TimeHour(TimeLocal())>=9  && TimeHour(TimeLocal())<=23){
              if((MarketInfo(trpairs,MODE_BID)>=0.6*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0))||
                 (iClose(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1) 
                 && iOpen(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iClose(trpairs, PERIOD_H1, 1)-iOpen(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 1) >= 0.55*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1) 
                 && iOpen(trpairs, PERIOD_H4, 1) <= 0.45*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)
                 &&iClose(trpairs, PERIOD_H4, 1)-iOpen(trpairs, PERIOD_H4, 1)>180*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) 
                 &&iOpen(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iClose(trpairs, PERIOD_H1, 0)-iOpen(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0) 
                 &&iOpen(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iClose(trpairs, PERIOD_H4, 0)-iOpen(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))
                 ){ ovb =1;// Alert(trpairs," ","bought 2 H1");
                    }else ovb =0;
                      }
      
                           }
      
      
      //Alert(trpairs," ", ovb);
 return ovb; 
 }      
      
 int over_sold(string trpairs)
 {     
   
    if(iOpen(trpairs, PERIOD_D1, 0)<=iClose(trpairs, PERIOD_D1, 0)){
      if(MarketInfo(trpairs,MODE_BID)>=0.60*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0)){
      ovs =0; //Alert(trpairs," ","Not OvrS 1");
      }
      if(MarketInfo(trpairs,MODE_BID)<0.60*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0)){
      ovs =1; //Alert(trpairs," ","OvSold 1");
      }
                        }
   
   
   /*if(iOpen(trpairs, PERIOD_D1, 0)>iClose(trpairs, PERIOD_D1, 0))  {                             
      CurntLvl_op = 0.45*(iHigh(trpairs, PERIOD_M15, 0) -iLow(trpairs, PERIOD_M15, 0) ) + iLow(trpairs, PERIOD_M15, 0) ; //open price
      CurntLvl_cl = 0.55*(iHigh(trpairs, PERIOD_M15, 0) -iLow(trpairs, PERIOD_M15, 0) ) + iLow(trpairs, PERIOD_M15, 0) ; //close price
       
      if(!(iClose(trpairs, PERIOD_H1, 0)<=0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)  && 
      iOpen(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0))
      ){ovs =0;   //Alert(trpairs," ","Not OvrS H1");
      }
      
      if(!(iClose(trpairs, PERIOD_M15, 0) <= CurntLvl_op  && iOpen(trpairs, PERIOD_M15, 0) >= CurntLvl_cl)
        ){
            ovs =0; //Alert(trpairs," ","Not OvrS M15");         
      }      
          
      if((iClose(trpairs, PERIOD_M15, 0) <= CurntLvl_op  && iOpen(trpairs, PERIOD_M15, 0) >= CurntLvl_cl
        &&iOpen(trpairs, PERIOD_M15, 0)-iClose(trpairs, PERIOD_M15, 0)>0 )||
        (iClose(trpairs, PERIOD_H4, 1) <= CurntLvl_op  && iOpen(trpairs, PERIOD_H4, 1) >= CurntLvl_cl
          &&iOpen(trpairs, PERIOD_H4, 1)-iClose(trpairs, PERIOD_H4, 1)>0)
        ){
       ovs =1; //Alert(trpairs," ","OvSold M15/H4");
      }
 
      CurntLvl_op = 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) ; //open price
      CurntLvl_cl = 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0) ; //close price
        
      if((iClose(trpairs, PERIOD_H1, 0) <= CurntLvl_op  && iOpen(trpairs, PERIOD_H1, 0) >= CurntLvl_cl
          &&iOpen(trpairs, PERIOD_H1, 0)-iClose(trpairs, PERIOD_H1, 0)>0)||
          (iClose(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)  
          && iOpen(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
          &&iOpen(trpairs, PERIOD_H1, 1)-iClose(trpairs, PERIOD_H1, 1)>0)||
          (iClose(trpairs, PERIOD_H1, 2) <= 0.45*(iHigh(trpairs, PERIOD_H1, 2) -iLow(trpairs, PERIOD_H1, 2) ) + iLow(trpairs, PERIOD_H1, 2)  
          && iOpen(trpairs, PERIOD_H1, 2) >= 0.55*(iHigh(trpairs, PERIOD_H1, 2) -iLow(trpairs, PERIOD_H1, 2) ) + iLow(trpairs, PERIOD_H1, 2)
          &&iOpen(trpairs, PERIOD_H1, 2)-iClose(trpairs, PERIOD_H1, 2)>0)
        ){ovs =1;// Alert(trpairs," ","Sold H1H2H3");
      }
               }*/
       
       if(iOpen(trpairs, PERIOD_D1, 0)>iClose(trpairs, PERIOD_D1, 0)){ 
         
          if( TimeHour(TimeLocal())>=1  && TimeHour(TimeLocal())<=3){
              if((iClose(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)  
                 && iOpen(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iOpen(trpairs, PERIOD_H1, 1)-iClose(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)  
                 && iOpen(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iOpen(trpairs, PERIOD_H1, 0)-iClose(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))                 
                 ){ovs =1; // Alert(trpairs," ","Sold H1");
                  }else ovs =0;
                    }

          if( TimeHour(TimeLocal())>=4  && TimeHour(TimeLocal())<=4){
              if((iClose(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)  
                 && iOpen(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iOpen(trpairs, PERIOD_H1, 1)-iClose(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)  
                 && iOpen(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iOpen(trpairs, PERIOD_H1, 0)-iClose(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)  
                 && iOpen(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iOpen(trpairs, PERIOD_H4, 0)-iClose(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))
                 ){ovs =1; // Alert(trpairs," ","Sold H1");
                  }else ovs =0;
                    }

          if( TimeHour(TimeLocal())>=5  && TimeHour(TimeLocal())<=8){
              if((MarketInfo(trpairs,MODE_BID)<=0.50*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0))||
                 (iClose(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)  
                 && iOpen(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iOpen(trpairs, PERIOD_H1, 1)-iClose(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 1) <= 0.45*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)  
                 && iOpen(trpairs, PERIOD_H4, 1) >= 0.55*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)
                 &&iOpen(trpairs, PERIOD_H4, 1)-iClose(trpairs, PERIOD_H4, 1)>180*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)  
                 && iOpen(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iOpen(trpairs, PERIOD_H1, 0)-iClose(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)  
                 && iOpen(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iOpen(trpairs, PERIOD_H4, 0)-iClose(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))
                 ){ovs =1; // Alert(trpairs," ","Sold H1");
                  }else ovs =0;
                    }
       
          if( TimeHour(TimeLocal())>=9  && TimeHour(TimeLocal())<=23){
              if((MarketInfo(trpairs,MODE_BID)<=0.40*(iHigh(trpairs, PERIOD_D1, 0) -iLow(trpairs, PERIOD_D1, 0))+ iLow(trpairs, PERIOD_D1, 0))||
                 (iClose(trpairs, PERIOD_H1, 1) <= 0.45*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)  
                 && iOpen(trpairs, PERIOD_H1, 1) >= 0.55*(iHigh(trpairs, PERIOD_H1, 1) -iLow(trpairs, PERIOD_H1, 1) ) + iLow(trpairs, PERIOD_H1, 1)
                 &&iOpen(trpairs, PERIOD_H1, 1)-iClose(trpairs, PERIOD_H1, 1)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 1) <= 0.45*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)  
                 && iOpen(trpairs, PERIOD_H4, 1) >= 0.55*(iHigh(trpairs, PERIOD_H4, 1) -iLow(trpairs, PERIOD_H4, 1) ) + iLow(trpairs, PERIOD_H4, 1)
                 &&iOpen(trpairs, PERIOD_H4, 1)-iClose(trpairs, PERIOD_H4, 1)>180*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H1, 0) <= 0.45*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)  
                 && iOpen(trpairs, PERIOD_H1, 0) >= 0.55*(iHigh(trpairs, PERIOD_H1, 0) -iLow(trpairs, PERIOD_H1, 0) ) + iLow(trpairs, PERIOD_H1, 0)
                 &&iOpen(trpairs, PERIOD_H1, 0)-iClose(trpairs, PERIOD_H1, 0)>110*MarketInfo(trpairs,MODE_POINT))||
                 (iClose(trpairs, PERIOD_H4, 0) <= 0.45*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)  
                 && iOpen(trpairs, PERIOD_H4, 0) >= 0.55*(iHigh(trpairs, PERIOD_H4, 0) -iLow(trpairs, PERIOD_H4, 0) ) + iLow(trpairs, PERIOD_H4, 0)
                 &&iOpen(trpairs, PERIOD_H4, 0)-iClose(trpairs, PERIOD_H4, 0)>110*MarketInfo(trpairs,MODE_POINT))
                 ){ovs =1; // Alert(trpairs," ","Sold H1");
                  }else ovs =0;
                      }       
                           }
            
         
      
  // over_sold(trpairs)==0
   //Alert(trpairs," ",ovs);
 return ovs;
 }
 
      
     
     //Bullish Forward Up-Down Engulf
     int Bullish_forwardEngulf(string tradpairs, string timeframe, int tallier){     
     jl=tallier;     //57; j must be greater than 0 like 2
     bz=0;
     tth=0;
     kpl=0;
     Lst =0;
     ok_B=0;
    
     for(int i=jl; i<18+jl; i++){ 
     if(iClose(tradpairs,timeframe, i)- iOpen(tradpairs,timeframe, i) > 0*MarketInfo(Symbol(),MODE_POINT) &&
     iLow(tradpairs, timeframe, i+1 )>iLow(tradpairs, timeframe, i ) &&  iHigh(tradpairs, timeframe, i)>iHigh(tradpairs, timeframe, i+1 )
     ){
         tth = i;
         for(i=jl; i<=tth; i++)
         {//Alert(tradpairs," bz: ",tth," i: ",i);
      kpl = iLow(tradpairs, timeframe, i);  if(Lst==0){Lst= iLow(tradpairs, timeframe, i);bz=i; } 
      if(kpl<Lst){Lst=kpl; bz=i;}
      if(kpl>Lst){Lst=Lst; bz=bz;}          //Alert(tradpairs," tth: ",tth," Lst:", Lst); 
         }                                         //Alert(" Lowest:", Lowest);
                                                  // Alert(tradpairs," Kpl: ",kpl," Lst:", Lst);
         i=tth;                                   // Alert(tradpairs," bz: ",bz," i: ",i);
       if(i<=bz && iLow(tradpairs, timeframe, i-1 )>iLow(tradpairs, timeframe, i)
         &&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, timeframe, i)>0*MarketInfo(tradpairs,MODE_POINT)
         &&MarketInfo(tradpairs,MODE_ASK)- iLow(tradpairs, timeframe, i)<=SL*MarketInfo(tradpairs,MODE_POINT)
         ){  ok_B=1; //DrawArrowUp("up"+i,Low[i]-10*Point,Blue,i); 
           if(timeframe==PERIOD_M15){M15_valBr = i;} //else M15_valB=0;
           if(timeframe==PERIOD_H1){H1_valBr = i;} //else H1_valB=0;
           //  tTkp=iLow(tradpairs, timeframe, i);
                 break;
                                 }
                              }
                          }

         return ok_B;  }
                  

     //Bearish Downward Up-Down Engulf
     int Bearish_forwardEngulf(string tradpairs, string timeframe,int tallier){
     jl=tallier;     //57; j must be greater than 0 like 2
     bz=0;
     tth=0;
     kpl=0;
     Hst = 0;
     ok_S=0;

         
     for( int i=jl; i<18+jl; i++){ 
     if(iOpen(tradpairs,timeframe, i)-iClose(tradpairs,timeframe, i)> 0*MarketInfo(Symbol(),MODE_POINT) &&
     iLow(tradpairs, timeframe, i+1 )>iLow(tradpairs, timeframe, i ) &&  iHigh(tradpairs, timeframe, i)>iHigh(tradpairs, timeframe, i+1 )
     ){//Alert("jl: ",jl," i: ",i, "Timeframe: ",timeframe );
         tth = i;
         for(i=jl; i<=tth; i++)
         {kpl = iHigh(tradpairs, timeframe, i); if(kpl>Hst){Hst=kpl; bz=i;}
          if(kpl<Hst){Hst=Hst; bz=bz;}
       //  Alert("tth: ",tth," Hst:", Hst, " Timeframe: ",timeframe ); 
         }                                         //Alert(" Lowest:", Lowest);
         i=tth;                                    //Alert("bz: ",bz," i: ",i, " Timeframe: ",timeframe );
       if(i<=bz && iHigh(tradpairs, timeframe, i)>iHigh(tradpairs, timeframe, i-1 )
           && iHigh(tradpairs, timeframe, i)-MarketInfo(tradpairs,MODE_BID)>0*MarketInfo(tradpairs,MODE_POINT)
           && iHigh(tradpairs, timeframe, i)-MarketInfo(tradpairs,MODE_BID)<=SL*MarketInfo(tradpairs,MODE_POINT)
         ){ ok_S=1; //Alert(iHigh(tradpairs, timeframe, i)-MarketInfo(tradpairs,MODE_BID), " Timeframe: ",timeframe," ",tradpairs );
           //Alert(tradpairs," ",i);
           if(timeframe==PERIOD_M15){M15_valBr1 = i;} //else M15_valB=0;
           if(timeframe==PERIOD_H1){H1_valBr1 = i;} //else H1_valB=0;
           // tTkp=iHigh(tradpairs, timeframe, i);
                 break; 
                                    }
                                }
                            }
          
        return ok_S;   }
 
 //nonrepeat(currency)==1
 
 int nonrepeat (string tradpair){  
   
   for (int npr=0; npr<28; npr++){  
   //Scan the open orders backwards
   for(int lk=0; lk<=OrdersHistoryTotal(); lk++){
   
      //Select the order, if not selected print the error and continue with the next index
      if( OrderSelect( lk, SELECT_BY_POS, MODE_HISTORY ) == false ) {
        // Alert("ERROR - Unable to select the order - ",GetLastError());
         continue;
      }
      
      if(TradePairs[npr]==OrderSymbol()){rp_holdr[npr]=OrderCloseTime();}
                              }
                         }
   
   
   for (npr=0; npr<28; npr++){  
       if(iTime(TradePairs[npr],PERIOD_M1,0)- rp_holdr[npr]>=30*60 && TradePairs[npr]==tradpair)
      {
         //trp_golden[npr]=1;
     //    Alert(TradePairs[npr]," Grp1 ", rp_holdr[npr]);
        nonrp=1;
      } 
      
      if(iTime(TradePairs[npr],PERIOD_M1,0)- rp_holdr[npr]<30*60 && TradePairs[npr]==tradpair)
      {
         //trp_golden[npr]=1;
    //     Alert(TradePairs[npr]," Grp0 ", rp_holdr[npr]);
        nonrp=0;
      }
   }      
 
 return nonrp;
 }
 
 
 

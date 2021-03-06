//+------------------------------------------------------------------+
//|                                               modify_pending.mq4 |
//|                      Copyright © 2004, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2004, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"


extern double SL_TP = 10;
extern double max_StopOut = 25;
extern int trailingStop_ON_OFF = 1;
extern double trailingStop = 100;
extern int MagicNumber=1;

int modfyTrkr = 0;
int insBTS, insSTS=1;
int inBuy,inSell=0;
double exstinSL, StopLossTL =0;
int stpMod, stpMod2, fstBS_Trg, fstBS2_Trg, fstSS_Trg, fstSS2_Trg = 0;

//Function to normalize the digits
double CalculateNormalizedDigits()
{
   if(Digits<=3){
      return(0.01);
   }
   else if(Digits>=4){
      return(0.0001);
   }
   else return(0);
}

     
int init()
  {
  Print(MarketInfo(Symbol(), MODE_STOPLEVEL));
   return(0);
  }
int deinit()
  {
   return(0);
  }
  
void deleteall()
{
   for(int x=OrdersTotal()-1;x>=0;x--){
     int Ordselect = OrderSelect(x,SELECT_BY_POS,MODE_TRADES);
      if((OrderType()==OP_BUY || OrderType()==OP_SELL)&& OrderMagicNumber()==MagicNumber){
      int ordclose = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),666,CLR_NONE);
      }else{if(OrderMagicNumber()==MagicNumber){int orddel = OrderDelete(OrderTicket());}}
   }
} 
  
int start()
  { 

  //AUTO ADJUST STOPLOSS AND TAKE PROFIT
double TP = 0;              //Take Profit in pips
//bool OnlyMagicNumber=false;     //Modify only orders matching the magic number
              //Matching magic number
//bool OnlyWithComment=false;     //Modify only orders with the following comment
//string MatchingComment="";      //Matching comment
double Slippage=2;              //Slippage


double TakeProfit= TP*0.1;              //Take Profit in pips
double StopLoss = SL_TP*0.1;                //Stop Loss in pips



   //Counter for orders modified
   int TotalModified,TotalModified2=0;
   
   //Normalization of the digits
   if(Digits==3 || Digits==5){
      Slippage=Slippage*10;
   }
   double nDigits=CalculateNormalizedDigits();
   
   //Scan the open orders backwards
   for(int l=OrdersTotal()-1; l>=0; l--){
   
      //Select the order, if not selected print the error and continue with the next index
      if( OrderSelect( l, SELECT_BY_POS, MODE_TRADES ) == false ) {
         Print("ERROR - Unable to select the order - ",GetLastError());
         continue;
      } 
      
      //Check if the order can be modified matching the criteria, if criteria not matched skip to the next
    //  if(OrderSymbol()!=Symbol()) continue;
    //  if(OnlyMagicNumber && OrderMagicNumber()!=MagicNumber) continue;
    //  if(OnlyWithComment && StringCompare(OrderComment(),MatchingComment)!=0) continue;
      
      //Prepare the prices
      double TakeProfitPrice=0;
      double StopLossPrice, StopLossPricex=0;
      double OpenPrice=OrderOpenPrice();
      int Spread = MarketInfo(Symbol(),MODE_SPREAD);
      if (Spread>SL_TP){StopLoss=Spread*0.1;};
      double exstinSL2 = OrderStopLoss();     


      RefreshRates();
      if(1){
      if(OrderType()==OP_BUY){
       // if ((OpenPrice - Ask)>=max_StopOut*MarketInfo(Symbol(),MODE_POINT)){deleteall(); Alert("OP:",OpenPrice); 
        //  Alert("Ask(B):",Ask); Alert("Diff:",(OpenPrice - Ask));} 
        if (Bid - OpenPrice < ((StopLoss+1.5)*nDigits)){StopLossPrice=NormalizeDouble(OpenPrice-(StopLoss+0.5)*nDigits,Digits);}  
        if (Bid - OpenPrice >= ((StopLoss+1.5)*nDigits)){StopLossPrice=NormalizeDouble(OpenPrice+(StopLoss+1.5)*nDigits,Digits);}
      }
      if(OrderType()==OP_SELL){
        // TakeProfitPrice=NormalizeDouble(OpenPrice-TakeProfit*nDigits,Digits);
       // if ((Bid - OpenPrice)>=max_StopOut*MarketInfo(Symbol(),MODE_POINT)){deleteall(); Alert("OP:",OpenPrice); 
       //   Alert("Bid(S):",Bid); Alert("Diff:",(Bid - OpenPrice));}        
        if (OpenPrice - Ask < ((StopLoss+1.5)*nDigits)){StopLossPrice=NormalizeDouble(OpenPrice+(StopLoss+0.5)*nDigits,Digits);}
        if (OpenPrice - Ask >= ((StopLoss+1.5)*nDigits)){StopLossPrice=NormalizeDouble(OpenPrice-(StopLoss+1.5)*nDigits,Digits);}
      }    
      
      //Try to modify the order
      if(OrderType()==OP_BUY){
      if(exstinSL2 > 0 && (exstinSL2 > OpenPrice)) {stpMod=1;}
      //if(exstinSL2 > 0 && (exstinSL2 - OpenPrice >=((StopLoss+1.5)*nDigits))) {stpMod=1;}
      }
     if(OrderType()==OP_SELL){     
      if(exstinSL2 > 0 && (exstinSL2 < OpenPrice)) {stpMod2=1;}
      //if(exstinSL2 > 0 && (OpenPrice - exstinSL2)>=((StopLoss+1.5)*nDigits)) {stpMod2=1;}
      }
      
       if(((stpMod==0 && OrderType()==OP_BUY) || (stpMod2==0 && OrderType()==OP_SELL))&& OrderMagicNumber()==MagicNumber){
       if((OrderModify(OrderTicket(),OpenPrice,StopLossPrice,0,clrNONE)) ){
         TotalModified++;
      }
      else{
         Print("Order failed to update with error - ",GetLastError());
      }}
      
   }
   
    
    //(trailingStop+SL_TP+16)*0.1
    // TrailingStop
  exstinSL = OrderStopLoss();
  
  if(trailingStop_ON_OFF == 1 && OrderMagicNumber()==MagicNumber){
    if(OrderType()==OP_BUY){
    if (Bid - OpenPrice >= (trailingStop+SL_TP+16)*0.1*nDigits ){StopLossTL=NormalizeDouble(Bid - trailingStop*0.1*nDigits,Digits); insBTS=1;}
    if (exstinSL > StopLossTL && exstinSL!=0){ StopLossTL= exstinSL;}
    }
    if(OrderType()==OP_SELL){
    if (OpenPrice - Ask >= (trailingStop+SL_TP+16)*0.1*nDigits ){StopLossTL=NormalizeDouble(Ask + trailingStop*0.1*nDigits,Digits); insSTS=1;}
    if (exstinSL < StopLossTL && exstinSL!=0){ StopLossTL= exstinSL;}
    }

      if(insBTS==1 || insSTS==1){ insBTS=0; insSTS=0;
      if((OrderModify(OrderTicket(),OpenPrice,StopLossTL,0,clrNONE)) ){
         TotalModified++;
      }
      else{
         Print("Order failed to update with error - ",GetLastError());
      }}    
    }
    
    
    
   }
     
       
// Max stop out doesnt seem to be working well       
       
       
       
       
       
   return(0);
  }
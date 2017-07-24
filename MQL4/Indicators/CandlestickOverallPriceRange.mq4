//+------------------------------------------------------------------+
//|                                 CandlestickOverallPriceRange.mq4 |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Keisuke Iwabuchi"
#property link      "https://order-button.com/"
#property version   "1.00"
#property strict
#property indicator_separate_window
#property indicator_buffers 1
#property indicator_color1 clrDodgerBlue
#property indicator_width1 1
#property indicator_style1 0

double body[];

int OnInit()
{
   IndicatorBuffers(1);
   SetIndexStyle(0, DRAW_LINE);
   SetIndexBuffer(0, body);
   SetIndexLabel(0, "Price Range");
   IndicatorDigits(Digits);
   
   return(INIT_SUCCEEDED);
}


int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   int limit = Bars - IndicatorCounted();
   
   for(int i = limit - 1; i >= 0; i--){
      body[i] = MathAbs(high[i] - low[i]);
   }

   return(rates_total);
}

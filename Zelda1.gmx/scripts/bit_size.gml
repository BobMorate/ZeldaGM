///bit_size(n)
/*
   Script: bit_size(n)
   Arguments;
       n, integer
   Returned type: integer
   Returned value: number of bits in n
   */
   var n;
   n=argument0;
   if(n==0)return 0;
   return floor(log2(abs(n))+1);
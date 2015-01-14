///bit_get(n,pos)
/*
   Script: bit_get(n,pos)
   Arguments;
       n, integer
       pos, integer
   Returned type: boolean
   Returned value: bit at position pos in n
   */
   var n,pos;
   n=argument0;
   pos=argument1;
   if(n<0)return !(abs(n)>>pos&1);
   return n>>pos&1;
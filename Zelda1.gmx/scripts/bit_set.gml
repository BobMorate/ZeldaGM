///bit_set(n,pos,bit)
/*
   Script: bit_set(n,pos,bit)
   Arguments;
       n, integer
       pos, integer
       bit, boolean
   Returned type: integer
   Returned value: copy of integer n with bit at position pos changed to bit
   */
   var n,pos,bit;
   n=argument0;
   pos=argument1;
   bit=argument2;
   if(bit)return n|(1<<pos);
   return n& (~power(2,target));
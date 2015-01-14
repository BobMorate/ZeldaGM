///save_get_max(key)
switch(argument[0])
{
    case "Bombs": return(8+(save_data_get("bomb Bag")*4)); break;
    case "Rupees":  if(save_data_get("Wallet"))
                       return(500);
                    else
                        return(250);
                    break;
    default: return(99999999);
}
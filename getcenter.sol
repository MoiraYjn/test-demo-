pragma solidity ^0.4.15;
contract Get{
    //
	// Gets the second largest number of the three
	//
    function getcen(uint8 a,uint8 b,uint8 c) public returns(uint8 cen){
        uint8 tem;
		
        if(a == b || a == c){
            cen = a;
        }
        else if(b == c){
            cen = b;
        }
        else{
            if(a > b){
                tem = a;
            }
            else{
                tem = b;
            }
            if(tem < c){
                cen = tem;
            }
            else{
			
                if(tem == a){
                   if(b > c){
                      cen =b;
                   }
                   else{
                       cen = c;
                   }
                }
                else{
                    if(a > c){
                        cen = a;
                    }
                    else{
                        cen = c;
                    }
                }
            }
        }
    }
   
}
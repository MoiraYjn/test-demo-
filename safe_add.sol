pragma solidity ^0.4.15;

contract Add {
    
    uint8 public sum;
	//
    function safe_add(uint8 a,uint8 b) returns (uint8){
	//
        uint16 aa = a;
        uint16 bb = b;
        
        if(a < 128 && b < 128) {
            sum = a +b;
        }
        else {
            require(aa + bb < 256);
            sum = a + b;
        }
        
        return sum;
    } 
}

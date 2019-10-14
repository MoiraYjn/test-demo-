//**summar:this is the first test program by Solidity 
//**date:2019-8-1
//**auther:JennaYu
pragma solidity >=0.4.15 <0.6.0;
//****
//this contract has one function ,
//function "getmax" first
//****
contract demo1 {
    //init a varite, to return the maximum value
    uint8 maxnum; 
    // if maxnum = a1, The results add 1
    //The function takes three arguments , the type is uint8
    function getmax(uint8 a1,uint8 b1,uint8 c1) public returns (uint8){
        //Initialize the intermediate variable
        uint8 tt;
        
        //Saves the larger of the two variables
        //first comparison
        if(a1 >= b1){
            // if a1 >= b1,
            tt = a1;
        }
        
        else{
            //b1 > a1
            tt = b1;
        }
        // Second comparison
        if(tt >= c1){
            // 
            maxnum = tt;
        }
        
        else{
            // c1 is the maximum
            maxnum = c1;
        }
        //Determine which is the maximum
        if(maxnum == a1){
            //Case 1:
            maxnum ++;
            maxnum --;
        }
        
        else if (maxnum == b1){
            //Case 2:
            maxnum --;
            maxnum ++;
            
        }
        //Returns the final result
        return maxnum;
    }
}
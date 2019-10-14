//**summary:this is the third test program for Solidity 
//**date:2019-8-3
//**auther:JennaYu
pragma solidity >=0.4.15 <0.6.0;
//this is a program,It contains some uses of require-statement
//
contract demo3 {
    //public variable: returns the output of the program
    uint16 public res;
    
    //first function,Returns the larger of the two Numbers
    function bigger(uint16 m1,uint16 n1) public returns (uint16 bigger1){
        // case1:m1 <= n1
        if(m1 <= n1){
            bigger1 = n1;
        }
        //case2:m1 > n1
        else{
            bigger1 = m1;
        }
    }
    
    //second function:Returns the largest of the three Numbers
    function biggest(uint16 m3,uint16 n3,uint16 t3) public returns (uint16 biggest2){
        //Declare variable
        uint16 t11;
        
        //call bigger
        t11 = bigger(m3,n3);
        //call bigger
        biggest2 = bigger(t11,t3);
    }
    
    //third function:Returns the smaller of the two Numbers
    function smaller(uint16 m4,uint16 n4) public returns (uint16 smaller1){
        //case1:m4<n4
        if(m4 < n4){
            smaller1 = m4;
        }
        //case2:n4 >= m4
        else{
            smaller1 = n4;
        }
    }
    
    //Returns the sum of the two Numbers
    //The argument types are all uint16,
    //there are a require-statement to test whether the result is out of bounds
    function add(uint16 a1,uint16 b1) public returns (uint16 sum1){
        //Declare two variables to perform the operation
        //Expand the scope of variable representation
        uint32 a12 = a1;
        uint32 b12 = b1;
        
        //case1:if meet the if-condition,the result is not out of bounds
        if(a1 < 32768 && b1 < 32678){  
            //add
            sum1 = a1 + b1;
        }
        //case2:
        else{
            //Perform judgment:require 
            require(a12 + b12 <= 65535);  
            //add
            sum1 = a1 + b1;
        }
    }
    
    //Returns the difference between two Numbers
    //use require-statement to see if it satisfies the subtraction condition
    //The argument types are all uint16,
    function jian_1(uint16 a2,uint16 b2) public returns (uint16 sum2){
        //if a2 > b2
        require(a2 > b2);
        //subtract
        sum2 = a2 - b2;
    }
    
    //Find the maximum sum that can be produced by a combination of two or two Numbers
    //argument type:uint16
    function max_sum(uint16 a3,uint16 b3,uint16 c3) public returns (uint16 sum3){  
        //Declare two variables
        uint16 d1;
        uint16 d2;
        
        //call biggest
        d1 = biggest(a3,b3,c3);  
        //call bigger
        d2 = bigger(a3,b3);
        //
        if(d2 < c3){  
            sum3 = d1 + d2;
        }
        else{  
            //call smaller
            d2 = smaller(a3,b3);   
            if(d2 < c3){     
                sum3 = c3 + d1;
            }
            else{   
                sum3 = d1 +d2; 
            }
        }
        return sum3;
    }
    
    //Find the smallest result of adding or subtracting three Numbers
    //argument type:uint16
    function small_res(uint16 a4,uint16 b4,uint16 c4) public returns (uint16){
        //Declare three variables
        uint16 d3;
        uint16 res1;
        uint16 res2;
        
        //call biggest
        d3 = biggest(a4,b4,c4);
        //call add 
        res1 = add(a4,b4);
        //call add 
        res2 = add(res1,c4);
        res = res2 - d3;
        
        //return result
        return res;
    }
}
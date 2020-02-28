pragma solidity ^0.4.22;
//
contract safe_buy{

    // good value
	uint8 public goodvalue; 
	
    //good stock
	uint8 public goodnum; 
	
    address public seller;
    address public buyer;
	
	//constructor
    constructor(uint8 _goodvalue,address _buyeradd) public payable {
        seller = msg.sender;
        goodvalue = _goodvalue;
		goodnum = 255;
        buyer = _buyeradd;
    }
	
	// 
    modifier onlyBuyer() {
        //onlybuyer
		require(msg.sender == buyer, "Only buyer can call this.");
        _;
    }
	//
	
    modifier onlyseller(){
        // onlyseller 
		require(msg.sender == seller, "Only buyer can call this.");
        _;
    }
	//
	
	//change value
    function changegoodvalue(uint8 value) public onlyseller{
        //
		goodvalue = value;
    }
	//
	
    function safe_multiplication(uint8 a,uint8 b) public returns(uint16 res){
        
		if(a < 16 && b < 16){
            res = a * b;
        }
		
        else{
            uint16 aa = a;
            uint16 bb = b;
			require(aa * bb < 65536);
            res = aa * bb;
        }
		
    }
	//
	
	// buy
    function buy(uint16 payment,uint8 purchasenum) public onlyBuyer{
	
        // whether the quantity of goods is sufficient
		bool is_goodenough; 
		
        if(purchasenum > goodnum){
            is_goodenough = false;
        }
		
        else{
            is_goodenough = true;
        }
		
		// whether the advance payment is sufficient to purchase these goods
        uint16 goodsum;  
		
		//
        goodsum = safe_multiplication(goodvalue,purchasenum);
		
		//
		// Meet the purchase conditions
        require(payment >= goodsum);  
		
		// Reduced quantity of goods
        goodnum = goodnum - purchasenum;  
    }
	
}
pragma solidity >=0.4.15 <0.6.0;

// add
contract safa_add{

    //uint16 + uint8 return uint16
    function add(uint16 a,uint8 b) public returns(uint16 thissum){
        uint24 aa = a;
        uint24 bb = b;
		//
		if(a < 65280){
            thissum = a + b;
        }
        else{
            require(aa + bb < 65536);
            thissum = a + b;
        }
		
    }
}

contract manager is safa_add{
    
	// manager of this program
	address themanager; 
	
    // The lowest contribution of a partner
	uint8 public bottomprice; 
	
    //The final target value
	uint16 public targetprice;  
    // sum of price current 
	uint16 public currentprice; 
	
    bool isaviliable;  // 
	
	// Array of addresses for participants
    address[] participants;  
    
	mapping(address => uint8) valueofparticipants;  //
    
	// struct of participants
	struct partner{  
        string name;
        address add;
        uint8 value;
		//a map from the address to the value of a partner
        mapping(address => uint8) addtovalue;  
    }
	
	// initialize
    constructor(){   
        themanager = msg.sender;
        bottomprice = 0;
        targetprice = 65535;
        currentprice = 0;
        isaviliable = true;
    }
	
	//
    modifier onlymanager() {
        require(msg.sender == themanager);
        _;
    }
	
	//
	// initialize the bottomprice
    function intibottomprice(uint8 thevalue) public onlymanager{  
        bottomprice = thevalue;
    }
	
	//
	// initialize the bottomprice
    function intitargetprice(uint16 thevalue) public onlymanager{  
        targetprice = thevalue;
    }
	
	//
	//one apply to join the program
    function applyfor(uint8 theprice) public returns(uint16){  
        // if(currentprice >= targetprice){
        //     isaviliable = false;
        // }
        // if(isaviliable){  //The target amount has not been reached
        //     if(theprice > bottomprice){  //Meet the minimum
        //         uint16 center = add(currentprice,theprice);
        //         require(center < targetprice);  //The sum should be less than the target price
        //         require(center >= currentprice);
        //         currentprice = center;  // updata the currentprice
        //         participants.push(msg.sender);  // add a element to the array
        //         valueofparticipants[msg.sender] = theprice;  // a map
        //         //partner par;
        //       // par.add = msg.sender;
        //         //par.value = theprice;
        //     }
        // }
        
		//The target amount has not been reached
        if(currentprice < targetprice){  
		    //Meet the minimum
            if(theprice >= bottomprice){  
                uint16 center = add(currentprice,theprice);
				
				//The sum should be less than the target price
                require(center < targetprice);  
                require(center >= currentprice);
				
				// updata the currentprice
                currentprice = center;  
				
				// add a element to the array
                participants.push(msg.sender);  
				
				// a map
                valueofparticipants[msg.sender] = theprice;  
                //partner par;
               // par.add = msg.sender;
                //par.value = theprice;
            }
        }
        return currentprice;
    }
}



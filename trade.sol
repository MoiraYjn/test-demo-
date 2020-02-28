pragma solidity >=0.4.15 <0.6.0;
contract Excample{
    
	//manager
    struct manager{
        address manageradd;
        string managername;
        bool ismanager;
        mapping(address => bool) truemaneger;
    }
    
    // seller
    struct seller{
        address selleradd;
        uint8 sellercredibility;  // 
        bool is_seller;
        mapping(address => bool) trueseller;
    }
	
    // goods
    struct goods{
        uint8 good_value;
		
		// Number of this good
        uint8 good_num;  
		
		// Whether the goods support the purchase
        bool is_available;   
    }
	
    //buyer
    struct buyer{
        address buyeradd;
        uint8 buyercredibility;
        bool is_buyer; 
        mapping(address => bool) trueseller;
    }
    
	//
    //initiaze
	//
	// initiaze a good
    goods thegood; 
	
	// initiaze a buyer
    buyer thebuyer;
	
	// initiaze a manager
    manager themanager;
	
	// initiaze a seller
    seller theseller; 
    
    // build map 
    mapping(address => manager) addtomanager;
    mapping(address => buyer) addtobuyer;
    mapping(address => seller) addtoseller;
    
    //address public theseller;
    //address public thebuyer;
    //address public themanager;
    
	constructor(){
        //
		// intiaze a manager, get a mapping
		themanager.manageradd = msg.sender;
        themanager.ismanager = true;
        addtomanager[msg.sender] = themanager;
    }
    
    
    // only manager
    modifier onlymanager(address add){
        //
		// if msg.sender is a manager, there a mapping from msg.sender to manager
		
		manager manager1;
        manager1 = addtomanager[add];
        bool _ismanager = manager1.ismanager;
        require(_ismanager);
        _;
    }
	
    //only seller
    modifier onlyseller(address add){
        //
		// if msg.sender is a true seller ,there a mapping
		
		seller seller1;
        seller1 = addtoseller[add];
        bool _isseller = seller1.is_seller;
        require(_isseller);
        _;
    }
	
    //onlybuyer
    modifier onlybuyer(address add){
        
		// if msg.sender is a buyer , there a mapping
		
		buyer buyer1;
        buyer1 = addtobuyer[add];
        require(buyer1.is_buyer);
        _;
    }
	
    //add manager
    function addmanager(address _manageradd,string name) public onlymanager(msg.sender){
        // add a user in to the manager mapping ,
		manager mana;
        mana.manageradd = _manageradd;
		mana.managername = name;
        mana.ismanager = true;
        addtomanager[_manageradd] = mana;
    }
	
    //add seller
    function addseller(address _selleradd) public onlymanager(msg.sender){
        
		theseller.selleradd = _selleradd;
        theseller.sellercredibility = 50;
        theseller.is_seller = true;
        addtoseller[_selleradd] = theseller;
    }
	
    //add buyer
    function addbuyer(address _buyeradd) public onlymanager(msg.sender){
        thebuyer.buyeradd = _buyeradd;
        thebuyer.buyercredibility = 50;
        thebuyer.is_buyer = true;
        addtobuyer[_buyeradd] = thebuyer;
    }
    
    //add good's information
    function addgood(uint8 _goodvalue,uint8 _goodnum) public onlyseller(msg.sender){
        thegood.good_value = _goodvalue;
        thegood.good_num = _goodnum;
        thegood.is_available = true;
    }
	
    //Adjust good prices
    function changeprice(uint8 price)public onlyseller(msg.sender){
        thegood.good_value = price;
    }
    
    //The product of two Numbers
    function getproduce(uint8 a,uint8 b) public returns(uint16 product){
        //
		uint16 aa = a;
        uint16 bb = b;
        
		//
		if(a == 0 || b ==0){
            product = 0;
        }
        else if(a == 1 || b == 1){
            //
			if(a == 1){
                product = b;
            }
            else{
                product = a;
            }
        }
        else if(a < 16 && b < 16){
            //
			require(a * b < 256);
            product = a * b;
        }
        else{
            //
			require(aa * bb < 65536);
            product = aa * bb;
        }
    }
    
    // The customer buys the good, maney for payment, num for the quantity he wants to buy
    function buy(uint16 maney, uint8 num) public onlybuyer(msg.sender) returns(bool buy){
        //
		uint16 sumprice;
        uint8 danjia = thegood.good_value;
        uint8 kucun = thegood.good_num;
		
		//
        if(num == 0){
            buy = true;
        }
        else{
            //
			if(maney >= danjia){
                //
				if(num <= kucun){
                    sumprice = getproduce(danjia,num);
                    require(sumprice <= maney);
                    thegood.good_num = kucun - num;
                    buy = true;
                }
            }
        }
    }
    
}
//**summary:this is the  test program for Solidity 
//**date:2019-8-5
//**auther:JennaYu
pragma solidity ^0.4.15;
contract demo04 {
    //structure
    struct Monarch {
        uint8 thenum;
        string name;
        uint32 claimPrice;
        uint16 coronationTimestamp;
    }
    //event
    event ThroneClaimed(
        address usurperEtherAddress,
        string usurperName,
        uint newClaimPrice
    );
    //
    uint8 public key_num;
    //declare an array variable 
    uint8[]  set1 = new uint8[](5);
    uint8 public sellerBalance = 0;
    address usecurrent;  
    uint    currentBid;
    //
    mapping(address => uint) refunds;
    address[] private refundAddresses;
    mapping(address => uint) public refundAmount;
    
    // �Խṹ����г�ʼ��
    //Initialize the structure
    function init_Monarch(uint8 addr1,string name1,uint32 price1,uint16 timestamp1){  
        Monarch monarch1;
        monarch1.thenum = addr1;
        monarch1.name = name1;
        monarch1.claimPrice = price1;
        monarch1.coronationTimestamp = timestamp1;
    }
    
    function delete_Monarch(){
        Monarch memory monarch2 = Monarch(12,"a",25679,12345);
        delete monarch2;
    }
    //��������ֵ
    function set_key_num(uint8 keynum_1) public{  
        key_num = keynum_1;
    }
    // ��׳�
    function getfactorial(uint8 num1) returns(uint factorial1){  
        factorial1 = 1;
        for(uint i3 = num1; i3 > 0; i3--){
            factorial1 = factorial1 * i3;
        }
    }
    //��һ����������,�������ݣ�����Ҫ�������
    function getpower(int8 num2,uint8 power_len) returns(int power){  
        power = 1;
        for(uint8 i4 = 1; i4 < power_len; i4++){
            power = power * num2;
        }
    }
     // ���һ���з��������ļ���
    function calculaotr(int8 a1,int8 b1) returns(int16 sum1,int16 diffenence1,int16 product1,int16 factor1,int16 residue1){      
        sum1 = a1 + b1;
        diffenence1 = a1 - b1;
        product1 = a1 * b1;
        factor1 = a1 / b1;
        residue1 = a1 % b1;
    }
    
    // ��һ���������ļӼ��˳�
    function calculaotr1(uint8 a2,uint8 b2) returns(uint8 sum2,uint8 diffenence2,uint8 product2,uint8 factor2,uint8 residue2){  
        uint16 a12 = a2;
        uint16 b12 = b2;
        
        // �������������С�����ֵ��һ�룬���һ��С��������ޣ�����Ҫ�ж�
        if(a2 < 128 && b2 < 128){  
            sum2 = a2 + b2;
        }
        
        //Instead, the require statement scoped
        else{
            require(a12 + b12 <= 255);  
            sum2 = a2 + b2;
        }
        //require-statement 
        require(a2 > b2);
        diffenence2 = a2 - b2;
        
        if(a12 * b12 <= 255){
            product2 = a2 * b2;
        }
        factor2 = a2 / b2;
        residue2 = a2 % b2;
    }
    
    //Initialize Array
    function init_set1(uint8 setvalue1) returns(uint8[]){  
        uint16 setvalue2 = setvalue1;
        require(setvalue2 < 256);
        for(uint8 i1 = 0; i1 < 5; i1 ++){
            require(setvalue1 + i1 >= setvalue1);
            set1[i1] = setvalue1 + i1;
        }
        return set1;
    }
    
    // ������Ԫ�ؽ������
    function add_set1() returns(uint8 set1_sum){  
        set1_sum = 0;
        //
        for(uint8 i2 = 0; i2 < 5; i2++){
            require(set1_sum + set1[i2] >= set1_sum);
            set1_sum = set1_sum + set1[i2];
        }
    }
    //Sorts a given set of data and outputs it as an array
    // �Ը�����һ�����ݽ����������������ʽ���
    function set_sort1(uint8 element1,uint8 element2,uint8 element3,uint8 element4) public returns(uint8[]){  
        uint8[] memory set2 = new uint8[](4);
        set2[0] = element1;
        set2[1] = element2;
        set2[2] = element3;
        set2[3] = element4;
        
        //Loop through the array, handling the unsorted portion
        //ѭ�������������飬����δ���򲿷�
        for(uint loc1 = 0; loc1 < 3; loc1 ++){  
            uint8 temp1 = set2[loc1];
            uint8 temp2 = set2[loc1+1];
            uint theloc = loc1 + 1;
            //For the first unsorted element, look for the smallest element after it
            // ����δ����ĵ�һ��Ԫ�أ����������С��Ԫ��
            for(uint loc2 = loc1+1; loc2 < 3; loc2 ++){   
                if(temp2 > set2[loc2+1]){
                    temp2 = set2[loc2+1];
                    theloc = loc2 + 1;
                }
            }
            //Each time you find the smallest of the remaining unsorted elements, swap it with the first unsorted element
            // ÿ���ҵ�ʣ��δ�����е���С�ģ�������δ����ĵ�һ��Ԫ�ؽ���λ��
            if(temp1 > temp2){  
                set2[loc1] = temp2;
                set2[theloc] = temp1;
            }
        }
        return set2;
    }
    //Addition operations under safe conditions
    function safe_add(uint8 value_2) public returns (uint8){
        require(value_2 + sellerBalance >= sellerBalance);
        sellerBalance += value_2; 
    } 
}
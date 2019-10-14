//**summary:this is the second test program for Solidity 
//**date:2019-8-1
//**auther:JennaYu
pragma solidity >=0.4.15 <0.6.0;
contract demo2 {
    //Global variable: returns the output of the program
    uint16 public res;
    
    //Returns the larger of the two Numbers 
    function bigger(uint16 m1,uint16 n1) public returns (uint16 bigger_1){
        if(m1 <= n1){
            //case1
            bigger_1 = n1;
        }
        else{
            //case2
            bigger_1 = m1;
        }
    }
    //Returns the largest of the three Numbers
    function biggest1(uint16 m3,uint16 n3,uint16 t3) public returns (uint16 biggest_2){
        uint16 t11;
        
        //function call:bigger
        t11 = bigger(m3,n3);
        
        // return parameter
        biggest_2 = bigger(t11,t3);
    }
    //Returns the smaller of the two Numbers
    function smaller(uint16 m4,uint16 n4) public returns (uint16 smaller_1){
        if(m4 < n4){
            //case1
            smaller_1 = m4;
        }
        else{
            //case2
            smaller_1 = n4;
        }
    }
    
    //Returns the sum of the two Numbers
    function add_1(uint16 a1,uint16 b1) public returns (uint16 sum_1){
        sum_1 = a1 + b1;
    }
    //Returns the difference between two Numbers
    function jian_1(uint16 a2,uint16 b2) public returns (uint16 sum_2){
        sum_2 = a2 - b2;
    }
    // �����������������Ͽɲ���������
    function zonghe_1(uint16 a3,uint16 b3,uint16 c3) public returns (uint16 sum_3){  
        uint16 d1;
        uint16 d2;
        //function call:biggest1
        d1 = biggest1(a3,b3,c3);  //�õ����ֵ
        //function call:bigger
        d2 = bigger(a3,b3);
        if(d2 < c3){  // c3������
            sum_3 = d1 + d2;
        }
        else{  // a3,b3��������
            //function call:smaller
            d2 = smaller(a3,b3);   // ��a3,b3�н�С��
            if(d2 < c3){     //����С�߱�C3С����˵��C3Ϊ�ڶ���ģ�
                sum_3 = c3 + d1;
            }
            else{   // ����С�߻���C3����C3����С�ģ���С��Ϊ�ڶ���
                sum_3 = d1 +d2; 
            }
        }
    }
    //���������мӺͼ����õ���С�Ľ��
    function zonghe_2(uint16 a4,uint16 b4,uint16 c4) public returns (uint16){  
        uint16 d3;
        //function call:biggest1
        d3 = biggest1(a4,b4,c4);
        //function call:add_1
        res = add_1(a4,b4);
        res = res + c4;
        //function call:jian_1
        res = jian_1(res,d3);
        res = res - d3;
    }
}
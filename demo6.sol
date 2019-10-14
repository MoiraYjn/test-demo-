//
//**summary:this is the  test program for Solidity 
//**date:2019-8-8
//**auther:JennaYu
//
pragma solidity >=0.4.14 <0.6.0;
contract demo6{
    //
    //struct
    //������
    //
    struct triangle{
        //�����ε�������
        uint8 tri_side_1;
        uint8 tri_side_2;
        uint8 tri_side_3;
        //�����εĵױ�
        uint8 tri_base;
        //�����εĸ�
        uint8 tri_heigth;
    }
    //
    //struct
    //������
    //
    struct square{
        // ��
        uint8 squ_length;
        //��
        uint8 squ_width;
    }
    //
    //struct
    //Բ
    //
    struct cricle{
        //�뾶
        uint8 cri_radius;
    }
    
    //Declare a structure
    triangle triangle_1;
    
    //Initialize a triangle where the sum of the two sides is greater than the third, and the difference between the two sides is less than the third
    //��ʼ��һ�������Σ�Ҫ��������֮�ʹ��ڵ����ߣ����߲�С�ڵ�����
    function init_triangle(uint8 side11,uint8 side12,uint8 side13) public returns(bool){
        //Declare Variable
        //������ʱ�洢����֮��,�������Ҫ����
        uint8 sum1;
        uint8 sum2;
        uint8 sum3;
        //
        //Declare substitution variables
        //�����������
        uint16 side111 = side11;
        uint16 side121 = side12;
        uint16 side131 = side13;
        bool init_tri = false;
        //
        //����һ���м��������ʾ���������������ʼ��Ϊ0��ֻ�е�tempΪ3ʱ��ʾ���������㣬��Ϊ������
        uint8 temp1 = 0;
        
        //��һ�����,
        if(side11 < 128 && side12 < 128){
            //�����߶�С��128����Ͳ������
            sum1 = side11 +side12;
            if(sum1 > side13){
                temp1 ++;
            }
        }
        else{
            //��Ϊ����������������ǣ�ֱ�ӿ������������������Կ��������������д���
            //Ϊ��ֹ����������������ʾ�߳��ͺ͵ı�����������������λ��
            uint16 sum11;
            sum11 = side111 +side121;
            if(side111 > side131){
                temp1 ++;
            }
        }
        //
        //ֻ���ڵ�һ���ж�����ʱ������Ҫ������һ�����ж�
        require(temp1 == 1);
        if(side11 < 128 && side13 < 128){
            sum2 = side11 +side13;
            if(sum2 > side13){
                temp1 ++;
            }
        }
        else{
            uint16 sum21;
            sum21 = side111 + side131;
            if(sum21 > side121){
                temp1 ++;
            }
        }
        //ֻ���ڵڶ����ж�����ʱ��Ҫ������һ�����ж�
        require(temp1 == 2);
        //
        if(side12 < 128 && side13 < 128){
            sum3 = side12 + side13;
            if(sum3 > side11){
                temp1 ++;
            }
        }
        else{
            uint16 sum31;
            sum31 = side121 + side131;
            if(sum31 > side111){
                temp1 ++;
            }
        }
        if(temp1 == 3){
            init_tri = true;
            //Initializes the previously declared triangle
            //��ʼ��ǰ��������������
            triangle_1.tri_side_1 = side11;
            triangle_1.tri_side_2 = side12;
            triangle_1.tri_side_3 = side13;
        }
        return init_tri;
    }
    //
    //Initialize a square
    //��ʼ��һ��������
    function init_square(uint8 squ_length1,uint8 squ_width1) public returns(bool){
        square memory squ1;
        bool init_squ = false;
        if(squ_length1 != 0 && squ_width1 != 0){
            squ1.squ_length = squ_length1;
            squ1.squ_width = squ_width1;
            init_squ = true;
        }
        return init_squ;
    }
    //
    //Initialize a circle
    //��ʼ��һ��Բ
    function init_cricle(uint8 radius) public returns(bool){
        bool init_cri = false;
        cricle memory cri1;
        if(radius != 0){
            cri1.cri_radius = radius;
            init_cri = true;
        }
        return init_cri;
    }
    
    //
    //Perimeter of triangle
    //�������ܳ�
    function get_tri_zhouchang(uint8 side21,uint8 side22,uint8 side23) public returns(uint16){
        uint16 tri_zhouchang;
        //Declare variables, expanding the range of existing variables that can be represented
        uint16 side211 = side21;
        uint16 side221 = side22;
        uint16 side231 = side23;
        //��������֮�ʹ��ڵ�����
        //require-statement
        require(side211 + side221 > side231 && side211 +side231 > side221 && side221 +side231 > side211);
        //�����ܳ�
        tri_zhouchang = side211 + side221 +side231;
        return tri_zhouchang;
    }
    //
    //area of a triangle
    //���������
    function get_tri_mianji(uint8 base1,uint8 heigth1) public returns(uint16){
        uint16 tri_maiji;
        //require-statement,qualified non-zero
        require(base1 != 0 && heigth1 != 0);
        //Declare variables, expanding the range of existing variables that can be represented
        uint16 base11 = base1;
        uint16 heigth11 = heigth1;
        // ֻ��ȡ��
        // area
        tri_maiji = heigth11 * base11 / 2;   
        return tri_maiji;
    }
    //
    // perimeter of square
    //�������ܳ�
    function get_squ_zhouchang(uint8 length1,uint8 width1) public returns(uint16){
        uint16 squ_zhouchang;
        uint16 length11;
        uint16 width11;
        if(length1 <128 && width1 < 128){
            squ_zhouchang = length1 +width1;
        }
        else{
            //Expand variable can express range, carry out addition
            length11 = length1;
            width11 = width1;
            squ_zhouchang = length11 + width11;
        }
        //perimeter
        squ_zhouchang = 2 * squ_zhouchang;
        return squ_zhouchang;
    }
    //
    //area of square
    //���������
    function get_squ_mianji(uint8 length2,uint8 width2) public returns(uint16){
        uint16 squ_mianji;
        require(length2 != 0 && width2 != 0);
        squ_mianji = length2 * width2;
        return squ_mianji;
    }
    //
    //The circumference of a circle
    //Բ�ܳ�
    function get_cri_zhouchang(uint8 r1) public returns(uint16){
        uint16 cri_zhouchang;
        //����һ���м���������ڶ�r1��λ����չ
        uint16 r11;
        if(r1 < 43){
            //����solidity���ܱ�ʾfloat���������ֻ����Բ���ʵ�3
            cri_zhouchang = 3 * r1;
        }
        else{
            r11 = r1;
            cri_zhouchang = 3 * r11;
        } 
        cri_zhouchang= cri_zhouchang * 2;
        return cri_zhouchang;
    }
    //
    // area  of the circle
    //Բ���
    function get_cri_mianji(uint8 r2) public returns(uint16){
        uint16 cri_mianji;
        uint16 r22;
        if(r2 < 10){
            //
            cri_mianji = r2 * r2;
        }
        else{
            r22 = r2;
            //require-statement
            //ȷ������uint16���
            require(r22 * r22 < 21845);
            cri_mianji = r22 * r22;
        }
        cri_mianji = cri_mianji * 3;
        return cri_mianji;
    }
}
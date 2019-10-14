//
//**summary:this is the  test program for Solidity 
//**date:2019-8-8
//**auther:JennaYu
//
pragma solidity >=0.4.14 <0.6.0;
contract demo6{
    //
    //struct
    //三角形
    //
    struct triangle{
        //三角形的三条边
        uint8 tri_side_1;
        uint8 tri_side_2;
        uint8 tri_side_3;
        //三角形的底边
        uint8 tri_base;
        //三角形的高
        uint8 tri_heigth;
    }
    //
    //struct
    //正方形
    //
    struct square{
        // 长
        uint8 squ_length;
        //宽
        uint8 squ_width;
    }
    //
    //struct
    //圆
    //
    struct cricle{
        //半径
        uint8 cri_radius;
    }
    
    //Declare a structure
    triangle triangle_1;
    
    //Initialize a triangle where the sum of the two sides is greater than the third, and the difference between the two sides is less than the third
    //初始化一个三角形，要满足两边之和大于第三边，两边差小于第三边
    function init_triangle(uint8 side11,uint8 side12,uint8 side13) public returns(bool){
        //Declare Variable
        //用来临时存储两边之和,三种情况要考虑
        uint8 sum1;
        uint8 sum2;
        uint8 sum3;
        //
        //Declare substitution variables
        //声明替代变量
        uint16 side111 = side11;
        uint16 side121 = side12;
        uint16 side131 = side13;
        bool init_tri = false;
        //
        //声明一个中间变量，表示规则满足情况，初始化为0，只有当temp为3时表示三条都满足，则为三角形
        uint8 temp1 = 0;
        
        //第一种情况,
        if(side11 < 128 && side12 < 128){
            //若两边都小于128，则和不会溢出
            sum1 = side11 +side12;
            if(sum1 > side13){
                temp1 ++;
            }
        }
        else{
            //若为其他情况，不做考虑，直接看做可能溢出的情况，对可能溢出的情况进行处理
            //为防止溢出情况发生，将表示边长和和的变量重新声明，扩大位数
            uint16 sum11;
            sum11 = side111 +side121;
            if(side111 > side131){
                temp1 ++;
            }
        }
        //
        //只有在第一条判定满足时，菜组要进行下一步的判定
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
        //只有在第二条判定满足时，要进行下一步的判定
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
            //初始化前面声明的三角形
            triangle_1.tri_side_1 = side11;
            triangle_1.tri_side_2 = side12;
            triangle_1.tri_side_3 = side13;
        }
        return init_tri;
    }
    //
    //Initialize a square
    //初始化一个正方形
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
    //初始化一个圆
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
    //三角形周长
    function get_tri_zhouchang(uint8 side21,uint8 side22,uint8 side23) public returns(uint16){
        uint16 tri_zhouchang;
        //Declare variables, expanding the range of existing variables that can be represented
        uint16 side211 = side21;
        uint16 side221 = side22;
        uint16 side231 = side23;
        //满足两边之和大于第三边
        //require-statement
        require(side211 + side221 > side231 && side211 +side231 > side221 && side221 +side231 > side211);
        //计算周长
        tri_zhouchang = side211 + side221 +side231;
        return tri_zhouchang;
    }
    //
    //area of a triangle
    //三角形面积
    function get_tri_mianji(uint8 base1,uint8 heigth1) public returns(uint16){
        uint16 tri_maiji;
        //require-statement,qualified non-zero
        require(base1 != 0 && heigth1 != 0);
        //Declare variables, expanding the range of existing variables that can be represented
        uint16 base11 = base1;
        uint16 heigth11 = heigth1;
        // 只能取整
        // area
        tri_maiji = heigth11 * base11 / 2;   
        return tri_maiji;
    }
    //
    // perimeter of square
    //正方形周长
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
    //正方形面积
    function get_squ_mianji(uint8 length2,uint8 width2) public returns(uint16){
        uint16 squ_mianji;
        require(length2 != 0 && width2 != 0);
        squ_mianji = length2 * width2;
        return squ_mianji;
    }
    //
    //The circumference of a circle
    //圆周长
    function get_cri_zhouchang(uint8 r1) public returns(uint16){
        uint16 cri_zhouchang;
        //声明一个中间变量，用于对r1的位数扩展
        uint16 r11;
        if(r1 < 43){
            //由于solidity不能表示float，因此这里只保留圆周率到3
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
    //圆面积
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
            //确保不会uint16溢出
            require(r22 * r22 < 21845);
            cri_mianji = r22 * r22;
        }
        cri_mianji = cri_mianji * 3;
        return cri_mianji;
    }
}
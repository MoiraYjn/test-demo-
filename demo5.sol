//**summary:this is the  test program for Solidity 
//**date:2019-8-8
//**auther:JennaYu
pragma solidity >=0.4.14 <0.6.0;
contract demo4 {
    
    //struct:teachers' information
    //定义一个结构体，存储老师的基本信息
    struct teacher{
        //教工号
        uint8 teacher_id;
        //教师姓名
        string teacher_name;
        //教师性别
        string teacher_sex;
        //教师所在的专业
        string teacher_major;
        //教师所在的学院
        string collage;
        //确定是老师
        bool is_teacher;
    }
    
    //struct:students' information
    //定义一个结构体，存储学生的基本信息
    struct student{
        //学号
        uint8 stu_id;
        //姓名
        string stu_name;
        //年龄
        uint8 stu_age;
        //性别
        string stu_sex;
        //专业
        string stu_major;
        //指导老师
        teacher thisteacher;
        //
        //确定是学生
        bool is_student;
        //数学成绩
        uint8 math_grage;
        //语文成绩
        uint8 chinese_grade;
        //英语成绩
        uint8 english_grade;
    }
    
    //每个地址对应于一个学生，以mapping的形式
    mapping(address => student) Thestudent;
    //每个地址对应于一个教师，以mapping的形式
    mapping(address => teacher) Theteacher;
    student student01;
    //声明一个学生数组
    student[5] stu_array01;  
    
    //Student information initialization
    //学生信息初始化
    function init_student(uint8 thestu_id1,string thestu_name1,uint8 thestu_age1,
                          string thestu_sex1,string thestu_major1) public{
        //当前地址的学生用户
        student storage stu1 = Thestudent[msg.sender];
        //
        //对学生基本信息进行初始化
        stu1.stu_id = thestu_id1;
        stu1.stu_name = thestu_name1;
        stu1.stu_age = thestu_age1;
        stu1.stu_sex = thestu_sex1;
        stu1.stu_major = thestu_major1;
        //
        //当一个学生的信息完善的情况下，其确定为一个真实存在的学生
        //When a student's information is complete, it is determined to be a real student
        stu1.is_student = true;
    }
    
    //Teacher information initialization
    //教师信息初始化
    function ini_teacher(uint8 theteach_id1,string theteach_name1,string theteach_sex1,
                         string theteach_major1,string theteach_collage1) public{
        //当前地址的老师用户
        teacher  storage teacher1 = Theteacher[msg.sender];
        //
        //对教师基本信息进行初始化
        teacher1.teacher_id = theteach_id1;
        teacher1.teacher_name = theteach_name1;
        teacher1.teacher_sex = theteach_sex1;
        teacher1.teacher_major = theteach_major1;
        teacher1.collage = theteach_collage1;
    }
    
    //Assign a score to the student at the current address
    //为当前地址的学生的成绩赋值
    function set_thestudent_grade(uint8 math_g,uint8 chinese_g,uint8 english_g,address to_stu2) public{
        //当前地址的学生
        student storage stu2 = Thestudent[to_stu2];
        //
        //Judgment is the real student
        require(stu2.is_student == true);
        //赋值
        //需要每门课的成绩小于等于满分100分
        //require-statement
        require(math_g <= 100 && chinese_g <= 100 && english_g <= 100);
        //数学成绩
        stu2.math_grage = math_g;
        //语文成绩
        stu2.chinese_grade = chinese_g;
        //英语成绩
        stu2.english_grade = english_g;
    }
    
    //计算学生成绩之和
    //Calculate the sum of the students' scores
    function getsum_stu_grade(uint8 math1,uint8 chinese1,uint8 english1) public returns(uint16){
        // //获取该地址的学生的成绩之和
        // student storage stu = Thestudent[from_stu1];/*函数参数部分: address from_stu1*/
        uint16 grade_sum = 0; 
        //Calculate the sum of grades
        if(math1 <= 55 || chinese1 <= 55 || english1 <= 55){
            //如果有一门成绩小于55分，则总成绩即不会溢出
            grade_sum = math1 + chinese1 + english1;
        }
        else if(math1 <= 85 && chinese1 <= 85 && english1 <= 85){
            //否则，若每一门课都满足小于85分，即可保证总成绩不会溢出
            grade_sum = math1 + chinese1 + english1;
        }
        else{
            //如果以上两个条件都不满足，则不再进行情况分析，直接视为可溢出，针对溢出要进行处理
            //将成绩相关的三个变量用更长的类型替换
            uint16 math11 = math1;
            uint16 chinese11 = chinese1;
            uint16 english11 = english1;
            //require-statement
            //进行简单的溢出判断，
            require(grade_sum + math11 >= grade_sum);
            grade_sum = grade_sum + math11;
            //require-statement
            require(grade_sum + chinese11 >= grade_sum);
            grade_sum = grade_sum + chinese11;
            //require-statement
            require(grade_sum + english11 >= grade_sum);
            grade_sum = grade_sum + english11;
        }
        return grade_sum;
    }
    
    //求成绩平均值
    function getmean_stu_grade(uint8 math2,uint8 chinese2,uint8 english2) public returns(uint16,uint16){
        //学生成绩均值返回
        uint16 grade_mean = 0;
        //由于solidity不支持double等浮点型，因此在确定均值的时候同时保留余数
        //Since solfever does not support floating point types such as double, the remainder is kept when the mean is determined
        uint16 grade_yushu = 0;
        //中间变量，存储成绩之和的结果，调用求和函数
        uint16 temp_sum1;
        //call :getsum_stu_grade
        //对成绩进行求和
        temp_sum1 = getsum_stu_grade(math2,chinese2,english2);
        grade_mean = temp_sum1 / 3;
        grade_yushu = temp_sum1 % 3;
        
    }
}
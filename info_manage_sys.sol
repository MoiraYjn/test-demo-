//**summary:this is the  test program for Solidity 
//**date:2019-8-8
//**auther:JennaYu
pragma solidity >=0.4.14 <0.6.0;
contract demo4 {
    
    //struct:teachers' information
    //����һ���ṹ�壬�洢��ʦ�Ļ�����Ϣ
    struct teacher{
        //�̹���
        uint8 teacher_id;
        //��ʦ����
        string teacher_name;
        //��ʦ�Ա�
        string teacher_sex;
        //��ʦ���ڵ�רҵ
        string teacher_major;
        //��ʦ���ڵ�ѧԺ
        string collage;
        //ȷ������ʦ
        bool is_teacher;
    }
    
    //struct:students' information
    //����һ���ṹ�壬�洢ѧ���Ļ�����Ϣ
    struct student{
        //ѧ��
        uint8 stu_id;
        //����
        string stu_name;
        //����
        uint8 stu_age;
        //�Ա�
        string stu_sex;
        //רҵ
        string stu_major;
        //ָ����ʦ
        teacher thisteacher;
        //
        //ȷ����ѧ��
        bool is_student;
        //��ѧ�ɼ�
        uint8 math_grage;
        //���ĳɼ�
        uint8 chinese_grade;
        //Ӣ��ɼ�
        uint8 english_grade;
    }
    
    //ÿ����ַ��Ӧ��һ��ѧ������mapping����ʽ
    mapping(address => student) Thestudent;
    //ÿ����ַ��Ӧ��һ����ʦ����mapping����ʽ
    mapping(address => teacher) Theteacher;
    student student01;
    //����һ��ѧ������
    student[5] stu_array01;  
    
    //Student information initialization
    //ѧ����Ϣ��ʼ��
    function init_student(uint8 thestu_id1,string thestu_name1,uint8 thestu_age1,
                          string thestu_sex1,string thestu_major1) public{
        //��ǰ��ַ��ѧ���û�
        student storage stu1 = Thestudent[msg.sender];
        //
        //��ѧ��������Ϣ���г�ʼ��
        stu1.stu_id = thestu_id1;
        stu1.stu_name = thestu_name1;
        stu1.stu_age = thestu_age1;
        stu1.stu_sex = thestu_sex1;
        stu1.stu_major = thestu_major1;
        //
        //��һ��ѧ������Ϣ���Ƶ�����£���ȷ��Ϊһ����ʵ���ڵ�ѧ��
        //When a student's information is complete, it is determined to be a real student
        stu1.is_student = true;
    }
    
    //Teacher information initialization
    //��ʦ��Ϣ��ʼ��
    function ini_teacher(uint8 theteach_id1,string theteach_name1,string theteach_sex1,
                         string theteach_major1,string theteach_collage1) public{
        //��ǰ��ַ����ʦ�û�
        teacher  storage teacher1 = Theteacher[msg.sender];
        //
        //�Խ�ʦ������Ϣ���г�ʼ��
        teacher1.teacher_id = theteach_id1;
        teacher1.teacher_name = theteach_name1;
        teacher1.teacher_sex = theteach_sex1;
        teacher1.teacher_major = theteach_major1;
        teacher1.collage = theteach_collage1;
    }
    
    //Assign a score to the student at the current address
    //Ϊ��ǰ��ַ��ѧ���ĳɼ���ֵ
    function set_thestudent_grade(uint8 math_g,uint8 chinese_g,uint8 english_g,address to_stu2) public{
        //��ǰ��ַ��ѧ��
        student storage stu2 = Thestudent[to_stu2];
        //
        //Judgment is the real student
        require(stu2.is_student == true);
        //��ֵ
        //��Ҫÿ�ſεĳɼ�С�ڵ�������100��
        //require-statement
        require(math_g <= 100 && chinese_g <= 100 && english_g <= 100);
        //��ѧ�ɼ�
        stu2.math_grage = math_g;
        //���ĳɼ�
        stu2.chinese_grade = chinese_g;
        //Ӣ��ɼ�
        stu2.english_grade = english_g;
    }
    
    //����ѧ���ɼ�֮��
    //Calculate the sum of the students' scores
    function getsum_stu_grade(uint8 math1,uint8 chinese1,uint8 english1) public returns(uint16){
        // //��ȡ�õ�ַ��ѧ���ĳɼ�֮��
        // student storage stu = Thestudent[from_stu1];/*������������: address from_stu1*/
        uint16 grade_sum = 0; 
        //Calculate the sum of grades
        if(math1 <= 55 || chinese1 <= 55 || english1 <= 55){
            //�����һ�ųɼ�С��55�֣����ܳɼ����������
            grade_sum = math1 + chinese1 + english1;
        }
        else if(math1 <= 85 && chinese1 <= 85 && english1 <= 85){
            //������ÿһ�ſζ�����С��85�֣����ɱ�֤�ܳɼ��������
            grade_sum = math1 + chinese1 + english1;
        }
        else{
            //����������������������㣬���ٽ������������ֱ����Ϊ�������������Ҫ���д���
            //���ɼ���ص����������ø����������滻
            uint16 math11 = math1;
            uint16 chinese11 = chinese1;
            uint16 english11 = english1;
            //require-statement
            //���м򵥵�����жϣ�
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
    
    //��ɼ�ƽ��ֵ
    function getmean_stu_grade(uint8 math2,uint8 chinese2,uint8 english2) public returns(uint16,uint16){
        //ѧ���ɼ���ֵ����
        uint16 grade_mean = 0;
        //����solidity��֧��double�ȸ����ͣ������ȷ����ֵ��ʱ��ͬʱ��������
        //Since solfever does not support floating point types such as double, the remainder is kept when the mean is determined
        uint16 grade_yushu = 0;
        //�м�������洢�ɼ�֮�͵Ľ����������ͺ���
        uint16 temp_sum1;
        //call :getsum_stu_grade
        //�Գɼ��������
        temp_sum1 = getsum_stu_grade(math2,chinese2,english2);
        grade_mean = temp_sum1 / 3;
        grade_yushu = temp_sum1 % 3;
        
    }
}
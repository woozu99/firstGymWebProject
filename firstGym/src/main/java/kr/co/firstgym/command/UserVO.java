package kr.co.firstgym.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

   private String userId;
   private String userPw;
   private String userName;
   private String userPhone;
   private String userBirth;
   private String userGen;
   private String userEmail;
   private String userMail;
   private String userAddr1;
   private String userAddr2;
   private Timestamp regDate;
   private String userGrade;
   
//   private int userPoint;
   private String nonUserName;
   private String nonUserEmail;
   
   private List<OrderProductVO> orderProductList;
   private List<BmiResultVO> bmiResultList;
   
   
}

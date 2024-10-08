class UserModel
{
   String name;
   String email;
   String phone;
   String uId;

  UserModel({required this.name, required this.email, required this.phone, required this.uId});
   UserModel.formJson(Map<String, dynamic> json)
       :this(
     name: json['name'],
     email: json['email'],
     phone: json['phone'],
     uId: json['uId'],
   );

   Map<String,dynamic> toMap()
   {
     return{
       "name":name,
       "email":email,
       "phone":phone,
       "uId":uId,
     };
   }

}
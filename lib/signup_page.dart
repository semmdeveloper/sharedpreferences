import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdpsharedpref/home_page.dart';
import 'package:pdpsharedpref/servisec/prefs_service.dart';
import 'model/user_model.dart';

class SignUp extends StatefulWidget {
  static final String id='signup_page';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController=new TextEditingController();
  final TextEditingController emailController=new TextEditingController();
  final TextEditingController phoneController=new TextEditingController();
  final TextEditingController passwordController=new TextEditingController();
  final TextEditingController confirmController=new TextEditingController();
  void _dologin(){
    String _name=nameController.text.trim();
    String _email=emailController.text.trim();
    String _phone=phoneController.text.trim();
    String _pass=passwordController.text.trim();
    String _confirm=confirmController.text.trim();
    User user=new User(name:_name,email: _email,phone: _phone,password: _pass,confirm_pass: _confirm);
    if(_pass==_confirm){
      Prefs.storeUser(user);
      Prefs.loadUser().then((user){
        print(user.name);
        print(user.email);
        print(user.phone);
        print(user.password);
        print(user.confirm_pass);
      });
    }else{
      print("passwords is not the same :ERROR");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    Colors.grey[300],
                    Colors.grey[200],
                    Colors.grey[100],
                    Colors.grey[50],
                  ],
                )
            ),
          ),
          Container(
            width:double.infinity,
            child:SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //#figure in topRight
                  Container(
                    height:40,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color:Colors.lightBlue[50],
                            borderRadius: BorderRadius.only(
                                bottomLeft:Radius.circular(70),
                                bottomRight: Radius.circular(40)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //#back button
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child:Row(
                      children:[
                        IconButton(
                          icon:Icon(Icons.arrow_back,size:30),
                          onPressed: ()async{
                            await Navigator.pushNamed(context,HomePage.id);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  //#text
                  Text('Let\'s Get Started',style:GoogleFonts.poppins(
                    color:Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  )),
                  SizedBox(height: 5,),
                  Text('Log in to your existant account of Q Allure',style:TextStyle(color:Colors.grey[500],fontSize: 15),),
                  SizedBox(height: 30,),
                  //#full name
                  Container(
                    margin:EdgeInsets.symmetric(horizontal: 20),
                    padding:EdgeInsets.only(left:30,top:4),
                    height:60,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(30),
                      border:Border.all(width: 2,color:Colors.blue,),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [
                          Colors.grey[200],
                          Colors.grey[100],
                          Colors.white,
                        ],
                      ),
                    ),
                    child:TextField(
                      style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),
                      controller: nameController,
                      decoration:InputDecoration(
                        icon:FaIcon(FontAwesomeIcons.user,color:Colors.blue,size: 16,),
                        border:InputBorder.none,
                        hintText:'Jone Williams',
                        hintStyle: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //#email
                  _fields(icon:Icons.mail_outline,text:'Eamil',controller:emailController,isPass: false),
                  SizedBox(height: 20,),
                  //#phone
                  _fields(icon:Icons.phone_android_rounded,text: 'Phone',controller:phoneController,isPass: false),
                  SizedBox(height: 20,),
                  //#password
                  _fields(icon:Icons.lock_open_rounded,text:'Password',controller:passwordController ,isPass: true),
                  SizedBox(height: 20,),
                  //#confirm password
                  _fields(icon:Icons.lock_open_rounded,text:'Confirm Password',controller:confirmController,isPass: true),
                  SizedBox(height:40),
                  //#CREATE button
                  Container(
                    margin:EdgeInsets.symmetric(horizontal: 100),
                    height:50,
                    width: double.infinity,
                    decoration:BoxDecoration(
                      color:Colors.blue[900],
                      borderRadius:BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color:Colors.lightBlue[100],blurRadius: 20,offset: Offset(0,10)),
                      ],
                    ),
                    child:FlatButton(
                      child:Text('CREATE',style:GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:Colors.white,
                      ),),
                      onPressed:(){
                        _dologin();
                      },
                    ),
                  ),
                  SizedBox(height:50),
                  //#text
                  Container(
                    width: double.infinity,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Alredy have an account? ',style:GoogleFonts.poppins()),
                        GestureDetector(
                          child:Text('Login here',style:GoogleFonts.poppins(color:Colors.blue,fontWeight: FontWeight.bold),),
                          onTap:()async{
                            await Navigator.pushNamed(context,HomePage.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _fields({icon,text,controller,bool isPass}){
    return  Container(
      margin:EdgeInsets.symmetric(horizontal: 20),
      padding:EdgeInsets.only(left:30,top:4),
      height:60,
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(30),
        border: Border.all(
          width: 0.1,
          color:Colors.grey,
        ),
        boxShadow: [
          BoxShadow(color:Colors.grey[200],blurRadius: 10,offset:Offset(0,2)),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          colors: [
            Colors.grey[200],
            Colors.grey[100],
            Colors.white,
          ],
        ),
      ),
      child:TextField(
        controller: controller,
        obscureText:isPass?true:false,
        decoration:InputDecoration(
          icon:Icon(icon,color:Colors.grey,size: 18,),
          border:InputBorder.none,
          hintText:text,
          hintStyle: TextStyle(color:Colors.grey),
        ),
      ),
    );
  }
}


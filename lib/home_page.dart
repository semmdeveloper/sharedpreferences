import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdpsharedpref/servisec/prefs_service.dart';
import 'package:pdpsharedpref/signup_page.dart';
import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  static final  id = "home_page";
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController=new TextEditingController();
  final TextEditingController passwordController=new TextEditingController();
  void _login(){
    String email=emailController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    User user=new User.from(email: email,password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user){
      print(user.email);
      print(user.password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
         child: Column(
           children: [
             //image text text
             Container(
               width: 350,
               height: 350,
               child:Image.asset('assets/images/16.png',fit:BoxFit.cover),
             ),
             Transform.translate(
               offset:Offset(0,-15),
               child:Column(
                 children:[
                   Text('Welcome back!',style:TextStyle(
                     color:Colors.black,
                     fontWeight: FontWeight.w700,
                     fontSize: 25,
                   )),
                   SizedBox(height: 3,),
                   Text('Log in to your existant account of Q Allure',style:TextStyle(color:Colors.grey[500],fontSize: 15),),
                 ],
               ),
             ),

             SizedBox(height: 40,),
             Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     padding: EdgeInsets.only(left: 30,right: 15,top: 10,bottom: 10),
                     height: 65,
                     width: 350,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         border: Border.all(color: Colors.blue[800]),
                         color: Colors.white
                     ),
                     child: TextField(
                       controller: emailController,
                       style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),
                       decoration: InputDecoration(
                         hintText: "Jonnewilliasm@gmail.com",hintStyle: TextStyle(color: Colors.blue[800]),
                         border: InputBorder.none,
                         icon: Icon(Icons.person,color: Colors.blue[800],),
                       ),
                     ),
                   ),
                   SizedBox(height: 20,),
                   Container(
                     padding: EdgeInsets.only(left: 30,right: 15,top: 10,bottom: 10),
                     height: 65,
                     width: 350,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         color: Colors.white,
                         boxShadow: [
                     BoxShadow(color: Colors.grey[300],blurRadius:50,offset: Offset(0,1))
                     ],

                   ),
                     child: TextField(
                       controller: passwordController,
                       obscureText: true,
                       decoration: InputDecoration(
                         hintText: "Password",
                         border: InputBorder.none,
                         icon: Icon(Icons.lock,color: Colors.blue[800],),
                       ),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                             child: Text('Forget Password?'),
                           )
                         ],
                       )
                     ],
                   ),
                   SizedBox(height: 15,),
                   Container(
                     padding: EdgeInsets.only(left:5,right: 5,top: 20,bottom: 15),
                     height: 60,
                     width: 200,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         color: Colors.blue[800]
                     ),
                     child: FlatButton(
                       child:Text('LOG IN',style:TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color:Colors.white,
                       ),),
                       onPressed:(){
                         _login();
                       },
                     ),
                     ),
                   SizedBox(height: 30,),
                   Text("Or connect using"),
                   SizedBox(height: 30,),
                   Container(
                     height: 45,
                     margin:EdgeInsets.symmetric(horizontal: 45),
                     child: Row(
                     children: [
                       Expanded(
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: Colors.blue[800]
                           ),
                                 child:Center(
                                     child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                          FaIcon(FontAwesomeIcons.facebookF,color:Colors.white,size: 15,),
                                           SizedBox(width:10,),
                                           Text('Facebook',style:TextStyle(
                                                 fontSize: 15,
                                              color:Colors.white,
                                           fontWeight: FontWeight.w600,
                                              )),
                                              ],
                                              ),
                                         ),
                                   ),
                       ),
                       SizedBox(width: 15,),
                       Expanded(
                         child: Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.red
                           ),
                           child:Center(
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 FaIcon(FontAwesomeIcons.google,color:Colors.white,size: 15,),
                                 SizedBox(width:10,),
                                 Text('Google',style:TextStyle(fontSize: 15, color:Colors.white, fontWeight: FontWeight.w600,),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ],

                     ),
                   ),
                   SizedBox(height: 10,),
                   Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('Don\'t have an account? ',style:GoogleFonts.poppins()),
                         GestureDetector(
                           child:Text('Sign Up',style:GoogleFonts.poppins(color:Colors.blue,fontWeight: FontWeight.bold),),
                           onTap:()async{
                             await Navigator.pushNamed(context,SignUp.id);
                           },
                         )

                       ],
                     ),
                   )







                 ],
               ),
             ),

           ],
         ),
      ),
    );
  }
}

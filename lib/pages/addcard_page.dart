import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  final String? cardNumber;
  final String? cardDate;

  const AddCardPage({super.key, this.cardNumber, this.cardDate});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {

  _backToFinish(){
    List item=[];
    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/im_card_bg.png"),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20,right: 20),
                    child:Text("VISA",style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20,right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("*** **** **** ****",style: TextStyle(
                            color: Colors.white,
                          fontSize: 30
                        ),),
                        Text("**/**",style: TextStyle(
                            color: Colors.white,
                          fontSize: 20
                        ),),
                      ],
                    ),
                  )
                ],
              ),
            )),
          Container(
            padding: EdgeInsets.all( 25),
            child: Text("Enter expiration date",style: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                    width: 160,
                    child:TextField(
                      decoration: InputDecoration(
                        hintText: "${widget.cardNumber}",
                      ),
                    )
                ),
                Container(
                  padding: EdgeInsets.all(5),
                    width: 50,
                    child:TextField(
                      decoration: InputDecoration(
                        hintText: "${widget.cardDate}",
                      ),
                    )
                ),

              ],
            ),

          Container(
            padding: EdgeInsets.all( 25),
            child: Text("•Only Visa, MasterCard issued cards supported",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          ),

          Expanded(child: SizedBox()),

          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("Add Card",style: TextStyle(color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
                onPressed: (){
                  _backToFinish();
                }
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flatter1_exam/pages/addcard_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future _addCardPage() async {
    String number = '**** **** **** ****';
    String date = '**/**';
    List item = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return AddCardPage(cardNumber: number,cardDate: date,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Card List"),

      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Divider(),
                _cardList("assets/images/ic_card_master.png", "**** **** **** ****","11/25"),
                _cardList("assets/images/ic_card_visa.png", "**** **** **** ****","11/25"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
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
                _addCardPage();
              }
            ),
          )
        ],
      )
    );
  }

  Widget _cardList(cardType,cardNumber,cardDate){
    return  Container(
      padding: EdgeInsets.all(10),
      height:100,
      child:Row(
        children: [
          Container(
            width: 100,
            height: 50,
            child: Image(
              image: AssetImage(cardType),
            ),
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cardNumber),
              Text(cardDate),
            ],
          )
        ],
      ),
    );
  }
}

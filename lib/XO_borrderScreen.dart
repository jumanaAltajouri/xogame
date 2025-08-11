import 'package:flutter/material.dart';
import 'package:xogame/borad_item.dart';

class XoBorrderscreen extends StatefulWidget {
  static const String routeName = '/xoborder';

  @override
  State<XoBorrderscreen> createState() => _XoBorrderscreenState();
}

class _XoBorrderscreenState extends State<XoBorrderscreen> {
  List<String> borad = List.filled(9, '');
  late String player1Symbol;
  late String player2Symbol = player1Symbol == 'x' ? 'o' : 'x';
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    player1Symbol = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${player1Symbol.toUpperCase()}: $player1Score',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${player2Symbol.toUpperCase()}: $player2Score',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${round.isOdd ? player1Symbol.toUpperCase() : player2Symbol.toUpperCase()}'s turn",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  color: Colors.black,
                ),
                clipBehavior: Clip.antiAlias,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemBuilder: (_, index) => BoradItem(
                    text: borad[index],
                    index: index,
                    onPressed: onItemcliked,
                  ),
                  itemCount: borad.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int round = 1;
  void onItemcliked(int inedx) {
    if (round.isOdd) {
      borad[inedx] = player1Symbol;
      if (cheakwinner(player1Symbol)) {
        player1Score++;
        ClearBoard();
        return;
      }
    } else {
      borad[inedx] = player2Symbol;
      if (cheakwinner(player2Symbol)) {
        player2Score++;
        ClearBoard();
        return;
      }
    }

    round++;
    if (round == 10) {
      //Drawww
      ClearBoard();
      return;
    }

    setState(() {});
  }

  bool cheakwinner(String symbol) {
    if (round < 5) return false;

    if (borad[0] == symbol && borad[4] == symbol && borad[8] == symbol) {
      return true;
    }
    if (borad[2] == symbol && borad[4] == symbol && borad[6] == symbol) {
      return true;
    }
    //012
    //345
    //678
    for (int i = 0; i <= 6; i += 3) {
      if (borad[i] == symbol &&
          borad[i + 1] == symbol &&
          borad[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i <= 2; i++) {
      if (borad[i] == symbol &&
          borad[i + 3] == symbol &&
          borad[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }

  void ClearBoard() {
    borad = List.filled(9, '');
    round + 1;
    setState(() {});
  }
}

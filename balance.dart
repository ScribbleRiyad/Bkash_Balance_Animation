class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAnimated = false;
  bool isBalanceShown = false;
  bool isBalance = true;
  void changeState() async {
    isAnimated = true;
    isBalance = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 800),
            () => setState(() => isBalanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
            () => setState(() => isBalanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
            () => setState(() => isAnimated = false));
    await Future.delayed(const Duration(milliseconds: 800),
            () => setState(() => isBalance = true));
  }
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [

              SizedBox( height: 80,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: ThemeStyles.primaryColor,
                    radius: 25,

                    child: Image.asset("assets/images/image/user.png",
                      fit: BoxFit.fitHeight,
                      height: 40,),
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                children: [
                  const GammaTextWidget( text: "MD RIYAD MAHMUD", fontSize: 16,),
                  const SizedBox(height: 5,),
                  InkWell(
                      onTap: changeState,
                      child: Container(
                          width: 160,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child:
                          Stack(alignment: Alignment.center, children: [

                            AnimatedOpacity(
                                opacity: isBalanceShown ? 1 : 0,
                                duration: const Duration(milliseconds: 500),
                                child: const Text('৳ 5000.00',
                                    style: TextStyle(
                                        color: ThemeStyles.primaryColor, fontSize: 14))),


                            AnimatedOpacity(
                                opacity: isBalance ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: const Text('Balance',
                                    style: TextStyle(
                                        color: ThemeStyles.primaryColor, fontSize: 14))),


                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 1100),
                                left: isAnimated == false ? 5 : 135,
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ThemeStyles.primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(50)),
                                    child: const FittedBox(
                                        child: Text('৳',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17)))))
                          ]))),
                ],
              ),

            ],
          ),

          elevation: 0,
          backgroundColor: ThemeStyles.primaryColor,
           toolbarHeight:   MediaQuery.of(context).size.height * 0.12,
        ),

       
      ),
    );
  }
}

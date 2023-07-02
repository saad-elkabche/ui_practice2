import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:const Text("home"),
      ),
      backgroundColor: Colors.cyanAccent[100],
      body: Center(
        child: SizedBox(
          height:250 ,
          width: w*0.8,
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClip(),
                child: Container(
                  height: 250,
                  width: w*0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),

                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("38°",style:Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.teal,fontWeight: FontWeight.bold),),
                            Text("Heavy Rain >",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.teal,fontWeight: FontWeight.bold))

                          ],
                        ),
                        Text("Rome, Italy",style:Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.teal,fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/img.png",width: 150,fit: BoxFit.cover,),
                      Text("20°~29°",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),),
                    ],
                  )
                ],

              ),
            ],
          ),
        )
      ),
    );
  }
}

class MyClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w=size.width;
    double h=size.height;


    Path path=Path();
    path.lineTo(0, h);
    path.lineTo(w ,h);
    path.lineTo(w ,h*0.7);

    path.quadraticBezierTo(w, h*0.5, w*0.7, h*0.5);
    path.lineTo(w*0.7, h*0.5);

   path.quadraticBezierTo(w*0.45, h*0.5, w*0.49, h*0.25);
    path.lineTo(w*0.49, h*0.25);
    path.quadraticBezierTo(w*0.5,0,w*0.35, 0);

    //path.quadraticBezierTo(w*0.5,0 );


/*    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();*/
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
   return true;
  }

}

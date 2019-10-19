import 'package:fancy_fashion_app_ui/widgets/circularButton.dart';
import 'package:fancy_fashion_app_ui/widgets/productColorSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double rating = 4.0;
  final String desc = "Look your ethnic best by flaunting this gorgeous Anarkali suit-set from the designer collection of Biba. ";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
          Color(0xFF8566B0),
          Color(0xFF000000),

    ],
          begin: Alignment(-1.0, -6.0),
          end: Alignment(1.0, 6.0),
        )
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Center(
                child: Image.asset(
                  "assets/images/model.png",
                  width: double.infinity,
                  height: height * .7,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF000000).withOpacity(0.8),
                    Color(0xFF8566B0).withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.4, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: ScreenUtil().setHeight(580),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().setWidth(400),
                            ),
                            child: Text(
                              "Anarkali Suit (Dark Blue)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(54),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("\₹1999",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(46),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w800,
                                  )),
                              SizedBox(
                                height: ScreenUtil().setHeight(12),
                              ),
                              CustomPaint(
                                painter: LinePainter(),
                                child: Text("\₹2999",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(30),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(14),
                      ),
                      SmoothStarRating(
                        allowHalfRating: true,
                        onRatingChanged: (v) {
                          rating = v;
                          setState(() {});
                        },
                        starCount: 5,
                        rating: rating,
                        size: 22,
                        color: Colors.white,
                        borderColor: Colors.white,
                        spacing: 0.0,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      Text(
                        "Variants",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ColorSelector(
                            colors: [
                              Color(0xFF131742),
                              Color(0xFF182442),
                              Color(0xFF184166),
                            ],
                          ),
                          CircularButton(
                            color: Colors.white,
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().setWidth(400),
                            ),
                            child: Text(
                              desc,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(26),
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                          CircularButton(
                            color: Colors.white,
                            icon: Icon(Icons.shopping_cart, color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;

    canvas.drawLine(
        Offset(0, size.height - 4), Offset(size.width, 4), linePaint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}
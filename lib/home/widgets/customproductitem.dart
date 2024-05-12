import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class customproductitem extends StatefulWidget {
  customproductitem(
      {super.key,
      required this.cart,
      required this.model,
      required this.isfavorite});
  final productmodel model;
  bool isfavorite;
  bool cart;

  @override
  State<customproductitem> createState() => _customproductitemState();
}

class _customproductitemState extends State<customproductitem> {
  @override
  int size = 0;
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ManageLove_Cart_states_cubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(model: widget.model),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          height: MediaQuery.sizeOf(context).height * 0.23,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        widget.model.image,
                      ),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Text(
                        widget.model!.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: Farro,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      widget.model.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: Farro,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "\$ ${widget.model.price} ",
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: Farro,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          " ${widget.model.rating.rate}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: Farro,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          " Ratings",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: Farro,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Sized",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: Farro,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                size = 0;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: size == 0 ? Colors.blue : null,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.3)),
                                ),
                                child: Center(
                                    child: Text(
                                  "S",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: Farro,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        size == 0 ? Colors.white : Colors.grey,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                size = 1;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: size == 1 ? Colors.blue : null,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.3)),
                                ),
                                child: Center(
                                    child: Text(
                                  "M",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: Farro,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        size == 1 ? Colors.white : Colors.grey,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                size = 2;
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: size == 2 ? Colors.blue : null,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.3)),
                                ),
                                child: Center(
                                    child: Text(
                                  "L",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: Farro,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        size == 2 ? Colors.white : Colors.grey,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (widget.model.isactive) {
                                cubti.removefromLove(item: widget.model);
                              } else {
                                cubti.addtolove(item: widget.model);
                              }
                              widget.model.isactive = !widget.model.isactive;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.favorite,
                              color: widget.model.isactive
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              // Expanded(
              //   flex: 1,
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: Row(
              //       children: [
              //         IconButton(
              //           onPressed: () {
              //             if (widget.model.isactive) {
              //               cubti.removefromLove(item: widget.model);
              //             } else {
              //               cubti.addtolove(item: widget.model);
              //             }
              //             widget.model.isactive = !widget.model.isactive;
              //             setState(() {});
              //           },
              //           icon: Icon(
              //             Icons.favorite,
              //             color: widget.model.isactive
              //                 ? const Color.fromARGB(255, 138, 11, 11)
              //                 : null,
              //           ),
              //         ),
              //         IconButton(
              //           onPressed: () {
              //             if (!widget.model.cart) {
              //               cubti.addtocart(item: widget.model);
              //             } else {
              //               cubti.removefromcart(item: widget.model);
              //             }
              //             widget.model.cart = !widget.model.cart;
              //             setState(() {});
              //           },
              //           icon: Icon(
              //             FontAwesomeIcons.cartShopping,
              //             color: widget.model.cart
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/detailsscreen/details.dart';
import 'package:null_project/home/model/productmodel.dart';

class itemgrid extends StatefulWidget {
  itemgrid({
    super.key,
    required this.cart,
    required this.isfavorite,
    required this.model,
  });
  final productmodel model;

  bool isfavorite;
  bool cart;

  @override
  State<itemgrid> createState() => _itemgridState();
}

class _itemgridState extends State<itemgrid> {
  @override
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ManageLove_Cart_states_cubit>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(model: widget.model),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(widget.model.image))),
              height: MediaQuery.sizeOf(context).height * 0.3,
            ),
            SizedBox(
              width: 100,
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
              widget.model!.description,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 16, fontFamily: Farro, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  "\$ ${widget.model!.price}",
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16, fontFamily: Farro, color: Colors.blue),
                  overflow: TextOverflow.ellipsis,
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
                    color: widget.model.isactive ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:burc_application/burc_detay.dart';
import 'package:burc_application/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({Key? key, required this.listelenenBurc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
          ));
        },
        leading: Image.asset(
          "images/" + listelenenBurc.burcKucukResim,
        ),
        title: Text(listelenenBurc.burcAdi,style: Theme.of(context).textTheme.headline5,),
        subtitle: Text(listelenenBurc.burcTarihi,style: Theme.of(context).textTheme.subtitle2,),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pink,
        ),
      ),
    );
  }
}

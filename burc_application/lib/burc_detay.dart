import 'package:burc_application/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({Key? key, required this.secilenBurc}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarColor = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: appBarColor,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                      widget.secilenBurc.burcAdi + ' Burcu ve Özellikleri'),
                  centerTitle: true,
                  background: Image.asset(
                    'images/' + widget.secilenBurc.burcBuyukResim,
                    fit: BoxFit.cover,
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(
                    widget.secilenBurc.burcDetay,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + widget.secilenBurc.burcBuyukResim));
    appBarColor = _generator.dominantColor!.color;
    setState(() {
      
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DynamicListView extends StatefulWidget
{
  List<Model>mobilelist;
  DynamicListView({required this.mobilelist});

  @override
  DynamicState createState() => DynamicState(mobilelist: mobilelist);

}

class DynamicState extends State<DynamicListView>
{

  List<Model>mobilelist ;
  DynamicState({required this.mobilelist});

  @override
  Widget build(BuildContext context)
  {

    // mobilelist =List<Model>();
    mobilelist.add(Model("https://paternalistic-hiera.000webhostapp.com/Images/th.jpeg", "whatsapp"));
    mobilelist.add(Model("https://paternalistic-hiera.000webhostapp.com/Images/th%20(1).jpeg", "facebook"));
    mobilelist.add(Model("https://paternalistic-hiera.000webhostapp.com/Images/twitter.jpeg", "twitter"));
    mobilelist.add(Model("https://paternalistic-hiera.000webhostapp.com/Images/instagram.jpeg", "instagram"));
    mobilelist.add(Model("https://paternalistic-hiera.000webhostapp.com/Images/youtube.jpeg",'Youtube'));

    return Scaffold(
        appBar: AppBar(title: Text("coustom list"),),
        body: ListView.separated
          (
            itemCount: mobilelist == null ? 0 : mobilelist.length,
            itemBuilder: (ctx, i) {
              return ListTile
                (
                leading: Image.network(mobilelist[i].image,width: 100,height: 270),
               // leading: Container(
                //   margin: EdgeInsets.all(10.0),
                //   child: CircleAvatar(
                //     radius: 20.0, // Adjust as needed
                //     backgroundImage: NetworkImage(mobilelist[i] as String,),
                //   ),
                // ),
                title: Text(mobilelist[i].name),
                subtitle: Text("description"),
              );
            }, separatorBuilder: (BuildContext context, int index)
        {
          return Divider(height: 5,thickness: 2,);
        },
        )








    );


    return ListView.builder
      (

        itemCount: mobilelist == null ? 0 : mobilelist.length,
        itemBuilder: (ctx, i)
        {
          return ListTile
            (
            leading: Image.network(mobilelist[i].image),
            title: Text(mobilelist[i].name),
          );
        }
    );
  }
}
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/web_view/web_view.dart';

Widget buildArticleItem(article,context) =>InkWell(
  onTap: (){
    navigatTo(context, WebViewSScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image:DecorationImage(



              image:NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),



          ),

        ),

        SizedBox(width: 20,),



        Expanded(

          child: Container(

            height: 120,

            child: Column(

              //mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow:TextOverflow.ellipsis ,

                  ),

                ),

                Text('${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,



                  ),

                ),



              ],

            ),

          ),

        )

      ],



    ),

  ),
);
Widget articleBuilder(list,context,{issearch = false})=>ConditionalBuilder(

  condition:list.length>0 ,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context , index)=>buildArticleItem(list[index],context),
    separatorBuilder: (context, index)=> SizedBox(height: 10,) ,
    itemCount: 7,),
  fallback: (context)=>issearch ?Container() : Center(child: CircularProgressIndicator()),


);
void navigatTo(context,Widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Widget,
    ),
);
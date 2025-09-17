import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isTablet= MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
       body: isTablet ?
             Row(
               children: [
                 Expanded(child: _buildImageSection(context), flex: 1,),
                 Expanded(child: _buildDetailsSection(context), flex: 1,),
               ],
             ): SingleChildScrollView(
           child: Column(
             children: [
               _buildImageSection(context),
               _buildDetailsSection(context),
             ],
           ),
       ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to Cart"),
      ),
    );
  }


  Widget _buildImageSection(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.4,
      child: PageView(
        children: [
          Image.network(
            "https://picsum.photos/400/400?1",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://picsum.photos/400/400?2",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://picsum.photos/400/400?3",
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nike Air Max 270",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8,),
          const Text(
            "\$199.99",
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          const SizedBox(height: 8),

          RatingBar.builder(
           initialRating: 4.5,
            minRating: 1,
            itemSize: 28,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context,_)=>   const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating){},
          ),
          const SizedBox(height: 16,),

          const Text("Select Size",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),

          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: GridView.count(
                crossAxisCount: 5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2,
              shrinkWrap: true,
              children: ["6","7","8","9","10"].map((size)=>OutlinedButton(
                  onPressed: (){},
                  child: Text(size)
              )).toList(),
            ),


          ),
          const SizedBox(height: 16),
          const Text("Select Color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildColorCircle(Colors.red),
              _buildColorCircle(Colors.blue),
              _buildColorCircle(Colors.black),
              _buildColorCircle(Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color){
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey)
      ),
    );
  }

}


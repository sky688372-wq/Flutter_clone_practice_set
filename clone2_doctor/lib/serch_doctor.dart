import 'package:clone_pr/detail_screen.dart';
import 'package:clone_pr/doctor_info.dart';
import 'package:flutter/material.dart';

class SerchDoctor extends StatefulWidget {
  const SerchDoctor({super.key, required this.doctorList});

  final List<DoctorInfo> doctorList;

  @override
  State<SerchDoctor> createState() => _SerchDoctorState();
}

class _SerchDoctorState extends State<SerchDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1. appBar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Top Doctor",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: BoxBorder.all(color: Colors.grey.withOpacity(0.7))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
        
                        SizedBox(width: 10,),
        
        
        
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Doctor",
                              border: InputBorder.none
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
        
              ListView.builder(
                itemCount: widget.doctorList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = widget.doctorList[index];
        
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.purple.withOpacity(0.1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    doctor.ProfilePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4CD964),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(width: 15),
        
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D3142),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  doctor.introduce,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star_rounded,
                                            color: Color(0xFF4CD964), size: 20),
                                        SizedBox(width: 4),
                                        Text(
                                          doctor.rating.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2D3142),
                                          ),
                                        ),
                                      ],
                                    ),
        
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                              name: doctor.name,
                                              imagePath: doctor.ProfilePath
                                          ),));
                                        },

                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF4F5F7),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Appointment',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D3142),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

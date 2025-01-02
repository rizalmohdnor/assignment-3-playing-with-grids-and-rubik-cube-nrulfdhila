import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // Back
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
  ];

<<<<<<< HEAD
  // Rotate top face to the left, modify if necessary
  void rotateTop() {
    // Store the top row of each face
    List<Color> topRowFront = [faces[0][0], faces[0][1]];
    List<Color> topRowLeft = [faces[1][0], faces[1][1]];
    List<Color> topRowRight = [faces[2][0], faces[2][1]];
    List<Color> topRowBack = [faces[3][0], faces[3][1]];

    // Rotate top face
    List<Color> tempTop = [...faces[4]];
    faces[4] = [tempTop[2], tempTop[3], tempTop[0], tempTop[1]];

    // Update adjacent faces
    faces[0] = [faces[3][2], faces[3][3], ...faces[0].sublist(2)];
    faces[1] = [faces[0][2], faces[0][3], ...faces[1].sublist(2)];
    faces[2] = [faces[1][2], faces[1][3], ...faces[2].sublist(2)];
    faces[3] = [faces[2][2], faces[2][3], ...faces[3].sublist(2)];
  }
  
  // Rotate top face to the left, modify if necessary
  void rotateBottom() {
    //Need to implement your code here
=======
  // Rotate the top face
  void rotateTop() {
    // Rotate the top face itself
    List<Color> temp = [...faces[4]];
    faces[4] = [temp[2], temp[0], temp[3], temp[1]];

    // Update adjacent edges (Front, Left, Back, Right)
    List<Color> tempEdge = [faces[0][0], faces[0][1]]; // Front top row
    faces[0][0] = faces[1][0];
    faces[0][1] = faces[1][1];
    faces[1][0] = faces[3][2];
    faces[1][1] = faces[3][3];
    faces[3][2] = faces[2][0];
    faces[3][3] = faces[2][1];
    faces[2][0] = tempEdge[0];
    faces[2][1] = tempEdge[1];
  }

  // Rotate the bottom face
  void rotateBottom() {
    // Rotate the bottom face itself
    List<Color> temp = [...faces[5]];
    faces[5] = [temp[2], temp[0], temp[3], temp[1]];

    // Update adjacent edges (Front, Right, Back, Left)
    List<Color> tempEdge = [faces[0][2], faces[0][3]]; // Front bottom row
    faces[0][2] = faces[2][2];
    faces[0][3] = faces[2][3];
    faces[2][2] = faces[3][0];
    faces[2][3] = faces[3][1];
    faces[3][0] = faces[1][2];
    faces[3][1] = faces[1][3];
    faces[1][2] = tempEdge[0];
    faces[1][3] = tempEdge[1];
>>>>>>> d5f3038 (Initial commit)
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({Key? key}) : super(key: key);

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTop() {
    setState(() {
      cube.rotateTop();
    });
  }

<<<<<<< HEAD
=======
  void rotateBottom() {
    setState(() {
      cube.rotateBottom();
    });
  }

>>>>>>> d5f3038 (Initial commit)
  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2x2 Rubik\'s Cube'),
<<<<<<< HEAD
        // instead of using an icon button here, create atleast 2 buttons to rotate the faces, rotate left face, or rotate right face, or implement all rotations.
        actions: [
          IconButton(
            icon: const Icon(Icons.rotate_left),
            onPressed: rotateTop,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top face
            Column(
              children: [
                const Text('Top'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[4]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left face
                Column(
                  children: [
                    const Text('Left'),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[1]),
                    ),
                  ],
                ),
                // Front face
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[0]),
                ),
                // Right face
                Column(
                  children: [
                    const Text('Right'),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[2]),
                    ),
                  ],
                ),
              ],
            ),
            // Bottom face , implement your bottom face
            // Rear face, implement your rear face
                ),
              ],
            ),
          ],
        ),
=======
      ),
      body: Column(
        children: [
          // Top face
          Column(
            children: [
              const Text('Top'),
              SizedBox(
                height: 100,
                width: 100,
                child: buildFace(cube.faces[4]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left face
              Column(
                children: [
                  const Text('Left'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[1]),
                  ),
                ],
              ),
              // Front face
              Column(
                children: [
                  const Text('Front'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[0]),
                  ),
                ],
              ),
              // Right face
              Column(
                children: [
                  const Text('Right'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: buildFace(cube.faces[2]),
                  ),
                ],
              ),
            ],
          ),
          // Bottom face
          Column(
            children: [
              const Text('Bottom'),
              SizedBox(
                height: 100,
                width: 100,
                child: buildFace(cube.faces[5]),
              ),
            ],
          ),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: rotateTop,
                child: const Text('Rotate Top'),
              ),
              ElevatedButton(
                onPressed: rotateBottom,
                child: const Text('Rotate Bottom'),
              ),
            ],
          ),
        ],
>>>>>>> d5f3038 (Initial commit)
      ),
    );
  }
}

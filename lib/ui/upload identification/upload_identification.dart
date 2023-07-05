import 'package:flutter/material.dart';

class UploadIdentification extends StatelessWidget {
  const UploadIdentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUpperContainer(),
      ],
    );
  }

  _buildUpperContainer() {
    return Container(
        //padding: EdgeInsets.only(left: 100, top: 50),
        //  alignment: Alignment.center,
        child: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Upload',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
          const Text(
            'Identification',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildGUidelinesdBanner(),
          const SizedBox(
            height: 30,
          ),
          _buildButtons()
        ],
      ),
    ));
  }

  _buildGUidelinesdBanner() {
    return const SizedBox(
      width: 150,
      // height: 30,
      child: Column(
        children: [
          Text(
            'Upload any of the following',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut  laborum.',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Guidelines',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Lorem ipsumrit in at cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          )
        ],
      ),
    );
  }

  _buildButtons() {
    return Column(
      children: [
        const Text(
          'Citizenship',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 260,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},

            //  signIn,
            child: const Text('Upload',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: 300,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Pan Number',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 260,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},

            //  signIn,
            child: const Text('Upload',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: 300,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 260,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},

            //  signIn,
            child: const Text('More Upload Options',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 260,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},

            //  signIn,
            child: const Text('Request For Approval',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

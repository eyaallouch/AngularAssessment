import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> launchMap(String address) async {
  final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Impossible de lancer $googleMapsUrl';
  }
}

class ContactPage extends StatelessWidget {
  final String email = "jabeurwassim47@gmail.com";
  final String phone = "(216) 56 102 722";
  final String address = "Cité jardin, 5 août, Route de Tunis, KM1, Sfax 3002";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Colors.teal[600],
      ),
      body: ContactBody(
        email: email,
        phone: phone,
        address: address,
      ),
    );
  }
}

class ContactBody extends StatelessWidget {
  final String email;
  final String phone;
  final String address;

  ContactBody({
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            "Contactez-moi",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),

          const SizedBox(height: 16.0),

          ContactInfo(
            icon: Icons.email,
            label: "Email",
            content: email,
            onTap: () => _launchEmail(context, email),
          ),
          ContactInfo(
            icon: Icons.phone,
            label: "Téléphone",
            content: phone,
            onTap: () => _launchPhone(context, phone),
          ),
          ContactInfo(
            icon: Icons.location_on,
            label: "Adresse",
            content: address,
            onTap: () => launchMap(address),
          ),

          const SizedBox(height: 16.0),

          Text(
            "Réseaux Sociaux",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.facebook,
                color: Colors.blue,
                onTap: () => _launchUrl(context, "https://www.facebook.com/wassim.jabeur.9"),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blueAccent,
                onTap: () => _launchUrl(context, "https://www.linkedin.com/in/wassim-jabeur-4b2859257/"),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.instagram,
                color: Colors.pink,
                onTap: () => _launchUrl(context, "https://www.instagram.com/wassim_jabeur/"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchEmail(BuildContext context, String email) {
    final uri = Uri.parse("mailto:$email");
    _launchUrl(context, uri.toString());
  }

  void _launchPhone(BuildContext context, String phone) {
    final uri = Uri.parse("tel:$phone");
    _launchUrl(context, uri.toString());
  }

  void _launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Impossible de lancer $url")),
      );
    }
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String content;
  final Function()? onTap;

  ContactInfo({
    required this.icon,
    required this.label,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Correction de la forme
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(content),
        onTap: onTap,
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function()? onTap;

  SocialIcon({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Correction de la forme
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Correction de boxShadow
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: 40,
        ),
      ),
    );
  }
}

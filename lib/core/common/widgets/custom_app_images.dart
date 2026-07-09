class CustomAppImages {
  static const Map<String, String> images = {
    "send": "assets/images/logo.png",
    "test": "assets/images/send.png",
    "send3": "assets/images/send.png",
    "spinach": "assets/images/Spinach.jpg",
    "sweet potatoes": "assets/images/Sweet Potatoes.jpg",
    "carrots": "assets/images/Carrots.jpg",
    "broccoli": "assets/images/Broccoli.jpg",
    "cucumbers": "assets/images/Cucumbers.jpg",
    "walking": "assets/images/walking.png",
    "deep breathing exercise": "assets/images/Deep Breathing Exercise.png",
    "cat-cow stretch": "assets/images/cat cow stretch.png",
    "gentle stretching": "assets/images/gentle_stretching.png",
    "pelvic tilt exercise": "assets/images/Pelvic Tilt Exercise.png",
    "official birth certificate": "assets/images/Official Birth Certificate.png",
    "medical prescription": "assets/images/Medical Prescription.png",
    "blood analysis report": "assets/images/Blood Analysis Report.png",

    "apple": "assets/images/apple.jpg",
    "avocado": "assets/images/avocado.jpg",
    "banana": "assets/images/banana.jpg",
    "berry": "assets/images/berry.jpg",
    "cheese": "assets/images/cheese.jpg",
    "chicken": "assets/images/chicken.jpeg",
    "dairy": "assets/images/dairy.jpg",
    "egg": "assets/images/egg.JPG",
    "fish": "assets/images/fish.jpg",
    "greek yogurt": "assets/images/greek yogurt.jpg",
    "labneh": "assets/images/labneh.jpg",
    "lentil": "assets/images/lentil.jpg",
    "mango": "assets/images/mango.jpg",
    "meat": "assets/images/meat.jpg",
    "milk": "assets/images/milk.jpg",
    "nut": "assets/images/nut.jpg",
    "orange": "assets/images/orange.png",
    "pomegranate": "assets/images/pomegranate.png",
  };

  static const String defaultImage =
      "assets/images/default.png";

  static String getImage(String title) {
    return images[title.toLowerCase()] ?? defaultImage;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class CounselorModel {
  late String name;
  late String specialize;
  late String about;
  late int catId;
  late String? counselorId;
  late String counselorEmail;
  late bool isMale;

  CounselorModel(this.name, this.specialize, this.about, this.catId,
      this.counselorId, this.counselorEmail, this.isMale);

  factory CounselorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return CounselorModel(
        data?['name'],
        data?['specialized'],
        data?['about'],
        data?['catId'],
        data?['counselorId'],
        data?['counselorEmail'],
        data?['isMale']);
  }
}

void createCounselor() {
  List<CounselorModel> counselors = [
    CounselorModel(
        "Ms.Shaini Silva",
        "Specialized in Resin",
        "Shaini Silva is a committed educator and resin artist who emphasizes eco-friendliness and sustainability. Shanika enables students to produce stunning resin artwork with less environmental impact by imparting her knowledge of mold-making, surface decoration, and resin casting procedures during her counseling sessions.",
        5,
        "017",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Niro Perera",
        "Specialized in Jewellery",
        "Nirosha Perera is a talented jewelry designer known for her elegant and contemporary designs inspired by Sri Lankan motifs. Her counseling sessions provide practical instruction in jewelry making techniques, from metalwork to gemstone setting, tailored to the individual interests and skill levels of her students.",
        3,
        "counselorId",
        "hansala.20221827@iit.ac.lk",
        false),
    CounselorModel(
        "Ms.Shani Silva",
        "Specialized in Jewellery",
        "Shani Silva is a committed jewelry maker, mentor, and teacher. In order to empower students to make stunning jewelry with a little environmental impact, her counseling sessions offer hands-on teaching in eco-friendly jewelry manufacturing techniques.",
        3,
        "015",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Thili Perera",
        "Specialized in Mask",
        "Thilini Ranasinghe is a skilled mask maker with a passion for storytelling through art. Through her counseling sessions and workshops, Thilini encourages students to delve into the narrative aspects of mask making, exploring themes and characters from Sri Lanka's rich cultural heritage.",
        0,
        "005",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Loshi Perera",
        "Specialized in Handloom",
        "Loshi Perera is a master weaver with decades of experience in handloom textile production. Through her counseling sessions, Loshi imparts practical skills in warp and weft manipulation, as well as business management strategies for aspiring handloom entrepreneurs.",
        1,
        "016",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Nilani Jay",
        "Specialized in Pottery",
        "Nilani Jay is an ardent supporter of the pottery arts. Nilani empowers students to produce expressive and one-of-a-kind ceramic creations by imparting her knowledge of glazing and firing procedures during counseling sessions.",
        4,
        "018",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Mr.Ranil Perera",
        "Specialized in Pottery",
        "Ranil Perera is a master potter renowned for his expertise in traditional Sri Lankan pottery techniques. With a focus on wheel throwing and hand building, Ranil's counseling sessions provide students with hands-on instruction in clay preparation, shaping, and glazing.",
        4,
        "009",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Dili Perera",
        "Specialized in Resin",
        "Dili Perera is a talented resin artist known for her vibrant and abstract resin art creations. Through her counseling sessions, Dili shares her expertise in resin pouring techniques, color blending, and surface finishing, empowering students to create stunning resin art pieces.",
        5,
        "010",
        "hansala.20221827@iit.ac.lk",
        false),
    CounselorModel(
        "Mr.Rukmal Silva",
        "Specialized in Mask",
        "Rukmal Silva is a talented artist specializing in the creation of vibrant Sri Lankan masks for cultural performances and decorative purposes. His counseling sessions focus on the history and symbolism of Sri Lankan masks, inspiring students to create their own unique designs rooted in tradition.",
        0,
        "002",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Anu Guruge",
        "Specialized in Basket",
        "Anu Guruge is an enthusiastic supporter of neighborhood-based basket weaving projects that promote both cultural pride and economic empowerment. She emphasizes in her counseling sessions the social significance of basket weaving and how it can enable people to use their abilities for community development and sustainable lives.",
        6,
        "014",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Chani Perera ",
        "Specialized in Mask",
        "Chani Perera is a highly skilled mask maker known for her expertise in traditional Sri Lankan mask carving techniques. Through her counseling sessions, Chandani shares her knowledge and passion for mask making, guiding students in the intricate process of designing and carving expressive masks.",
        0,
        "001",
        "counselorEmail",
        false),
    CounselorModel(
        "Mr.Sam Kumara",
        "Specialized in Batik",
        "Saman Kumara is a trusted batik counselor renowned for his nurturing guidance. With a keen eye for detail and a heart for fostering creativity, Saman empowers individuals to explore the vibrant world of batik, enriching their lives with its beauty and cultural significance.",
        2,
        "011",
        "hansala.20221827@iit.ac.lk",
        true),
    CounselorModel(
        "Mr.Saman Silva",
        "Specialized in Mask",
        "Saman Silva is a passionate advocate for the preservation of Sri Lanka's mask making heritage. With years of experience as both an artist and educator, Samantha's counseling sessions provide practical instruction in mask carving techniques and encourage students to explore the artistic possibilities of this ancient craft.",
        0,
        "003",
        "hansala.20221827@iit.ac.lk",
        true),
    CounselorModel(
        "Mr.Dinesh Jay",
        "Specialized in Mask",
        "Dinesh Jay is a dedicated mask maker and cultural enthusiast committed to keeping Sri Lanka's mask making traditions alive. His counseling sessions offer a comprehensive introduction to the art of mask making, covering everything from design concepts to carving and painting techniques.",
        0,
        "004",
        "hansala.20221827@iit.ac.lk",
        true),
    CounselorModel(
        "Mr.Indu Perera",
        "Specialized in Basket",
        "Indu Perera is a talented craftswoman who is passionate about passing along her knowledge of basket weaving to others. With years of experience, Indika's counseling sessions emphasize both modern and traditional weaving techniques, inspiring students to discover their creative potential via this age-old trade.",
        6,
        "013",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Mr.Kavin Perera",
        "Specialized in Batik",
        "Renowned for his expertise in traditional Sri Lankan batik techniques, Kavin Perera is dedicated to preserving and promoting the rich heritage of batik art. He offers personalized counseling sessions and workshops for enthusiasts of all levels, guiding them through the intricacies of batik making.",
        2,
        "007",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Mr.Roshan Sri",
        "Specialized in Handloom",
        "Roshan Sri is a master cane weaver with a wealth of experience in traditional Sri Lankan cane work. His counseling sessions and workshops are tailored to individuals of all skill levels, providing hands-on instruction in cane weaving techniques and design.",
        1,
        "006",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Shenu Singh",
        "Specialized in Handloom",
        "Dr. Shenu, a well-known person in Sri Lanka's textile sector, has devoted her professional life to advancing the rich handloom heritage of her nation. As the creator of a prosperous handloom cooperative, she ensures the sustainability of this age-old trade by empowering local weavers with markets, resources, and training.",
        1,
        "019",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Indi Yapa",
        "Specialized in Batik",
        "Indika Senanayake, batik artist Award-winning batik artist Indika Senanayake is renowned for his creative patterns and painstaking craftsmanship. His vivid batik artworks have won him praise from all over the world. He promotes his love of Sri Lankan batik through seminars and exhibitions, encouraging people to discover the creative potential of this adaptable medium.",
        2,
        "020",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Zara Jay",
        "Specialized in Jewellery",
        "Zara Jay is a gifted jewelry designer known for her exquisite creations and meticulous attention to detail. She creates gorgeous jewelry by fusing traditional Sri Lankan patterns with modern aesthetics. She celebrates the island's rich gemstone heritage while advocating for ethical jewelry creation, with an emphasis on sustainable techniques and materials sourced responsibly.",
        3,
        "021",
        "hansalagamage@gmail.com",
        false),
    CounselorModel(
        "Ms.Nilu Withana",
        "Specialized in Pottery",
        "Nilu Withana is a skilled potter who has a great respect for Sri Lanka's pottery tradition. She makes beautiful ceramic objects that capture the natural beauty and cultural diversity of her native nation. He inspires people to rediscover their artistic roots and acquire the craft of pottery-making through his instructional programs and pottery studio.",
        4,
        "022",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Chami Piris",
        "Specialized in Resin",
        "A rising star in Sri Lanka's resin art scene, Chamil Piris experiments with bold colors and experimental techniques to create mesmerizing resin artworks inspired by the country's natural landscapes and cultural motifs. Through his art studio and online tutorials, he shares his passion for resin art, encouraging others to explore their creativity and express themselves through this dynamic medium.",
        5,
        "023",
        "hansalagamage@gmail.com",
        true),
    CounselorModel(
        "Ms.Ama Piris",
        "Specialized in Baskets",
        "Ama Gamage is a talented basket weaver from the rural heartlands of Sri Lanka. She specializes in creating traditional woven baskets utilizing materials that may be found around. He encourages the cultural relevance of basketry while enabling local artists to conserve and transmit this priceless trade to coming generations through his community-based workshops and outreach initiatives.",
        6,
        "024",
        "hansalagamage@gmail.com",
        false),
  ];

  for (var counselor in counselors) {
    FirebaseFirestore.instance.collection("counselorList").doc().set({
      "name": counselor.name,
      "catId": counselor.catId,
      "counselorEmail": counselor.counselorEmail,
      "isMale": counselor.isMale,
      "about": counselor.about,
      "counselorId": counselor.counselorId,
      "specialized": counselor.specialize,
    }).then((value) {});
  }
}

void deleteCounselor() async {
  final collectionRef = FirebaseFirestore.instance.collection("counselorList");
  final querySnapshot = await collectionRef.get();

  for (var doc in querySnapshot.docs) {
    await doc.reference.delete();
  }
}

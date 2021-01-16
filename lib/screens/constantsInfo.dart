// Plant and their indices
// 0 -> Tomato
// 1 -> Strawberry
const Map<int, String> aboutText = {
  0: "DocLeafy is a cross-platform mobile application Artificial Intelligence driven plant disease predictor by a snap of picture or choosing photo from local device of plant’s leaf .",
  1: " By identifying type of disease, the app will provide information, namely potential  name, causes and solutions of the disease"
};

const Map<int, Map<String, int>> diseaseIndexMapping = {
  0: {
    "Bacterial Spot": 0,
    "Early Blight": 1,
    "Late Blight": 2,
    "Leaf Mold": 3,
    "Mosaic Virus": 4,
    "Septoria Leaf Spot": 5,
    "Spider Mites": 6,
    "Target Spot": 7,
    "Yellow Leaf Curl Virus": 8,
    "Healthy": 9
  },
  1: {"Leaf Scorch": 0, "Healthy": 1}
};

// const Map<int, Map<String, String>> projectAPI = {
//   //Index must match categoriesMap

//   0: {
//     "APIEndpoint":
//         "https://southcentralus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/c1e64998-1818-447c-aaaf-c843556c689d/classify/iterations/Iteration1/image",
//     "Prediction-Key": "c7b138e5496f410ca88bafff534d13da",
//     "Content-Type": "application/octet-stream"
//   },
//   1:
//       //placeholder while waiting for real straberry's API Endpoint
//       {
//     "APIEndpoint":
//         "https://southcentralus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/c1e64998-1818-447c-aaaf-c843556c689d/classify/iterations/Iteration1/image",
//     "Prediction-Key": "c7b138e5496f410ca88bafff534d13da",
//     "Content-Type": "application/octet-stream"
//   }
// };
const Map<String, String> projectAPI = {
  "login": "http://20.83.176.144:5000/login"
};

const Map<int, Map<String, String>> plantName = {
  0: {
    "name": "Tomato",
    "imagePath": "assets/images/catergoriesScreen/tomatoIcon.png",
    "apiEndPoint": "http://20.83.176.144:5000/predict-tomato"
  },
  1: {
    "name": "Strawberry",
    "imagePath": "assets/images/catergoriesScreen/strawberryIcon.png",
    "apiEndPoint": "http://20.83.176.144:5000/predict-strawberry"
  }
};

const Map<String, List<Map<String, String>>> diseaseInfos = {
  "Tomato": [
    {
      "name": "Bacterial Spot",
      "intro":
          "Bacterial spot is caused by four species of Xanthomonas and occurs worldwide wherever tomatoes are grown. It is a potentially devastating disease that, in severe cases, can lead to unmarketable fruit and even plant death. Bacterial spot can occur wherever tomatoes are grown, but is found most frequently in warm, wet climates, as well as in greenhouses.",
      "symptomandsigns":
          "Leaf lesions are initially circular and water-soaked and may be surrounded by a faint yellow halo. In general, spots are dark brown to black and circular on leaves and stems. Spots rarely develop to more than 3 mm in diameter. Lesions can coalesce causing a blighted appearance of leaves and a general yellowing may occur on leaves with multiple lesions. Infected pepper leaves drop prematurely; this exposes fruit to the sun and results in sun scalding. Fruit lesions begin as small, slightly raised blisters, which become dark brown, scab-like, and can appear slightly raised as they increase in size.",
      "cause1":
          "These bacterial pathogens can be introduced into a garden on contaminated seed and transplants, which may or may not show symptoms.",
      "cause2":
          "The pathogens enter plants through natural openings (e.g., stomates), as well as through wounds. Disease development is favored by warm (75° to 86°F), wet weather.",
      "cause3":
          "Wind-driven rain can contribute to more severe disease as the pathogens are splashed and spread to healthy leaves and fruit. Bacterial spot pathogens can survive well in tomato debris, but they survive very poorly in soil when not associated with debris.",
      "solution1":
          "A plant with bacterial spot cannot be cured. Remove symptomatic plants from your garden or greenhouse to prevent the spread of bacteria to healthy plants. Burn, bury or hot compost the affected plants and DO NOT eat symptomatic fruit.",
      "solution2":
          "The most effective management strategy is the use of pathogen-free certified seeds and disease-free transplants to prevent the introduction of the pathogen into greenhouses and field production areas. Inspect plants very carefully and reject infected transplants- including your own!",
      "solution3":
          " Do not spray, tie, harvest, or handle wet plants as that can spread the disease.",
      "reference":
          "https://hort.extension.wisc.edu/files/2017/03/Bacterial_Spot_of_Tomato.pdf"
    },
    {
      "name": "Early Blight",
      "intro":
          "Early blight is one of two common fungal diseases that can devastate tomatoes in both commercial settings and home gardens.  Early blight can also be a serious disease on other popular vegetables.",
      "symptomandsigns":
          "Symptoms of early blight first appear at the base of affected plants, where roughly circular brown spots appear on leaves and stems.  As these spots enlarge, concentric rings appear giving the areas a target-like appearance.  Often spots have a yellow halo.  Eventually multiple spots on a single leaf will merge, leading to extensive destruction of leaf tissue.  Early blight can lead to total defoliation of lower leaves and even the death of an infected plant. ",
      "cause1":
          "Early blight is caused by the fungus Alternaria solani, which survives in plant debris or on infected plants.",
      "cause2":
          "Early blight symptoms typically begin as plant canopies start to close. ",
      "cause3":
          "nser foliage leads to high humidity and longer periods of leaf wetness that favor the disease.",
      "solution1":
          "Once symptoms of early blight appear, control is difficult.  Thinning of whole plants or removal of selected branches from individual plants may slow the disease by increasing airflow and thus reducing humidity and the length of time that leaves remain wet.",
      "solution2":
          "Fungicides labeled for use on vegetables and containing copper or chlorothalonil may also provide control of early blight if they are carefully applied very early in the course of the disease (before symptoms develop is best) and on a regular basis throughout the rest of the growing season.  If you decide to use fungicides for disease control, be sure to read and follow all label instructions of the fungicide that you select to ensure that you use the product in the safest and most effective manner possible.",
      "solution3":
          "Early blight is best controlled using preventative measures.  Destroy infested plants by burning or burying them.  Rotate vegetables to different parts of your garden each year to avoid areas where infested debris (and thus spores of Alternaria solani) may be present.  Use early blight-resistant vegetable varieties whenever possible.  Increase spacing between plants to increase airflow and decrease humidity and foliage drying time.  Mulch your garden with approximately one inch of a high quality mulch, but DO NOT over mulch as this can lead to wet soils that can contribute to increased humidity.  Finally, where the disease has been a chronic problem, use of preventative applications of a copper or chlorothalonil-containing fungicide labeled for use on vegetables may be warranted.",
      "reference": "https://hort.extension.wisc.edu/articles/early-blight/"
    },
    {
      "name": "Late Blight",
      "intro":
          "Late blight is a destructive disease of tomatoes and potatoes that can kill plants, and make tomato fruits and potato tubers inedible.",
      "symptomandsigns":
          "On leaves of tomato or potato, late blight begins as palegreen or olive-green areas that quickly enlarge to become brown-black, water-soaked, and oilylooking. Stems can also exhibit dark-brown to black areas. If weather conditions are cool and wet, entire plants can collapse and die from late blight in seven to 10 days. Tomato fruits with late blight develop large, often sunken, golden- to chocolate-brown, firm spots with distinct rings",
      "cause1":
          "Late blight is caused by the fungus-like water mold Phytophthora infestans. There are several variants or strains of this organism. Some variants/strains cause more severe problems on tomatoes.",
      "cause2":
          "P. infestans can be introduced when sporangia (i.e., spore-like structures) of the organism are blown into an area on prevailing winds",
      "cause3":
          "P. infestans can also be introduced on infected plants (e.g., tomato seedlings).",
      "solution1":
          "Plants showing symptoms of late blight cannot be saved and should be disposed of immediately to limit spread of P. infestans to other plants.",
      "solution2":
          "The preferred method of disposal is to pull affected plants (roots and all), and place them in plastic bags. The bags should be left in the sun for a few days to make sure that plants, as well as any P. infestans, are totally killed. Bagged plants then can be put out for trash pickup",
      "solution3":
          "Diseased plants or plant parts (e.g., tomato fruits or potato tubers) should NOT be composted. Healthy-looking fruits from late-blight-affected tomato plants are safe to eat or preserve. Once tomatoes begin to show symptoms of late blight, they should NOT be eaten, nor should they be canned or otherwise preserved.",
      "reference": "https://hort.extension.wisc.edu/articles/late-blight/"
    },
    {
      "name": "Leaf Mold",
      "intro":
          "Leaf mold is a common fungal disease that affects tomatoes that are cultivated in especially humid environments.",
      "symptomandsigns":
          "The first signs of leaf mold are, as you might expect, on the leaves themselves, as the topside of the leaves start to develop small gray, yellow, white, or pale green patches. The underside of the leaves begin to develop a fuzzy texture and turn purple. Oftentimes, the fuzz will appear in an olive green color. The fuzzy texture is actually the spores of the mold fungus. The fruit of the tomato plant is rarely infected by leaf mold. As the disease progresses, the infected tissue of the leaves become yellowish-brown and the leaf starts to wither, eventually falling off of the plant altogether. If not treated, the plant will eventually wither and die.",
      "cause1":
          "The tomato leaf mold fungus is a specific pathogen of tomato plant Lycopersicon, this pathogen has restricted host range (host specific pathogen) that only infects tomatoes, mainly in greenhouses.",
      "cause2":
          "The pathogen is likely to grow in humid and cool conditions. In greenhouses, this disease causes big problems during the fall, in the early winter and spring, due to the high relative humidity of air and the temperature,[3] that are propitious for the leaf mold development.",
      "cause3": " ",
      "solution1":
          "Once you notice the symptoms of leaf mold on your tomato plants, there are plenty of ways to treat the disease. The first step is to allow the plants to dry out completely. If you are growing them in a greenhouse, it’s a good idea to expose them to dry air conditions as soon as you notice the presence of leaf mold.",
      "solution2":
          "If cultivating outdoors, try to keep the leaves as dry as possible during the watering process. If possible, water them early in the morning, so that the plants have plenty of time to dry out before the sun comes out. Alternatively, abandon overhead watering techniques for a drip irrigation system or soaker system, both of which water the soil directly and do not get the leaves of the plant wet in the process.",
      "solution3":
          "Another treatment option is fungicidal sprays. When treating tomato plants with fungicide, be sure to cover all areas of the plant that are above the soil, especially the underside of leaves, where the disease often forms. Calcium chloride-based sprays are recommended for treating leaf mold issues. Organic fungicide options are also available.",
      "reference":
          "https://www.gardeningchannel.com/tomato-diseases-how-to-fight-leaf-mold/"
    },
    {
      "name": "Mosaic Virus",
      "intro":
          "Tomato mosaic virus (ToMV) can cause yellowing and stunting of tomato plants resulting in loss of stand and reduced yield.",
      "symptomandsigns":
          "Mottled light and dark green on leaves. If plants are infected early, they may appear yellow and stunted overall. Leaves may be curled, malformed, or reduced in size. Spots of dead leaf tissue may become apparent with certain cultivars at warm temperatures. ",
      "cause1":
          "Tomato mosaic virus can exist for two years in dry soil or leaf debris, but will only persist one month if soil is moist. The viruses can also survive in infected root debris in the soil for up to two years.",
      "cause2":
          "Seed can be infected and pass the virus to the plant but the disease is usually introduced and spread primarily through human activity. The virus can easily spread between plants on workers' hands, tools, and clothes with normal activities such as plant tying, removing of suckers, and harvest.",
      "cause3":
          "The virus can even survive the tobacco curing process, and can spread from cigarettes and other tobacco products to plant material handled by workers after a cigarette. Proper hand washing and sterilization of tools and equipment is essential to preventing spread this disease.",
      "solution1":
          "Avoid planting in fields where tomato root debris is present, as the virus can survive long-term in roots.",
      "solution2":
          "Wash hands with soap and water before and during the handling of plants to reduce potential spread between plants.",
      "solution3":
          "Disinfect tools regularly — ideally between each plant, as plants can be infected before showing obvious symptoms.",
      "reference":
          "https://extension.umn.edu/diseases/tomato-mosaic-virus-and-tobacco-mosaic-virus"
    },
    {
      "name": "Septoria Leaf Spot",
      "intro":
          "Septoria leaf spot is one of two common fungal diseases that can devastate tomatoes in both commercial settings and home gardens.",
      "symptomandsigns":
          "Symptoms of Septoria leaf spot first appear at the base of affected plants, where small (approximately a quarter inch diameter) spots appear on leaves and stems.  These spots typically have a whitish center and a dark border.  Eventually multiple spots on a single leaf will merge, leading to extensive destruction of leaf tissue.  Septoria leaf spot can lead to total defoliation of lower leaves and even the death of an infected plant.",
      "cause1":
          "Septoria leaf spot is caused by the fungus Septoria lycopersici, which survives in plant debris or on infected plants",
      "cause2":
          "Septoria leaf spot symptoms typically begin as plant canopies start to close.",
      "cause3":
          "Denser foliage leads to high humidity and longer periods of leaf wetness that favor the disease.",
      "solution1":
          "Once symptoms of Septoria leaf spot appear, control is difficult.  Thinning of whole plants or removal of selected branches from individual plants may slow the disease by increasing airflow and thus reducing humidity and the length of time that leaves remain wet.",
      "solution2":
          " Fungicides labeled for use on vegetables and containing copper or chlorothalonil may also provide control of Septoria leaf spot if they are carefully applied very early in the course of the disease (before symptoms develop is best) and on a regular basis throughout the rest of the growing season.",
      "solution3":
          "Septoria leaf spot is best controlled using preventative measures.  Destroy infested plants by burning or burying them.  Rotate vegetables to different parts of your garden each year to avoid areas where infested debris (and thus spores of Septoria lycopersici) may be present.  Use Septoria leaf spot-resistant tomato varieties whenever possible.  Increase spacing between plants to increase airflow and decrease humidity and foliage drying time.  Mulch your garden with approximately one inch of a high quality mulch, but DO NOT overmulch as this can lead to wet soils that can contribute to increased humidity.  Finally, where the disease has been a chronic problem, use of preventative applications of a copper or chlorothalonil-containing fungicide labeled for use on vegetables may be warranted.",
      "reference":
          "https://hort.extension.wisc.edu/articles/septoria-leaf-spot/"
    },
    {
      "name": "Spider Mites",
      "intro":
          "Spider mites are not true insects, but are classed as a type of arachnid, relatives of spiders, ticks and scorpions. Adults are reddish brown or pale in color, oval-shaped and very small.",
      "symptomandsigns":
          "Spider mites are most common in hot, dry conditions, especially where their natural enemies have been killed off by insecticide use. They are also very prolific, which is why heavy infestations often build up unnoticed before plants begin to show damage.",
      "cause1":
          "Hot, dry conditions, especially where their natural enemies have been killed off by insecticide use.",
      "cause2":
          "Dust on leaves, branches and fruit encourages mites. A mid-season hosing (or two!) to remove dust from trees is a worthwhile preventative.",
      "cause3":
          "Spider mites are wind surfers. They disperse over wide areas riding their webbing on the breezes. Careful containment and disposal of infested plants is crucial.",
      "solution1":
          "Dust on leaves, branches and fruit encourages mites. A mid-season hosing (or two!) to remove dust from trees is a worthwhile preventative.",
      "solution2":
          "Water stress makes both trees and garden plants more susceptible to mite infestations. Make sure your plants are properly watered.",
      "solution3":
          "Prune leaves, stems and other infested parts of plants well past any webbing and discard in trash (and not in compost piles). Don’t be hesitant to pull entire plants to prevent the mites spreading to its neighbors.",
      "reference":
          "https://www.planetnatural.com/pest-problem-solver/houseplant-pests/spider-mite-control/"
    },
    {
      "name": "Target Spot",
      "intro":
          "The disease starts on the older leaves and spreads upwards. The first signs are irregular-shaped spots (less than 1 mm) with a yellow margin. Some of the spots enlarge up to 10 mm and show characteristic rings, hence the name of 'target spot' (larger spots Photos 1&2). Spread to all leaflets and to other leaves is rapid, causing the leaves to turn yellow, collapse and die.",
      "symptomandsigns":
          "On leaves, the disease first appears as small, necrotic lesions with  light-brown centers and dark margins. Symptoms often begin deep within the tomato canopy. On fruit, lesions first appear as brown, slightly sunken flecks. As lesions develop, large, pitted areas appear on fruit.",
      "cause1": "Target spot is favored by moderate temperatures (70-80°F).",
      "cause2":
          "The source of the fungus is from other crops, the remains of the previous crop and, perhaps, other host species. The fungus is very common on papaya leaves causing angular, light brown or grey spots, 2 mm diameter, sometimes surrounded by a yellow margin.",
      "cause3": " ",
      "solution1":
          "Do not plant new crops next to older ones that have the disease. Plant as far as possible from papaya, especially if leaves have small angular spots.",
      "solution2":
          "Remove a few branches from the lower part of the plants to allow better airflow at the base Remove and burn the lower leaves as soon as the disease is seen, especially after the lower fruit trusses have been picked.",
      "solution3":
          "Collect and burn as much of the crop as possible when the harvest is complete. Practise crop rotation, leaving 3 years before replanting tomatoes on the same land.",
      "reference":
          "https://www.pestnet.org/fact_sheets/tomato_target_spot_163.htm"
    },
    {
      "name": "Yellow Leaf Curl Virus",
      "intro":
          " Infected tomato plants initially show stunted and erect or upright plant growth; plants infected at an early stage of growth will show severe stunting. However, the most diagnostic symptoms are those in leaves.",
      "symptomandsigns":
          "Leaves of infected plants are small and curl upward; and show strong crumpling and interveinal and marginal yellowing. The internodes of infected plants become shortened and, together with the stunted growth, plants often take on a bushy appearance, which is sometimes referred to as 'bonsai' or broccoli'-like growth. Flowers formed on infected plants commonly do not develop and fall off (abscise). Fruit production is dramatically reduced, particularly when plants are infected at an early age, and it is not uncommon for losses of 100% to be experienced in fields with heavily infected plants.",
      "cause1":
          "The primary way the virus is spread short distances is by Bemisia whitefly species.",
      "cause2":
          "Over long distance, the virus is primarily spread through the movement of infected plants, especially tomato transplants. Because it can take up to 3 weeks for disease symptoms to develop, infected symptomless plants could be unknowingly transported. ",
      "cause3":
          "The virus also can be moved long distance by virus-carrying whiteflies that are transported on tomatoes or other plants (e.g., ornamentals) or via high winds, hurricanes, or tropical storms.",
      "solution1":
          "Select Yellow Leaf Curl Virus-resistant varieties. Use virus- and whitefly-free transplants.",
      "solution2":
          "Remove and destroy old crop residue and volunteers on a regional basis.",
      "solution3":
          "Plant immediately after any tomato-free period or true winter season. Avoid planting new fields near older fields (especially those with Yellow Leaf Curl Virus-infected plants).",
      "reference":
          "https://www2.ipm.ucanr.edu/agriculture/tomato/tomato-yellow-leaf-curl/"
    },
    {
      "name": "Healthy",
      "intro": "This Plant is healthy!",
      "symptomandsigns": "No Symptoms and Signs!",
      "cause1": "",
      "cause2": "This Plant is healthy!",
      "cause3": "",
      "solution1": "",
      "solution2": "This Plant is healthy!",
      "solution3": "",
      "reference": "https://en.wikipedia.org/wiki/Tomato"
    }
  ],
  "Strawberry": [
    {
      "name": "Leaf Scorch",
      "intro":
          "Leaf Scorch is the most common leaf disease in matted row systems but rarely occurs in annual production systems. The pathogen can survive and cause disease at a wide range of temperatures, and has been reported to cause disease year-round on perennial crops. Replanting frequently is recommended in these systems since the disease usually is not severe the first or second year after planting. Because of this, leaf scorch is not a major problem in annual systems.",
      "symptomandsigns":
          "Leaf scorch symptoms are very similar to the early stages of common (Mycosphaerella) leaf spot, with irregular dark purple spots being scattered over the upper leaf surface. As the spots enlarge, they begin to look like drops of tar, and are the accumulations of black fruiting bodies (acervuli) of the fungus. The centers of the spots remain purple (in Mycosphaerella leaf spot they are white) and there is no well-defined lesion border. In heavy infections, these regions coalesce and the tissue between the lesions often takes on a purplish to bright red color that is dependent on cultivar, temperature, or other factors. The leaves eventually turn brown, dry up, and curl at the margins giving the leaf a scorched appearance. ",
      "cause1":
          "In annual production systems, the disease can come on transplants or tips and build up in the plug production phase in the early fall in the field. However, the pathogen does not cause damage the following spring. ",
      "cause2":
          "In the matted row system, the population can build up to damaging levels. Spores are produced in the spring and midsummer on lower leaf surfaces of dead leaves infected in the previous year, and are spread by wind and splashing rain. ",
      "cause3":
          "Disease increase is favored by leaf wetness during warm weather (68-86°F), and is likely to become more significant on older plantings of susceptible varieties. One ascospore generation (the starting sproes) and several overlapping generations of conidia (spores) are produced every year.",
      "solution1":
          "In matted row or perennial strawberry systems, select a planting site with good air drainage and sun exposure. Cultivars resistant to leaf scorch may be available and need to be evaluated for specific horticultural characteristics. Plant new transplants frequently, and allow adequate spacing between them to increase airflow.",
      "solution2":
          "Control weeds. Avoid amendment with supplemental nitrogen in spring, as this may enhance disease. Keep moisture levels down and avoid long wetness per",
      "solution3": " ",
      "reference":
          "https://content.ces.ncsu.edu/leaf-scorch-of-strawberry#:~:text=Diplocarpon%20earlianum%20is%20a%20fungus,residues%20(Heidenreich%20and%20Turechek)"
    },
    {
      "name": "Healthy",
      "intro": "This Plant is healthy!",
      "symptomandsigns": "No Symptoms and Signs!",
      "cause1": "",
      "cause2": "This Plant is healthy!",
      "cause3": "",
      "solution1": "",
      "solution2": "This Plant is healthy!",
      "solution3": "",
      "reference": "https://en.wikipedia.org/wiki/Strawberry"
    }
  ]
};

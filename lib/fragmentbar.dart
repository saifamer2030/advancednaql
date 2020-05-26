import 'package:advancednaql/screen/login.dart';
import 'package:advancednaql/screen/morewidget.dart';
import 'package:advancednaql/screen/neworder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Fragmentnaql extends StatefulWidget {
  int selectPage;

  @override
  _fragmentState createState() => _fragmentState();
}

class _fragmentState extends State<Fragmentnaql> {
  int _currentIndex = 4;

  @override
  void initState() {
    super.initState();

//    _currentIndex = widget.selectPage != null ? widget.selectPage : 4;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      MoreWidget(),
      LoginScreen2(),
      LoginScreen2(),
      LoginScreen2(),
      newOrder(),

    ];
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color(0xffEAEAEA),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: const Color(0xff41a0cb),//727272  41a0cb
            textTheme: Theme.of(context).textTheme.copyWith(
                    caption: new TextStyle(
                  color: const Color(0xff727272),
                ))),
        // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
//fixedColor: const Color(0xffF1AB37),
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          selectedItemColor:const Color(0xff41a0cb),
          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                '<svg viewBox="18.1 20.7 40.7 10.0" '
                '><g transform="translate(9.65, 5.35)"'
                '><path transform="translate(8.53, 0.0)"'
                ' d="M 20.29527473449707 15.32812690734863 C 17.54250144958496 15.32812690734863 15.31406402587891 17.55656623840332 15.31406402587891 20.30934143066406 C 15.31406402587891 23.06211280822754 17.54250144958496 25.29055213928223 20.29527473449707 25.29055213928223 C 23.04805374145508 25.29055213928223 25.27648735046387 23.06211280822754 25.27648735046387 20.30934143066406 C 25.27648735046387 17.55656623840332 23.04805374145508 15.32812690734863 20.29527473449707 15.32812690734863 L 20.29527473449707 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(4.0, 0.0)" d="M 9.48121166229248 15.32812690734863 C 6.728436946868896 15.32812690734863 4.500000953674316 17.55656623840332 4.500000953674316 20.30934143066406 C 4.500000953674316 23.06211280822754 6.728436946868896 25.29055213928223 9.48121166229248 25.29055213928223 C 12.23398590087891 25.29055213928223 14.46242332458496 23.06211280822754 14.46242332458496 20.30934143066406 C 14.46242332458496 17.55656623840332 12.23398590087891 15.32812690734863 9.48121166229248 15.32812690734863 L 9.48121166229248 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(13.09, 0.0)" d="M 31.1374626159668 15.32812690734863 C 28.38468933105469 15.32812690734863 26.15625 17.55656623840332 26.15625 20.30934143066406 C 26.15625 23.06211280822754 28.38468933105469 25.29055213928223 31.1374626159668 25.29055213928223 C 33.89023971557617 25.29055213928223 36.11867523193359 23.06211280822754 36.11867523193359 20.30934143066406 C 36.11867523193359 17.55656623840332 33.89023971557617 15.32812690734863 31.1374626159668 15.32812690734863 L 31.1374626159668 15.32812690734863 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>',
                allowDrawingOutsideViewBox: true,
              ),
              title: Text(
                'المزيد',
                style: TextStyle(
                  fontFamily: 'GESSTwoMedium-Medium',
                  fontSize: 12,

                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                '<svg viewBox="93.3 9.2 38.6 34.0" ><g transform="translate(93.25, 9.17)"><path transform="translate(27.63, 25.05)" d="M 0.2808265686035156 1.68153190612793 C -0.4908466339111328 1.169817924499512 -1.046342849731445 0.8362770080566406 -1.564743995666504 0.4522666931152344 C -5.431625366210938 -2.413386344909668 -9.867380142211914 -3.384211540222168 -14.56948089599609 -3.468433380126953 C -15.78536796569824 -3.490324974060059 -17.0061206817627 -3.548094749450684 -18.21623229980469 -3.465696334838867 C -19.33908081054688 -3.389076232910156 -19.71458053588867 -3.920248985290527 -19.89336013793945 -4.922694206237793 C -20.24879264831543 -6.915423393249512 -20.60848045349121 -8.915755271911621 -21.14208602905273 -10.86470222473145 C -21.45099639892578 -11.99241638183594 -21.03962135314941 -12.39223861694336 -20.10467147827148 -12.78537273406982 C -17.91522407531738 -13.70542240142822 -15.71878242492676 -14.62790298461914 -13.60838508605957 -15.71183395385742 C -10.32254028320312 -17.39929962158203 -7.831779479980469 -19.94417953491211 -6.092321872711182 -23.21391296386719 C -5.888609409332275 -23.59701156616211 -5.632600784301758 -23.95183563232422 -5.236730575561523 -24.57999801635742 C -3.381734848022461 -15.75105667114258 -1.587244033813477 -7.209743022918701 0.2808265686035156 1.68153190612793 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(-26.99, 26.12)" d="M 64.11721038818359 -19.19545745849609 C 65.75115966796875 -15.57698249816895 65.97068786621094 -11.47963237762451 64.91989135742188 -7.651061058044434 C 64.58939361572266 -6.44611930847168 64.22027587890625 -5.121079444885254 63.83657073974609 -3.799990653991699 C 63.62495422363281 -3.071796417236328 63.24915313720703 -2.256339073181152 62.24062347412109 -2.66193962097168 C 61.33699035644531 -3.025580406188965 61.42212677001953 -3.779315948486328 61.68695068359375 -4.583521842956543 C 62.19136810302734 -6.115315914154053 62.69304656982422 -7.652276992797852 63.09226226806641 -9.213563919067383 C 64.42429351806641 -14.42403221130371 62.66933441162109 -18.73695182800293 59.12139511108398 -22.49924087524414 C 58.53275680541992 -23.12314605712891 57.79544067382812 -23.64823913574219 57.36430358886719 -24.36244583129883 C 57.12380218505859 -24.76105308532715 57.26883316040039 -25.49532890319824 57.46250915527344 -25.9918384552002 C 57.5214958190918 -26.14325523376465 58.4798583984375 -26.19919967651367 58.75745391845703 -25.97146797180176 C 61.08980560302734 -24.0580940246582 62.90801239013672 -21.87290191650391 64.11721038818359 -19.19545745849609 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(32.05, -30.64)" d="M -19.03448867797852 63.43915176391602 C -21.22636985778809 63.8812370300293 -23.181396484375 64.30690002441406 -25.1528434753418 64.63648986816406 C -25.4322624206543 64.68331909179688 -26.01269149780273 64.31450653076172 -26.07684516906738 64.0472412109375 C -26.6402473449707 61.69999694824219 -27.15682220458984 59.33937072753906 -27.58705139160156 56.96445083618164 C -27.66519165039062 56.5327033996582 -27.36752891540527 55.66950988769531 -27.10513496398926 55.60931015014648 C -26.39092636108398 55.4460334777832 -25.22824859619141 55.29674530029297 -24.90504455566406 55.68836212158203 C -22.89528656005859 58.12408828735352 -21.06674385070801 60.71001815795898 -19.03448867797852 63.43915176391602 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(42.24, -4.8)" d="M -37.83663177490234 18.30400085449219 C -37.21515655517578 21.30252075195312 -36.625 24.15114593505859 -35.99774932861328 27.17976570129395 C -36.91627502441406 27.38834381103516 -37.77703857421875 27.71124267578125 -38.6520881652832 27.75502586364746 C -40.24347686767578 27.83468627929688 -41.20700073242188 26.94838523864746 -41.48490142822266 25.40564727783203 C -41.66398620605469 24.41232299804688 -41.86222457885742 23.42203903198242 -42.08296203613281 22.43722724914551 C -42.58373260498047 20.20308303833008 -41.92455291748047 19.13678741455078 -39.68402862548828 18.63115692138672 C -39.14890289306641 18.51044845581055 -38.6025276184082 18.43808555603027 -37.83663177490234 18.30400085449219 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(-18.65, 15.43)" d="M 51.42835998535156 -0.9512557983398438 C 51.4307975769043 -0.8609528541564941 51.42835998535156 -0.9512557983398438 51.39400482177734 -0.6849088668823242 C 51.24897766113281 0.4379396438598633 50.57186126708984 2.308746814727783 49.92514801025391 4.166174411773682 C 49.90113067626953 4.235497951507568 49.86190795898438 4.299347400665283 49.81113052368164 4.359245777130127 C 49.34168243408203 4.913828372955322 48.4085578918457 4.581200122833252 48.33710861206055 3.857869625091553 C 48.32190704345703 3.706454753875732 48.33072662353516 3.563855648040771 48.37906646728516 3.436764240264893 C 49.32070159912109 0.9602937698364258 50.34047698974609 -1.51952075958252 49.15864562988281 -4.140413761138916 C 48.19420623779297 -6.279086589813232 47.9451904296875 -6.619316577911377 46.55660247802734 -8.083914756774902 C 45.82293701171875 -8.857717514038086 45.15555191040039 -9.606283187866211 45.2601432800293 -9.896648406982422 C 45.58425903320312 -10.79693412780762 45.95975494384766 -10.98848533630371 46.6095085144043 -10.47707557678223 C 49.39063262939453 -8.288234710693359 51.30826568603516 -5.593154907226562 51.42835998535156 -0.9512557983398438 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></g></svg>',
                allowDrawingOutsideViewBox: true,
              ),
              title: Text(
                'التنبيهات',
                style: TextStyle(
                  fontFamily: 'GESSTwoMedium-Medium',
                  fontSize: 12,
                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                '<svg viewBox="188.2 13.4 30.0 27.5" ><path transform="translate(185.25, 8.91)" d="M 18 32.02500152587891 L 15.82499980926514 30.04500198364258 C 8.100000381469727 23.04000091552734 3 18.42000007629395 3 12.75 C 3 8.130000114440918 6.630000114440918 4.5 11.25 4.5 C 13.85999965667725 4.5 16.36499977111816 5.715000152587891 18 7.635000228881836 C 19.63500022888184 5.715000152587891 22.13999938964844 4.5 24.75 4.5 C 29.3700008392334 4.5 33 8.130000114440918 33 12.75 C 33 18.42000007629395 27.89999961853027 23.04000091552734 20.17499923706055 30.05999946594238 L 18 32.02500152587891 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
              ),
              title: Text(
                'المفضلة',
                style: TextStyle(
                  fontFamily: 'GESSTwoMedium-Medium',
                  fontSize: 12,
                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                '<svg viewBox="264.1 11.2 44.0 32.0" ><g transform="translate(264.15, 11.17)"><path transform="translate(79.0, 50.0)" d="M -79 -28.66666412353516 L -79 -50 C -68.44297790527344 -50 -57.88573837280273 -50 -47.3285026550293 -50 C -47.30214691162109 -49.75338745117188 -47.25304412841797 -49.50677108764648 -47.25283050537109 -49.26015853881836 C -47.24560546875 -42.5461311340332 -47.2430534362793 -35.83189392089844 -47.24560546875 -29.11765289306641 C -47.24560546875 -29.02591705322266 -47.32255172729492 -28.93418502807617 -47.41288757324219 -28.73237228393555 L -48.63468551635742 -28.73237228393555 C -58.26260757446289 -28.73237228393555 -67.89053344726562 -28.73343849182129 -77.51845550537109 -28.72959899902344 C -78.01222991943359 -28.72938537597656 -78.5062255859375 -28.68863868713379 -79 -28.66666412353516 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(64.29, 4.77)" d="M -20.29224395751953 22.96240425109863 C -20.46930694580078 22.96432495117188 -20.64721870422363 22.9555778503418 -20.82343292236328 22.96987152099609 C -22.2543888092041 23.08677673339844 -23.42453384399414 23.09211158752441 -24.14022445678711 21.31739044189453 C -24.78895950317383 19.70885848999023 -26.47520065307617 19.06459045410156 -28.22414779663086 19.21349716186523 C -30.10041809082031 19.37306976318359 -31.39788627624512 20.44037628173828 -32.19413757324219 22.1670970916748 C -32.34760665893555 22.49989700317383 -32.77230072021484 22.92784309387207 -33.07902526855469 22.93381690979004 C -36.08718109130859 22.99120330810547 -39.0970344543457 22.96837615966797 -42.16534423828125 22.96837615966797 C -43.06978988647461 19.90640449523926 -45.2929573059082 19.01168441772461 -48.22331619262695 19.15930938720703 C -50.06068801879883 19.25168228149414 -51.90656280517578 19.16506958007812 -53.74818420410156 19.18362998962402 C -54.23834991455078 19.18875122070312 -54.73361587524414 19.25381851196289 -55.21612548828125 19.3453369140625 C -56.76526641845703 19.63866996765137 -57.80128860473633 20.60251235961914 -58.46086120605469 21.98789596557617 C -58.95506286621094 23.0257625579834 -58.92721939086914 23.03920364379883 -60.31821441650391 22.86427116394043 C -60.31821441650391 21.4443244934082 -60.33670806884766 20.00027084350586 -60.29249572753906 18.558349609375 C -60.28760528564453 18.39621734619141 -59.94644546508789 18.14939117431641 -59.73027038574219 18.10906982421875 C -59.31832885742188 18.03227043151855 -58.88428115844727 18.07067108154297 -58.45915985107422 18.07067108154297 C -49.95780944824219 18.06981658935547 -41.45666885375977 18.07024383544922 -32.95531463623047 18.07045745849609 C -32.57546997070312 18.07045745849609 -32.19583892822266 18.07045745849609 -31.66167449951172 18.07045745849609 L -31.66167449951172 7.561443328857422 C -29.0072193145752 7.561443328857422 -26.49093055725098 7.374989986419678 -24.0184268951416 7.62480354309082 C -22.26650619506836 7.801656723022461 -21.21624374389648 9.441336631774902 -21.19392395019531 11.24229621887207 C -21.16926765441895 13.23291015625 -21.15800285339355 15.22459030151367 -21.20221519470215 17.21456336975098 C -21.2181568145752 17.93669700622559 -20.98008918762207 18.19290924072266 -20.29224395751953 18.05573654174805 L -20.29224395751953 22.96240425109863 Z M -27.96354675292969 12.00837707519531 C -27.96354675292969 12.82224273681641 -27.93612861633301 13.63739013671875 -27.97247695922852 14.44976329803467 C -27.99925994873047 15.05115032196045 -27.76799201965332 15.2734432220459 -27.17516136169434 15.26043033599854 C -25.97695922851562 15.23418998718262 -24.77684211730957 15.22778987884521 -23.57906532287598 15.26256370544434 C -22.96795272827148 15.28048419952393 -22.77346038818359 15.03451061248779 -22.78833961486816 14.45168304443359 C -22.81554794311523 13.39077663421631 -22.79237937927246 12.32859039306641 -22.79556846618652 11.26704406738281 C -22.80088233947754 9.431949615478516 -23.70490074157715 8.736483573913574 -26.11554908752441 8.756110191345215 C -28.29535484313965 8.77381706237793 -27.92890167236328 8.453390121459961 -27.96248435974121 10.94661712646484 C -27.96737480163574 11.300537109375 -27.9631233215332 11.65445709228516 -27.96354675292969 12.00837707519531 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(24.35, -46.5)" d="M -7.558844089508057 78.49517059326172 C -7.808390140533447 78.26519775390625 -8.037104606628418 78.00621032714844 -8.310882568359375 77.81058502197266 C -9.402805328369141 77.03085327148438 -9.850032806396484 75.78157043457031 -9.461047172546387 74.52632141113281 C -9.134342193603516 73.47203063964844 -8.041356086730957 72.68674468994141 -6.869297981262207 72.66391754150391 C -5.642187118530273 72.64002990722656 -4.581297874450684 73.37496185302734 -4.177858352661133 74.52802276611328 C -3.774844169616699 75.68045043945312 -4.19316291809082 76.95234680175781 -5.217916488647461 77.74253082275391 C -5.517414093017578 77.97357177734375 -5.787365913391113 78.24322509765625 -6.070921421051025 78.49517059326172 L -7.558844089508057 78.49517059326172 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(-45.42, -45.25)" d="M 81.73974609375 76.629638671875 C 80.24502563476562 76.59892272949219 78.97837829589844 75.29588317871094 79.00898742675781 73.82004547119141 C 79.04087066650391 72.27572631835938 80.35173034667969 71.03839111328125 81.91511535644531 71.07678985595703 C 83.39920806884766 71.11326599121094 84.68966674804688 72.43338012695312 84.66564178466797 73.89022827148438 C 84.64056396484375 75.41065979003906 83.30440521240234 76.66164398193359 81.73974609375 76.629638671875 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(52.21, -45.25)" d="M -42.20886611938477 76.63128662109375 C -43.7174072265625 76.61294555664062 -44.9991455078125 75.32035827636719 -44.97980117797852 73.83726501464844 C -44.95939636230469 72.28952789306641 -43.64130783081055 71.04238128662109 -42.06368637084961 71.07822418212891 C -40.57215118408203 71.11214447021484 -39.27850723266602 72.46062469482422 -39.33079528808594 73.92707824707031 C -39.38372421264648 75.41443634033203 -40.69841003417969 76.64984893798828 -42.20886611938477 76.63128662109375 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></g></svg>',
                allowDrawingOutsideViewBox: true,
              ),
              title: Text(
                'طلباتي ',
                style: TextStyle(
                  fontFamily: 'GESSTwoMedium-Medium',
                  fontSize: 12,
                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                '<svg viewBox="349.8 9.2 39.7 33.7" ><path transform="translate(346.76, 4.67)" d="M 18.88235092163086 38.24999618530273 L 18.88235092163086 26.33823585510254 L 26.82352828979492 26.33823585510254 L 26.82352828979492 38.24999618530273 L 36.75 38.24999618530273 L 36.75 22.36764526367188 L 42.70588302612305 22.36764526367188 L 22.85293960571289 4.499999523162842 L 3 22.36764526367188 L 8.955881118774414 22.36764526367188 L 8.955881118774414 38.24999618530273 L 18.88235092163086 38.24999618530273 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
              ),
              title: Text(
                'الرئيسية',
                style: TextStyle(
                  fontFamily: 'GESSTwoMedium-Medium',
                  fontSize: 12,
                  height: 1.1666666666666667,
                ),
              ),
            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('الرئيسية'),
//            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
